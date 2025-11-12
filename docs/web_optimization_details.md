# Web Optimization Documentation

## Overview
This document outlines the optimizations made to the Flutter Web project to improve loading performance without altering the UI, animations, or layout. The changes aim to reduce the initial load time and enhance the overall user experience.

---

## Optimizations Implemented

### 1. Deferred Loading for Lottie Animations
- **What was changed?**
  - The Lottie package was loaded using deferred imports in `lib/pages/splash_screen.dart`.
  - This reduces the size of the initial JavaScript bundle by loading the Lottie package only when it is needed.
- **How it works:**
  - Deferred imports allow the Flutter Web compiler to split the code into smaller chunks (lazy loading).
  - The Lottie animations are loaded dynamically when the splash screen is displayed.
- **File Modified:**
  - `lib/pages/splash_screen.dart`

### 2. Preload Hints in `web/index.html`
- **What was changed?**
  - Added `<link rel="preload">` and `<link rel="preconnect">` hints for critical resources such as fonts, hero images, and the main script.
- **How it works:**
  - Preload hints inform the browser to fetch critical resources early, reducing the time to first render.
  - Preconnect hints establish early connections to external resources, reducing latency.
- **File Modified:**
  - `web/index.html`

### 3. Build Script for Optimized Releases
- **What was added?**
  - A new build script `tool/build_web_optimized.sh` was created to automate the process of generating optimized builds.
- **How it works:**
  - The script uses Flutter's `--release` flag and additional flags for tree-shaking and minification.
  - It ensures that the output is optimized for production.
- **File Added:**
  - `tool/build_web_optimized.sh`

### 4. Brotli Compression and HTTP/2/3 Recommendations
- **What was documented?**
  - Recommendations for enabling Brotli compression and HTTP/2 or HTTP/3 on the hosting server.
- **How it works:**
  - Brotli compression reduces the size of text-based assets (e.g., HTML, CSS, JS).
  - HTTP/2 and HTTP/3 improve resource loading by enabling multiplexing and reducing latency.
- **Documentation Added:**
  - `docs/web_optimizations.md`

---

## Testing and Validation

### Local Testing
- **Command Used:**
  - `flutter run --release --wasm`
- **Purpose:**
  - To validate the optimizations locally and ensure the application functions as expected.

### Live Testing
- **Recommendation:**
  - Deploy the optimized build to a staging server and test the performance improvements using tools like Google Lighthouse.

---

## Hosting Recommendations
- **Enable Brotli Compression:**
  - Configure the server to use Brotli compression for text-based assets.
- **Use HTTP/2 or HTTP/3:**
  - Ensure the server supports HTTP/2 or HTTP/3 for faster resource loading.
- **Set Cache-Control Headers:**
  - Use appropriate caching headers to leverage browser caching for static assets.

---

## Summary
These optimizations aim to improve the loading performance of the Flutter Web application while maintaining its visual fidelity and functionality. For further improvements, consider analyzing the build output and identifying additional opportunities for optimization.