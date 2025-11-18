#!/bin/bash

# Exit on any error
set -e

echo "🚀 Starting Flutter web build..."

# Check if Flutter is installed
if ! command -v flutter &> /dev/null
then
    echo "📦 Flutter not found. Installing Flutter..."
    
    # Clone Flutter SDK to home directory
    git clone https://github.com/flutter/flutter.git -b stable --depth 1 $HOME/flutter
    export PATH="$HOME/flutter/bin:$PATH"
    
    # Add Flutter to PATH for current session
    echo "export PATH=\"\$HOME/flutter/bin:\$PATH\"" >> $HOME/.bashrc
    
    # Pre-download Flutter dependencies
    echo "🔧 Running flutter doctor..."
    flutter doctor -v
else
    echo "✓ Flutter found"
fi

# Print Flutter version
echo "📋 Flutter version:"
flutter --version

# Clean previous builds
echo "🧹 Cleaning previous builds..."
flutter clean

# Get dependencies
echo "📚 Getting Flutter dependencies..."
flutter pub get

# Build for web with optimizations
echo "🔨 Building Flutter web app..."
flutter build web \
  --release \
  --tree-shake-icons \
  --no-source-maps \
  --pwa-strategy offline-first \
  --base-href "/" \
  --wasm

# WASM provides better performance but requires browser support
# base-href="/" ensures app works from root domain (https://yoursite.com/)
# Change to "/subdirectory/" if deploying to a subdirectory

# Verify build output
if [ -d "build/web" ]; then
    echo "✅ Build completed successfully!"
    echo "📦 Build output is in build/web directory"
    echo ""
    echo "Build contents:"
    ls -lah build/web
    echo ""
    echo "Build size:"
    du -sh build/web
else
    echo "❌ Build failed - build/web directory not found"
    exit 1
fi

echo ""
echo "🎉 Build process completed!"