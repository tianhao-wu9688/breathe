import Foundation

public protocol SettingsStore {
    var preferredSessionDuration: TimeInterval { get set }
    var preferredBreathsPerMinute: Int { get set }
}

public final class UserDefaultsSettingsStore: SettingsStore {
    private enum Keys {
        static let sessionDuration = "preferredSessionDuration"
        static let breathsPerMinute = "preferredBreathsPerMinute"
    }

    private let defaults: UserDefaults

    public init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    public var preferredSessionDuration: TimeInterval {
        get { defaults.double(forKey: Keys.sessionDuration).nonZeroOrDefault(300) }
        set { defaults.set(newValue, forKey: Keys.sessionDuration) }
    }

    public var preferredBreathsPerMinute: Int {
        get {
            let value = defaults.integer(forKey: Keys.breathsPerMinute)
            return value == 0 ? 6 : value
        }
        set {
            defaults.set(newValue, forKey: Keys.breathsPerMinute)
        }
    }
}

private extension Double {
    func nonZeroOrDefault(_ defaultValue: Double) -> Double {
        self == 0 ? defaultValue : self
    }
}
