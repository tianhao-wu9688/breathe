import AudioToolbox

public enum BreathingPhase {
    case inhale
    case exhale
    case hold
}

public protocol AudioCuePlaying {
    func playCue(for phase: BreathingPhase)
    func stop()
}

public final class AudioCuePlayer: AudioCuePlaying {
    public init() {}

    public func playCue(for phase: BreathingPhase) {
        let systemSoundID: SystemSoundID
        switch phase {
        case .inhale:
            systemSoundID = 1104
        case .exhale:
            systemSoundID = 1106
        case .hold:
            systemSoundID = 1110
        }
        AudioServicesPlaySystemSound(systemSoundID)
    }

    public func stop() {}
}

public final class MockAudioCuePlayer: AudioCuePlaying {
    public init() {}
    public private(set) var playedPhases: [BreathingPhase] = []

    public func playCue(for phase: BreathingPhase) {
        playedPhases.append(phase)
    }

    public func stop() {}
}
