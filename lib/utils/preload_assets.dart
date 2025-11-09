import 'package:flutter/material.dart';

Future<void> preloadAssets(BuildContext context) async {
  // Example: Preload images or other assets
  final assetImages = ['assets/images/MaskedSaleh.webp'];

  for (final asset in assetImages) {
    await precacheImage(AssetImage(asset), context);
  }

  // Example: Preload other assets if needed
  await Future.delayed(
    const Duration(milliseconds: 500),
  ); // Simulate additional loading
}
