import SwiftUI

public struct Theme {
    private let fonts: [DesignTokens.Font: Font]
    private let colors: [DesignTokens.Color: Color]
    private let spacings: [DesignTokens.Spacing: CGFloat]
    private let radii: [DesignTokens.Radius: CGFloat]

    public init(
        fonts: [DesignTokens.Font: Font],
        colors: [DesignTokens.Color: Color],
        spacings: [DesignTokens.Spacing: CGFloat],
        radii: [DesignTokens.Radius: CGFloat]
    ) {
        self.fonts = fonts
        self.colors = colors
        self.spacings = spacings
        self.radii = radii
    }

    public func font(_ token: DesignTokens.Font) -> Font {
        fonts[token] ?? .body
    }

    public func color(_ token: DesignTokens.Color) -> Color {
        colors[token] ?? .primary
    }

    public func spacing(_ token: DesignTokens.Spacing) -> CGFloat {
        spacings[token] ?? 8
    }

    public func radius(_ token: DesignTokens.Radius) -> CGFloat {
        radii[token] ?? 8
    }
}

public extension Theme {
    static let `default` = Theme(
        fonts: [
            .title: Font.system(.largeTitle, design: .rounded).weight(.bold),
            .body: Font.system(.body, design: .rounded),
            .caption: Font.system(.caption, design: .rounded)
        ],
        colors: [
            .background: Color(.systemGroupedBackground),
            .surface: Color(.secondarySystemBackground),
            .accent: Color(.systemTeal),
            .onAccent: .white,
            .primaryText: .primary,
            .secondaryText: .secondary
        ],
        spacings: [
            .xs: 4,
            .s: 8,
            .m: 12,
            .l: 20,
            .xl: 28
        ],
        radii: [
            .s: 6,
            .m: 12,
            .l: 20
        ]
    )

    static let highContrast = Theme(
        fonts: [
            .title: Font.system(.largeTitle, design: .rounded).weight(.black),
            .body: Font.system(.title3, design: .rounded).weight(.semibold),
            .caption: Font.system(.headline, design: .rounded)
        ],
        colors: [
            .background: .black,
            .surface: Color(white: 0.1),
            .accent: .yellow,
            .onAccent: .black,
            .primaryText: .white,
            .secondaryText: Color(white: 0.8)
        ],
        spacings: [
            .xs: 6,
            .s: 10,
            .m: 16,
            .l: 24,
            .xl: 32
        ],
        radii: [
            .s: 8,
            .m: 14,
            .l: 24
        ]
    )
}

private struct ThemeKey: EnvironmentKey {
    static let defaultValue: Theme = .default
}

public extension EnvironmentValues {
    var theme: Theme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}

struct ThemeShowcase: View {
    let theme: Theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spacing(.m)) {
            Text("Title Style")
                .font(theme.font(.title))
            Text("Body Style")
                .font(theme.font(.body))
            Text("Caption Style")
                .font(theme.font(.caption))
            HStack(spacing: theme.spacing(.s)) {
                Capsule()
                    .fill(theme.color(.accent))
                    .frame(width: 80, height: 16)
                Capsule()
                    .fill(theme.color(.surface))
                    .overlay(
                        Capsule()
                            .stroke(theme.color(.accent), lineWidth: 2)
                    )
                    .frame(width: 80, height: 16)
            }
        }
        .padding(theme.spacing(.l))
        .background(theme.color(.surface))
        .clipShape(RoundedRectangle(cornerRadius: theme.radius(.m)))
        .foregroundStyle(theme.color(.primaryText))
    }
}

#Preview("Default Theme") {
    ThemeShowcase(theme: .default)
        .environment(\.theme, .default)
        .previewLayout(.sizeThatFits)
}

#Preview("High Contrast Theme", traits: .init([.highContrast])) {
    ThemeShowcase(theme: .highContrast)
        .environment(\.theme, .highContrast)
        .previewLayout(.sizeThatFits)
}

#Preview("Dynamic Type", traits: .init([.accessibilityExtraExtraExtraLarge])) {
    ThemeShowcase(theme: .default)
        .environment(\.theme, .default)
        .previewLayout(.sizeThatFits)
}
