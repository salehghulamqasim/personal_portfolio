#!/bin/bash
# Cloudflare Pages build script for Flutter web

# Install Flutter dependencies
flutter pub get

# Build the web app
flutter build web --release --dart2js-optimization=O3 --no-source-maps

# The build output is in build/web, which Cloudflare Pages will serve

