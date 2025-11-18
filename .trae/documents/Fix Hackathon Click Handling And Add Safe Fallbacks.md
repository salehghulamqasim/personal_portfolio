## Goal
Ensure clicking Hackathon boxes (e.g., Computer Club) reliably opens the detail modal across all instances, preserving the working GDSC behavior. Add resilient data handling, minimal logging, and keep performance and responsiveness optimized.

## Investigation Summary
- Hackathon modal builds a Tech Stack section using `(data['tech'] as List<dynamic>)`. For several entries (`1`, `2`, `3`) `tech` is missing, causing a runtime type error during dialog build, so the dialog appears to do nothing.
- GDSC modal does not rely on a missing field, so it works.

## Changes To Implement
- Add safe accessors in `HackathonBox._showDetails`:
  - Compute `techList = (data['tech'] as List<dynamic>?) ?? const []` and only render Tech Stack UI when non-empty.
  - Read `team` and `duration` safely with defaults (`'N/A'`).
  - Log lightweight diagnostics using `debugPrint` when opening and when `techList` is empty.
- Improve image handling in Hackathon modal:
  - If `imagePath` is invalid or missing (`null`, empty, `'[]'`), keep placeholder but also log a diagnostic.
- Preserve GDSC functionality and styling; no changes required there besides keeping previous working behavior.

## Performance & Responsiveness
- Avoid unnecessary rebuild work by precomputing values before `showDialog`.
- Render conditional sections only when needed, reducing widget tree size.
- Keep animations, sizes, and layout unchanged.

## Error Handling & Logging
- Add `debugPrint` on open and when optional fields are absent.
- Guard asset loading with `errorBuilder` (already used) and invalid-path fallback with a diagnostic.

## Verification
- Click Hackathon 1/2/3/4: dialogs open without errors; 3/4 show placeholders until images are provided.
- Click GDSC: unchanged, works.
- Confirm consistent behavior on mobile and desktop layouts.
- Review console for `debugPrint` messages when fields are missing.