## Goal
Add two new boxes that match the existing design pattern: one for “Raqman” and another for “Iftar Content”. Use the same GDSC-style card and modal behavior with responsive, performant image display.

## Changes
- Create two widgets in `lib/components/aboutMe.dart`:
  - `RaqmanBox`: GDSC-styled box with modal details; image path set to `assets/Certificates/raqman.webp`.
  - `IftarBox`: GDSC-styled box with modal details; uses placeholder if no asset, keeping the UI consistent.
- Reuse `ZoomableAssetImage` for image display and full-screen zoom.
- Integrate both boxes into `lib/pages/aboutMe_section.dart` for mobile and desktop layouts, matching the existing grid sizing/animation style.
- Update the import’s `show` list to expose the new widgets.

## Responsiveness & Performance
- Keep animations and sizes consistent with `GDSCBox`.
- Use responsive heights and ScreenUtil units; contain-fit for images; lazy built in modals.

## Verification
- Both new boxes render in mobile and desktop grids.
- Clicking opens modals; images fit without cropping; full-screen zoom works; Escape/X close.
- No regressions introduced; existing boxes unaffected.