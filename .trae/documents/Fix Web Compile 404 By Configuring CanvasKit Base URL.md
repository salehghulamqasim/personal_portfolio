## Goal
Resolve the web compile failure caused by a 404 when fetching CanvasKit by configuring a stable CanvasKit base URL and keeping performance high.

## Findings
- The build defines `FLUTTER_WEB_USE_SKIA=true` and attempts to use CanvasKit from `https://www.gstatic.com/flutter-canvaskit/035316565ad7728`, which returns 404.
- Without a valid CanvasKit URL, Flutter web bootstrap can fail during compilation/run.

## Changes
- Update `web/index.html` to set `window.flutterConfiguration.canvasKitBaseUrl` to a stable CDN location (`https://www.gstatic.com/skia/canvaskit/v0.38.0/`).
- Add preconnect to the CanvasKit CDN to reduce latency.
- Keep renderer as CanvasKit (fast path) and avoid switching to HTML unless later requested.

## Why This Works
- Flutter supports overriding the CanvasKit base URL via `window.flutterConfiguration` before bootstrap.
- Using a stable Skia CDN path avoids engine-revision-specific broken URLs.

## Verification
- Rebuild for web; the loader fetches CanvasKit from the specified base URL, compile succeeds, and the app runs.
- Confirm performance remains high and no regressions in rendering.

## Notes
- If you prefer HTML renderer, you can run with `--web-renderer html` as an alternative; not changing that by code here to preserve current behavior.