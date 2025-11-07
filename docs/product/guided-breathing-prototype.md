# Guided Breathing Prototype Specification

## Experience Overview
The prototype demonstrates a core breathing session featuring a responsive concentric ring animation, progress tracking, and supportive cues (visual, audio, haptic). It is optimized for touch devices but adaptable to desktop.

## Animation Behavior
- **Breathing Ring:**
  - Expands from 120px to 220px diameter over inhale phase (default 4 seconds) with easing `ease-out`.
  - Contracts back during exhale phase (default 6 seconds) with `ease-in` easing to encourage gradual release.
  - In-hold state (default 2 seconds) stabilizes at 180px with subtle pulsing glow (opacity oscillation 0.8–1.0).
- **Color Transitions:**
  - Inhale uses Breath Teal gradient radiating from center.
  - Hold shifts to Warm Sand overlay.
  - Exhale fades to Calm Sky with 30% opacity to prevent overstimulation.
- **Accessibility:** Provide alternate "reduced motion" mode replacing radial scaling with a progress bar filling left to right while background color shifts between phases.

## Progress Indicators
- **Session Progress Bar:** Thin horizontal bar at top showing completed percentage. Color transitions match breathing phase.
- **Breath Counter:** Displays "Breath 2 of 6" using Body Large style, updating per cycle. When user adjusts duration mid-session, counter recalculates remaining breaths.
- **Timer Toggle:** Optional digital clock showing elapsed/remaining time. Toggle persists per user preference.

## Controls
- **Pacing Slider:** Allows inhale/hold/exhale adjustments within safe ranges (3–7s inhale, 0–4s hold, 4–8s exhale). Slider snaps to 0.5s increments.
- **Quick Presets:** Buttons for "Calm Focus" (4-2-6), "Steady Box" (4-4-4), "Energize" (3-1-5) with short descriptors (e.g., "relax", "balance", "invigorate"). Selecting preset updates slider values and ring animation immediately.
- **Safety Pause:** Prominent button pauses animation, dims screen, and surfaces guidance on resuming or stopping.

## Sensory Feedback
- **Audio:** Soft whoosh on inhale, chime on hold, exhale wind-down. Volume defaults to 40% with mute toggle.
- **Haptics (Wearables/Mobile):**
  - Inhale: steady low-intensity vibration ramping up.
  - Hold: single gentle pulse.
  - Exhale: downward triple pulse sequence.
  - Include note reminding designers to reference platform haptic APIs and to offer opt-out in settings.
- **Narration:** Optional voice guidance with inclusive language and pacing matched to animation.

## Edge Cases
- When user enables "Reduce Motion", haptics default to off and audio cues become primary guidance.
- If a user reports dizziness (feedback prompt), prototype triggers modal recommending a break and logging event.

## Implementation Notes
- Prototype built in Figma with Smart Animate for ring transitions and interactive components for slider/presets.
- Provide variant for dark and light backgrounds to validate contrast compliance.
- Include annotation layer documenting timings and easing for handoff.
