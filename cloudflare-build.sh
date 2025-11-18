#!/bin/bash

# Exit on any error
set -e

echo "Starting Flutter web build..."

# Check if Flutter is installed
if ! command -v flutter &> /dev/null
then
    echo "Flutter not found. Installing Flutter..."
    
    # Clone Flutter SDK to current directory (we have permissions here)
    git clone https://github.com/flutter/flutter.git -b stable --depth 1 $HOME/flutter
    export PATH="$HOME/flutter/bin:$PATH"
    
    # Pre-download Flutter dependencies
    flutter doctor
fi

# Print Flutter version
flutter --version

# Clean previous builds
echo "Cleaning previous builds..."
flutter clean

# Get dependencies
echo "Getting Flutter dependencies..."
flutter pub get

# Build for web with optimizations
echo "Building Flutter web app..."
flutter build web \
  --release \
  --tree-shake-icons \
  --no-source-maps \
  --pwa-strategy offline-first \
  -- wasm

# Verify build output
if [ -d "build/web" ]; then
    echo "✓ Build completed successfully!"
    echo "Build output is in build/web directory"
    ls -la build/web
else
    echo "✗ Build failed - build/web directory not found"
    exit 1
fi