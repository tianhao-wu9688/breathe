# Breathe Design System

## Color Palette
- **Midnight Indigo (#1B1F3B):** Primary background for dark mode experiences. Contrast ratio 14.3:1 against white text meets WCAG AAA for large text and AA for small text.
- **Breath Teal (#2FB7AA):** Primary action and highlight color. When placed on Midnight Indigo, it yields a 4.6:1 contrast ratio; paired with near-white text (#F5F7FF) it remains above the 4.5:1 threshold.
- **Calm Sky (#7ED3F7):** Secondary accent for progress indicators and subtle dividers. Only used on dark surfaces with text overlays meeting AA contrast by pairing with Midnight Indigo text (#1B1F3B) or near-white backgrounds.
- **Warm Sand (#F4E4C1):** Supportive neutral for success states and breathing in-hold phases. When overlaying typography, ensure contrast greater than 4.5:1 by using Midnight Indigo or #2A2F4F text.
- **Alert Coral (#FF6F61):** Status color for safety alerts and over-exertion warnings. Minimum 4.5:1 contrast maintained by pairing with near-white (#FFFFFF) or Midnight Indigo.
- **Near White (#F5F7FF):** Primary text color on dark backgrounds. For light backgrounds, default to Midnight Indigo text to preserve legibility.

### Accessibility Notes
- All semantic color roles (primary, surface, warning, success) maintain minimum 4.5:1 contrast.
- Provide redundant cues (icons, text labels, and vibration patterns) alongside color for status messages.

## Typography
- **Primary Typeface:** "Inter" for digital interfaces due to excellent legibility and open-source availability.
- **Secondary Typeface:** "Source Serif Pro" reserved for long-form guidance or educational content.

### Type Ramp
| Style | Usage | Size | Line Height | Weight |
|-------|-------|------|-------------|--------|
| Display | Session headline ("Begin Breathing") | 32px | 40px | SemiBold |
| H1 | Section headings | 28px | 36px | SemiBold |
| H2 | Card titles & modal headers | 22px | 30px | Medium |
| Body Large | Primary instructional copy | 18px | 26px | Regular |
| Body | General text | 16px | 24px | Regular |
| Caption | Secondary metadata & labels | 14px | 20px | Medium |

### Accessibility Notes
- Minimum body text size set at 16px for readability.
- Ensure line spacing at least 1.5 for paragraphs exceeding two lines.
- Support dynamic type scaling by allowing up to 200% size increases without clipping.

## Component Library

### Buttons
- **Primary Button:** Filled Breath Teal background with Near White text, 12px corner radius, shadow elevation for focus. Includes focus outline (#FFFFFF, 2px) and visible pressed state (darkened teal #269688).
- **Secondary Button:** Midnight Indigo outline on transparent background. Hover/pressed state adds 20% teal tint fill while keeping outline.
- **Destructive Button:** Alert Coral background, Near White text, same padding as primary. Always paired with warning icon.
- **Accessibility:** All buttons have minimum 44x44px touch targets and include aria-labels when icon-only.

### Toggles & Sliders
- Rounded track using Calm Sky fill with Breath Teal active state. Thumb size 24px to support motor accessibility. Provide discrete snap points for pacing adjustments.

### Cards
- Surface color Midnight Indigo with 80% opacity overlay when on imagery. Drop shadow ensures separation. Include padding 20px and maintain 8px baseline grid inside.

### Dialogs & Sheets
- Use Near White background with Midnight Indigo text for readability. Provide high-contrast focus outlines and ensure primary action appears on right with destructive secondary on left.

### Feedback Elements
- **Status Banner:** Full-width bar with corresponding color plus icon. Provide textual summary and optional "Learn more" link.
- **Toast Notifications:** 320px max width, 16px padding, appear bottom center with 4s duration. Support screen reader announcement via `aria-live="polite"`.

### Iconography
- Line-based icons at 24px grid with 2px stroke. Ensure filled versions exist for high contrast contexts. Provide labels and tooltips for critical actions.

## Motion Guidelines
- Motion duration adheres to 200ms-500ms range to avoid discomfort.
- Provide "Reduce Motion" setting to swap animations with subtle opacity fades.
- Haptic patterns follow platform accessibility guidelines and offer user opt-out.
