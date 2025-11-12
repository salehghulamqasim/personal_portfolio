#!/bin/bash
# Cloudflare Pages build script for Flutter web

# Install Flutter dependencies
flutter pub get

# Build the web app
flutter build web --release --dart2js-optimization=O3 --no-source-maps

# Copy _redirects file to build output for SPA routing
if [ -f "_redirects" ]; then
  cp _redirects build/web/_redirects
fi

# The build output is in build/web, which Cloudflare Pages will serve

