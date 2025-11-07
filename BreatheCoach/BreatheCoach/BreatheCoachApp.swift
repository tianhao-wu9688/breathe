import SwiftUI

@main
struct BreatheCoachApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel())
                .environment(\.theme, Theme.default)
        }
    }
}
