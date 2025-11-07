# Agent Guidelines

These instructions apply to the entire repository.

## Swift source code
- Use four spaces for indentation and keep trailing whitespace out of committed files.
- Favor `struct` for value types and `final class` for reference types unless there's a clear need for inheritance.
- When you introduce new dependencies for a feature, expose them behind lightweight protocols in `BreatheCoach/BreatheCoach/Core` so they can be injected for previews and tests.
- Keep SwiftUI previews (the `#Preview` blocks) compiling after your changes.
- When adding UI, prefer to pull colors, fonts, spacing, and radii from the shared `Theme` environment instead of hard-coding values.
- Place new shared view components in `BreatheCoach/BreatheCoach/DesignSystem` and feature-specific views under `BreatheCoach/BreatheCoach/Features/<FeatureName>`.

## Resources
- Store new asset files under `BreatheCoach/BreatheCoach/Resources` and reference them through SwiftUI.
- Localized copy should go through the existing strings file if one exists; otherwise create one in the same folder as the feature and document new keys in the PR description.

## Documentation
- Wrap prose in Markdown files at roughly 100 characters per line and use sentence-case headings.
- Link to other docs within the repo using relative paths.

## Testing and build expectations
- Before committing Swift changes, attempt to build with `xcodebuild -scheme BreatheCoach -destination "platform=iOS Simulator,name=iPhone 15" build` when Xcode tooling is available.
- If the environment does not provide Xcode, call out the limitation in your final message instead of skipping the note entirely.

## Pull request notes
- Summaries should highlight the user-facing impact first, followed by internal refactors.
- Mention any testing you could not complete due to tooling gaps so reviewers know what still needs verification.
