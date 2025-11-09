# Web Build Optimizations Applied

This document describes the practical optimizations added to the project to improve Flutter Web first-load performance and bundle size, and explains how to build an optimized release.

Files changed/added
- `web/index.html` — added preconnect and preload hints (fonts, hero image, main script).
- `lib/pages/splash_screen.dart` — deferred-loaded the heavy `lottie` package and updated splash logic so the app waits for both critical asset preloads and the Lottie composition to be ready before navigating. This ensures the initial JS payload is smaller and the UX remains smooth.
- `tool/build_web_optimized.sh` — helper script to run a recommended optimized build.

What each change does

- Deferred Lottie import (code-splitting):
  - `import 'package:lottie/lottie.dart' deferred as lottie;`
  - The Lottie package is placed in a separate JS chunk and only downloaded when `lottie.loadLibrary()` is invoked. This reduces initial download size for users who land on the site.

- Splash screen coordination:
  - The splash now preloads critical images/fonts via `preloadAssets(context)` (implemented in `lib/utils/preload_assets.dart`).
  - The splash waits until both (1) assets are pre-cached and (2) the Lottie composition is parsed. Once both are ready, the splash schedules navigation after the composition duration (small padding added). This prevents jumps and ensures the hero image is ready on first paint.

- `web/index.html` hints:
  - `preconnect` for `fonts.googleapis.com` and `fonts.gstatic.com` to speed up font fetches when Google Fonts are used.
  - `preload` for the hero image `assets/images/MaskedSaleh.webp` and `main.dart.js` to hint the browser to fetch these resources early.

- Build script:
  - `tool/build_web_optimized.sh` runs:

    flutter build web --release --web-renderer=html --pwa-strategy=offline-first

  - Release builds already enable tree shaking and minification by default.

Post-build recommendations (hosting)

1. Pre-compress static files (Brotli or gzip) and configure your webserver/CDN to serve pre-compressed files when available. Example:

   cd build/web
   brotli --best --keep **/*.js **/*.css **/*.html

2. Use a CDN and configure long cache TTLs for immutable assets (the build output contains hashed file names).
3. Enable HTTP2/HTTP3 on your hosting provider for multiplexed downloads.

Notes and trade-offs

- CanvasKit (`--web-renderer=canvaskit`) produces more consistent rendering for complex vector graphics but increases download size (WASM + fonts). For most portfolios, `--web-renderer=html` is smaller and appropriate.
- Deferred loading reduces initial bundle size but adds a small extra network trip when the deferred library is required. We only deferred the Lottie package because it tends to be one of the heavier runtime dependencies.

How to undo

- Revert the deferred import for `lottie` in `lib/pages/splash_screen.dart` to `import 'package:lottie/lottie.dart';` and restore the original `onLoaded` scheduling.
- Remove preload/preconnect links from `web/index.html`.

If you'd like, I can also:
- Add preloading for additional hero/project images dynamically (only those you want to prioritize).
- Add deferred loading to other heavy packages (Rive, etc.) if you use them.
