#!/bin/bash

# Script to remove source maps from build/web directory
# This can be run manually or as part of the build process

echo "🧹 Removing source maps from build/web..."

if [ ! -d "build/web" ]; then
    echo "❌ build/web directory not found. Run 'flutter build web' first."
    exit 1
fi

# Count files before cleanup
MAP_COUNT=$(find build/web -name "*.map" -type f | wc -l | tr -d ' ')
JS_WITH_MAPS=$(grep -r "sourceMappingURL" build/web/*.js 2>/dev/null | wc -l | tr -d ' ')

echo "Found $MAP_COUNT .map files and $JS_WITH_MAPS JS files with sourceMappingURL references"

# Delete all .map files
find build/web -name "*.map" -type f -delete

# Remove sourceMappingURL comments from JS files
# Works on both macOS (sed -i '') and Linux (sed -i)
if [[ "$OSTYPE" == "darwin"* ]]; then
    find build/web -name "*.js" -type f -exec sed -i '' '/sourceMappingURL/d' {} \;
else
    find build/web -name "*.js" -type f -exec sed -i '/sourceMappingURL/d' {} \;
fi

# Verify cleanup
REMAINING_MAPS=$(find build/web -name "*.map" -type f | wc -l | tr -d ' ')
REMAINING_REFS=$(grep -r "sourceMappingURL" build/web/*.js 2>/dev/null | wc -l | tr -d ' ')

if [ "$REMAINING_MAPS" -eq 0 ] && [ "$REMAINING_REFS" -eq 0 ]; then
    echo "✅ All source maps removed successfully!"
    echo "   - Removed $MAP_COUNT .map files"
    echo "   - Removed sourceMappingURL from $JS_WITH_MAPS JS files"
else
    echo "⚠️  Warning: Some source maps may remain"
    echo "   - Remaining .map files: $REMAINING_MAPS"
    echo "   - Remaining sourceMappingURL references: $REMAINING_REFS"
fi

