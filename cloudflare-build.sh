#!/bin/bash

# Install Flutter if not present (Cloudflare might need this)
# Assuming Flutter is available or install it

# Clean and get dependencies
flutter clean
flutter pub get

# Build for web with release flags
flutter build web --release --pwa-strategy=offline-first --tree-shake-icons --no-source-maps

# The build output is in build/web
echo "Build completed successfully"