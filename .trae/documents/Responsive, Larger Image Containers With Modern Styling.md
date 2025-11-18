## Goal
Increase image container size with responsive scaling, ensure images fully display without cropping, add clean aesthetics, and maintain performance.

## Changes
- Enlarge image containers in Hackathon and GDSC modals using responsive heights (mobile vs desktop) while preserving aspect ratio via `BoxFit.contain`.
- Enhance `_ZoomableAssetImage` styling with subtle shadow and internal padding.
- Keep existing interactions and full-screen behavior.

## Implementation
- Update `_ZoomableAssetImage` build to include:
  - BoxDecoration with soft shadow for modern look
  - Padding around the image
- Adjust call sites:
  - Hackathon modal: set height to `isMobile ? 260.h : 380.h`, borderRadius `20.r`
  - GDSC modal: same responsive heights and radius.

## Performance & Responsiveness
- No heavy libs; simple decoration and padding.
- Images continue using `BoxFit.contain` and low filter quality, maintaining performance.
- Works across screen sizes with responsive heights.

## Verification
- On mobile and desktop, images display fully within enlarged containers.
- Zoom-out default and full-screen functionality remain intact.
- Visual appearance improved with padding and subtle shadow.