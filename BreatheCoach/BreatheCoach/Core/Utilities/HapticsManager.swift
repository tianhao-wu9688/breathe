import UIKit

public protocol HapticsManaging {
    func playInhale()
    func playExhale()
    func playHold()
}

public final class HapticsManager: HapticsManaging {
    private let notificationGenerator = UINotificationFeedbackGenerator()
    private let impactGenerator = UIImpactFeedbackGenerator(style: .medium)

    public init() {
        notificationGenerator.prepare()
        impactGenerator.prepare()
    }

    public func playInhale() {
        impactGenerator.impactOccurred(intensity: 0.7)
    }

    public func playExhale() {
        impactGenerator.impactOccurred(intensity: 0.4)
    }

    public func playHold() {
        notificationGenerator.notificationOccurred(.success)
    }
}

public final class MockHapticsManager: HapticsManaging {
    public init() {}
    public private(set) var inhaleCount = 0
    public private(set) var exhaleCount = 0
    public private(set) var holdCount = 0

    public func playInhale() { inhaleCount += 1 }
    public func playExhale() { exhaleCount += 1 }
    public func playHold() { holdCount += 1 }
}
