import SwiftUI

public enum DesignTokens {
    public enum Font: String, CaseIterable {
        case title
        case body
        case caption
    }

    public enum Color: String, CaseIterable {
        case background
        case surface
        case accent
        case onAccent
        case primaryText
        case secondaryText
    }

    public enum Spacing: String, CaseIterable {
        case xs
        case s
        case m
        case l
        case xl
    }

    public enum Radius: String, CaseIterable {
        case s
        case m
        case l
    }
}
