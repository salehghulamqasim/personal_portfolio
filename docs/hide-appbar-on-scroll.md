# Hide App Bar on Scroll (with Hero Image Overlay)

This document explains how the home screen app bar is hidden when scrolling and only shown at the very top, while keeping the hero image overlay effect exactly as before.

## Goals

- App bar should be visible only at the very top of the home screen.
- When scrolling down, the app bar should “disappear” smoothly (no jarring snap).
- The hero image (`assets/images/MaskedSaleh.png`) should remain visually overlaid across the top of the page (not pushed below the app bar).

## Summary of the approach

- Kept `extendBodyBehindAppBar: true` so content renders under a transparent app bar and the hero image shows across the top.
- The home screen listens to scroll position with a `ScrollController` and detects when the user is at the top.
- Instead of jumping the app bar height between `kToolbarHeight` and `0`, the app bar now fades in/out using `AnimatedOpacity` for a smooth transition.
- While faded out, pointer events are ignored to prevent accidental taps.

This retains the overlay look (hero image visible “behind/under” the transparent app bar area), but the appearance/disappearance is smooth.

## Files changed

- `lib/pages/homescreen.dart`
  - Converted `Homescreen` to a `StatefulWidget`.
  - Added a `ScrollController` to track whether we are at the very top.
  - Passed a dynamic `opacity` (1.0 at top, 0.0 when scrolled) into the custom app bar.
  - Kept `extendBodyBehindAppBar: true` and `SafeArea(top: false)` to preserve the overlay.

- `lib/components/app_bar.dart`
  - Added a new `opacity` parameter to `CustomAppBar` (default 1.0).
  - Wrapped the internal `AppBar` in `AnimatedOpacity` (220ms, easeOut) for smooth fade.
  - Wrapped with `IgnorePointer(ignoring: opacity < 0.5)` so hidden/fading bars don’t accept taps.
  - Still supports a `height` parameter (defaults to `kToolbarHeight`), but we now keep it constant for stability.

## Key snippets

In `Homescreen`:

```dart
appBar: CustomAppBar(
  name: "Saleh Ghulam",
  onAboutPressed: () => print('About Me pressed'),
  onProjectsPressed: () => print('Projects pressed'),
  onContactPressed: () => print('Contact Me pressed'),
  height: kToolbarHeight, // constant height
  opacity: _isAtTop ? 1.0 : 0.0, // fade based on scroll position
),
```

In `CustomAppBar`:

```dart
return AnimatedOpacity(
  opacity: opacity,
  duration: const Duration(milliseconds: 220),
  curve: Curves.easeOut,
  child: IgnorePointer(
    ignoring: opacity < 0.5,
    child: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: height,
      // ... title row, buttons, etc.
    ),
  ),
);
```

## Why fade over height animation?

- Height animation in the app bar can cause layout jumps because the framework relies on `preferredSize` for layout. Fading the bar preserves the layout while still visually “hiding” the bar.
- The hero image overlay remains untouched because we still render content under the transparent bar.

## Possible enhancements

- Add a short delay or hysteresis (e.g., require a minimum scroll offset like 8–16 px) before hiding to avoid jitter when bouncing at the top.
- Use a slide-and-fade combo (AnimatedSlide + AnimatedOpacity) for a more dynamic feel.
- Swap to a `CustomScrollView` with a `SliverAppBar` if you want fully native scroll behavior with slivers (not required for this simple top-only behavior).

## Testing

- The included widget smoke test (`test/widget_test.dart`) ensures the app builds and the name appears at the top. Visual behavior (fade) is manually verified.
