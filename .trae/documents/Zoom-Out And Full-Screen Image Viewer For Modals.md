## Goal
Add a reusable, performant image viewer that shows images in a zoomed-out fit inside modals and opens a full-screen, zoomable view on click. Preserve GDSC functionality and improve Hackathon instances.

## Implementation Overview
- Create a reusable widget `ZoomableAssetImage` used in Hackathon and GDSC modals.
- Default view: fits image within container using `BoxFit.contain` (zoom-out), smooth fade-in.
- Full-screen: on click, open a full-screen dialog with `InteractiveViewer` for pinch/zoom, a close button (X), Escape key support, centered image maintaining aspect ratio.
- Accessibility: wrap with `Semantics` labels, keyboard focus via `Focus`, visual focus via `InkWell`.
- Performance: build image only when modal opens (lazy by context), use transforms for animations, low filter quality, no heavy libs.

## Changes
1. Add `ZoomableAssetImage` (stateful) in `lib/components/aboutMe.dart` helpers:
   - Props: `path`, `height`, `borderRadius`, `borderColor`, `placeholderIconColor`, `label`.
   - Normal mode: `Container` with border/radius, `Semantics`, `InkWell` click → open full-screen; shows `Image.asset` with `fit: BoxFit.contain` and `errorBuilder` placeholder.
   - Full-screen: `showGeneralDialog` with custom fade/scale transition; `Stack` with top-right close button; `RawKeyboardListener` captures Escape; `InteractiveViewer` wraps `Image.asset` with `BoxFit.contain` and centering.
   - Logging: `debugPrint` on open/close, and invalid paths.
2. Replace the image container in Hackathon modal with `ZoomableAssetImage` using `data['imagePath']`.
3. Replace the image container in GDSC modal with `ZoomableAssetImage` using `'assets/Certificates/raqman.webp'`.

## Verification
- Click any Hackathon image: opens full-screen with zoom/pan; Escape and X close; normal view fits without cropping.
- GDSC: same behavior preserved and enhanced.
- Works on mobile and desktop; maintains aspect ratio and responsiveness.
- Console logs show interaction diagnostics.

## Notes
- No new dependencies; keeps code clean and maintainable.
- Lazy loading achieved as images build only when modals open; animations via transforms.
