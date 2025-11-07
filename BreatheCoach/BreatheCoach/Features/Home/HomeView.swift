import SwiftUI
import Charts

final class HomeViewModel: ObservableObject {
    @Published var sessionDuration: TimeInterval = 300
    @Published var breathsPerMinute: Int = 6

    struct BreathSample: Identifiable {
        let id = UUID()
        let timestamp: Double
        let depth: Double
    }

    private let timer: BreathingTimerProtocol
    private let haptics: HapticsManaging
    private let audio: AudioCuePlaying
    private let sessionRepository: SessionRepository

    init(
        timer: BreathingTimerProtocol = BreathingTimer(),
        haptics: HapticsManaging = HapticsManager(),
        audio: AudioCuePlaying = AudioCuePlayer(),
        sessionRepository: SessionRepository = InMemorySessionRepository()
    ) {
        self.timer = timer
        self.haptics = haptics
        self.audio = audio
        self.sessionRepository = sessionRepository
    }

    var breathsPreviewData: [BreathSample] {
        let points = 20
        return (0..<points).map { index in
            let progress = Double(index) / Double(points - 1)
            let phase = sin(progress * .pi)
            return BreathSample(timestamp: progress * Double(points - 1), depth: max(phase, 0))
        }
    }

    func startSession() {
        timer.scheduleBreathCycle(duration: 60.0 / Double(breathsPerMinute)) { [weak self] phase in
            guard let self else { return }
            switch phase {
            case .inhale:
                haptics.playInhale()
                audio.playCue(for: .inhale)
            case .exhale:
                haptics.playExhale()
                audio.playCue(for: .exhale)
            case .hold:
                haptics.playHold()
                audio.playCue(for: .hold)
            }
        }
        sessionRepository.startSession(duration: sessionDuration)
    }

    func stopSession() {
        timer.invalidate()
        audio.stop()
        sessionRepository.endSession()
    }
}

struct HomeView: View {
    @Environment(\.theme) private var theme
    @StateObject var viewModel: HomeViewModel

    var body: some View {
        VStack(spacing: theme.spacing(.xl)) {
            Text("Breathe Coach")
                .font(theme.font(.title))
                .foregroundStyle(theme.color(.primaryText))
                .accessibilityAddTraits(.isHeader)

            Text("Session Duration: \(Int(viewModel.sessionDuration / 60)) min")
                .font(theme.font(.body))
                .foregroundStyle(theme.color(.secondaryText))

            Chart(viewModel.breathsPreviewData) { sample in
                LineMark(
                    x: .value("Time", sample.timestamp),
                    y: .value("Breath", sample.depth)
                )
                .foregroundStyle(theme.color(.accent))
                .interpolationMethod(.monotone)
            }
            .frame(height: 160)
            .accessibilityHidden(true)

            Button(action: viewModel.startSession) {
                Text("Start Session")
                    .padding(theme.spacing(.m))
                    .frame(maxWidth: .infinity)
                    .background(theme.color(.accent))
                    .foregroundStyle(theme.color(.onAccent))
                    .clipShape(RoundedRectangle(cornerRadius: theme.radius(.l)))
            }
            .buttonStyle(.plain)
            .accessibilityIdentifier("startSessionButton")

            Button(action: viewModel.stopSession) {
                Text("Stop Session")
                    .padding(theme.spacing(.m))
                    .frame(maxWidth: .infinity)
                    .background(theme.color(.surface))
                    .foregroundStyle(theme.color(.accent))
                    .overlay(
                        RoundedRectangle(cornerRadius: theme.radius(.l))
                            .stroke(theme.color(.accent), lineWidth: 2)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: theme.radius(.l)))
            }
            .buttonStyle(.plain)
            .accessibilityIdentifier("stopSessionButton")
            Spacer()
        }
        .padding(theme.spacing(.l))
        .background(theme.color(.background))
    }
}

#Preview("Standard") {
    HomeView(viewModel: HomeViewModel())
        .environment(\.theme, Theme.default)
}

#Preview("High Contrast", traits: .init([.highContrast])) {
    HomeView(viewModel: HomeViewModel())
        .environment(\.theme, Theme.highContrast)
}

#Preview("Dynamic Type") {
    HomeView(viewModel: HomeViewModel())
        .environment(\.theme, Theme.default)
        .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
}
