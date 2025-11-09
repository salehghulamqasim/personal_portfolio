#!/usr/bin/env bash
# Lightweight helper to build an optimized Flutter Web release.
# Usage: ./tool/build_web_optimized.sh
#
# What this does:
# - Builds a release web bundle (tree-shaken + minified by dart2js)
# - Uses the HTML renderer (smaller payload for typical UIs)
# - Produces a PWA-style output with an offline-first service worker
# - Prints recommended post-build steps (gzip/brotli) to further reduce
#   hosting transfer sizes.

set -euo pipefail

echo "Building Flutter web (release, html renderer, offline-first PWA)..."

# Note: flutter automatically performs tree-shaking and minification for
# release builds. We prefer the HTML renderer for typical Flutter apps
# because CanvasKit increases the download size significantly (CanvasKit
# bundles the Skia WASM). If your app needs precise Skia rendering, switch
# to --web-renderer=canvaskit.

flutter build web --release --web-renderer=html --pwa-strategy=offline-first

echo "\nBuild complete. Next recommendations to reduce served bytes (optional):"
echo " - Pre-compress build output for the webserver (gzip or brotli). Example:"
echo "    cd build/web && brotli --best --keep **/*.js **/*.css **/*.html"
echo " - Configure your static host to serve pre-compressed files or to use Brotli"
echo " - Use HTTP2 / HTTP3 and set aggressive caching for immutable files (e.g. main.dart.js)"
echo " - Consider using a CDN for globally distributed content"

echo "Done. Output is in: build/web"
