# Guided Breathing Usability Testing Summary

## Objectives
- Validate clarity of pacing controls and feedback prompts within the guided breathing prototype.
- Observe whether users can interpret visual/haptic cues without facilitator intervention.
- Identify accessibility concerns for motion sensitivity and first-time users.

## Participants
1. **Participant A (Sarah persona match):** 34-year-old project manager using iOS device, moderate familiarity with breathing apps.
2. **Participant B (Miguel persona match):** 27-year-old graduate student on Android tablet, new to guided breathing.
3. **Participant C (Priya persona match):** 46-year-old with mild asthma using Android phone, prioritizes safety cues.

Sessions conducted remotely via moderated Zoom walkthroughs with Figma prototype.

## Key Findings
- **Pacing Controls:** All participants located the pacing slider quickly, but Participant B hesitated to adjust mid-session without reassurance. Participants requested preset names that describe outcomes ("Relax", "Focus").
- **Feedback Prompts:** Participant C appreciated the post-exercise prompt asking about dizziness but wanted earlier reassurance. Participants A and B asked for positive reinforcement after each completed breath cycle.
- **Animation & Motion:** Participant B experienced slight discomfort with rapid ring expansion at default settings. Reduced motion toggle resolved issue when demonstrated.
- **Haptics Understanding:** Without physical device, participants relied on description; they recommended preview text explaining vibration patterns.

## Iterations Implemented
- Renamed presets to outcome-oriented labels: "Calm Focus", "Steady Box", "Energize". Added short descriptors beneath each button.
- Added inline tooltip near pacing slider explaining safe adjustment ranges and encouraging experimentation between breaths.
- Introduced optional auditory chime confirming each completed cycle, providing immediate positive feedback.
- Elevated safety messaging by surfacing a pre-session card reminding users to pause if lightheaded, plus a mid-session tooltip that appears after the first hold phase.
- Enhanced reduced motion mode by defaulting to it on first launch for users who enable system-level "reduce motion" settings.
- Added haptic preview text in settings: "Inhale = rising buzz, Hold = single tap, Exhale = descending pulses." 

## Outstanding Questions
- Should the session progress bar display breaths remaining or time remaining by default? Further A/B testing needed.
- Determine if adaptive pacing suggestions should surface automatically after collecting three sessions of feedback.
