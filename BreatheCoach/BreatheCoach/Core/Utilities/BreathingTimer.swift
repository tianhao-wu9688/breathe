import Foundation

public enum BreathingTimerPhase {
    case inhale
    case exhale
    case hold
}

public protocol BreathingTimerProtocol {
    func scheduleBreathCycle(duration: TimeInterval, handler: @escaping (BreathingTimerPhase) -> Void)
    func invalidate()
}

public final class BreathingTimer: BreathingTimerProtocol {
    private var timer: Timer?

    public init() {}

    public func scheduleBreathCycle(duration: TimeInterval, handler: @escaping (BreathingTimerPhase) -> Void) {
        timer?.invalidate()
        var phaseIndex = 0
        let phases: [BreathingTimerPhase] = [.inhale, .hold, .exhale]
        timer = Timer.scheduledTimer(withTimeInterval: duration, repeats: true) { [weak self] _ in
            guard let self else { return }
            handler(phases[phaseIndex % phases.count])
            phaseIndex += 1
        }
        timer?.fire()
    }

    public func invalidate() {
        timer?.invalidate()
        timer = nil
    }
}

public final class MockBreathingTimer: BreathingTimerProtocol {
    public private(set) var scheduledPhases: [BreathingTimerPhase] = []
    public init() {}

    public func scheduleBreathCycle(duration: TimeInterval, handler: @escaping (BreathingTimerPhase) -> Void) {
        scheduledPhases = [.inhale, .hold, .exhale]
        scheduledPhases.forEach { handler($0) }
    }

    public func invalidate() {}
}
