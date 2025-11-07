# BreatheCoach

BreatheCoach is an iOS 17 SwiftUI application scaffolded to help users practice mindful breathing sessions. The project is organized around modular layers so that features, shared services, and visual styling are easy to evolve as the experience grows. Swift Charts is linked through Swift Package Manager to support breathing visualizations.

## Project structure

- **BreatheCoach/** – Xcode project containing the SwiftUI app target.
  - **Core/** – Reusable services and utilities such as `SessionRepository`, `SettingsStore`, `BreathingTimer`, `HapticsManager`, and `AudioCuePlayer` with protocol-first designs for testability.
  - **DesignSystem/** – Reusable appearance primitives including the `Theme` struct and `DesignTokens` enum for typography, color, and spacing that back SwiftUI previews.
  - **Features/** – User-facing experiences; currently includes the `Home` feature with a view and view model prepared for session control and visualization.
  - **Resources/** – Shared assets and app metadata.

## Running the app

1. Open `BreatheCoach.xcodeproj` in Xcode 15 or newer.
2. Select the **BreatheCoach** scheme and choose an iOS 17 simulator or device.
3. Press **⌘R** to build and launch the app. Use the provided previews in SwiftUI files to explore theming scenarios without running the full application.

## Testing strategy

Although automated tests are not yet included, the architecture is structured around protocols to make unit and UI testing straightforward. Recommended approaches include:

- **Simulator or device runs:** Start and stop sessions in the app to observe how `HomeViewModel` drives `BreathingTimer`, `HapticsManager`, and `AudioCuePlayer`. Hardware devices surface the real haptic and audio feedback; simulators can be inspected through breakpoints or logs.
- **SwiftUI previews:** Exercise the previews that accompany `HomeView`, the theme showcase, and other UI components to validate layout, Dynamic Type, and high-contrast behavior quickly.
- **Unit tests with mocks:** Inject mock implementations of `SessionRepository`, `BreathingTimer`, `HapticsManager`, and `AudioCuePlayer` to assert that the view model schedules phases, persists sessions, and issues cues correctly. You can create test suites with XCTest by targeting the Core and Features layers without relying on timers or hardware effects.
- **UI tests:** Use Xcode UI tests to trigger the Start/Stop controls (accessible via identifiers) and verify UI updates or repository interactions with mocked dependencies.
- **Additional diagnostics:** Add temporary logging or analytics hooks around timer callbacks and repository state changes to audit the breathing cadence while developing.

These practices combine manual interaction, preview-based validation, and protocol-driven testing to ensure the breathing experience behaves as expected as the project evolves.
