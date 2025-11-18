## Goal
Replace the grey placeholder containers in the Hackathon and GDSC detail modals with real images from your assets so they display properly.

## What I’ll Change
- Hackathon modal: Render `Image.asset` using each entry’s `imagePath` when available; otherwise fall back to the current placeholder.
- GDSC modal: Render a chosen asset image (available in your repo) instead of the placeholder; include a safe fallback if the file isn’t found.
- Keep existing styling: rounded corners, borders, shadows, and sizes.

## Implementation Details
### Hackathon modal
- File: `lib/components/aboutMe.dart`
- Replace the placeholder at  `lib/components/aboutMe.dart:557–585` with an image container:
  - Use `Container` (keep border and radius) → `ClipRRect` → `Image.asset(data['imagePath'])` with `fit: BoxFit.cover`.
  - Guard against missing/invalid paths (e.g., `null`, empty, or `'[]'`): show current icon/text placeholder when no usable path.
  - Add `errorBuilder` to gracefully show the placeholder if the asset can’t be loaded.
- Use existing `imagePath` values:
  - `'1'`: `assets/Certificates/computer_club.webp`
  - `'2'`: `assets/Certificates/Skyport.jpeg`
  - `'3'` and `'4'`: currently missing/invalid; will show the placeholder until paths are provided.

### GDSC modal
- File: `lib/components/aboutMe.dart`
- Replace the placeholder at `lib/components/aboutMe.dart:889–919` with an image container:
  - `Container` (keep border/radius) → `ClipRRect` → `Image.asset(<selected path>)` with `fit: BoxFit.cover` and `errorBuilder` fallback.
  - Proposed image path (present in repo): `assets/Certificates/raqman.webp`. If you prefer a different image, we can swap the path easily.

## Assets & Config
- `pubspec.yaml` already includes `assets/Certificates/` (and lists `computer_club.webp`), so no changes needed.
- No new files added.

## Verification
- Run the app and open: Hackathon 1 and 2 modals → images show; 3 and 4 fall back to placeholder.
- Open GDSC modal → chosen image shows.
- Confirm no layout regressions: border radius, shadow, and sizing unchanged.