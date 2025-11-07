import Foundation

public protocol SessionRepository {
    func startSession(duration: TimeInterval)
    func endSession()
    func currentSession() -> Session?
}

public struct Session: Identifiable, Equatable {
    public let id: UUID
    public let startDate: Date
    public let duration: TimeInterval

    public init(id: UUID = UUID(), startDate: Date = .now, duration: TimeInterval) {
        self.id = id
        self.startDate = startDate
        self.duration = duration
    }
}

public final class InMemorySessionRepository: SessionRepository {
    private var activeSession: Session?

    public init() {}

    public func startSession(duration: TimeInterval) {
        activeSession = Session(duration: duration)
    }

    public func endSession() {
        activeSession = nil
    }

    public func currentSession() -> Session? {
        activeSession
    }
}
