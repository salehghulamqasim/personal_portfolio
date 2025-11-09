import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:personal_portfolio/pages/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _navTimer;

  // Fallback safety max (so splash never hangs longer than this).
  static const Duration _maxFallback = Duration(milliseconds: 4000);

  void _navigateToHome() {
    if (!mounted) return;
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const Homescreen()));
  }

  @override
  void dispose() {
    _navTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/splash_screen/Gradient_blob.json',
          repeat: false,
          // optional: control size for different screens
          width: 300,
          height: 300,
          fit: BoxFit.contain,
          onLoaded: (composition) {
            // composition.duration gives the animation duration if available
            final compositionDuration = composition.duration;
            final durationToWait =
                // ignore: unnecessary_null_comparison
                (compositionDuration != null &&
                    compositionDuration > Duration.zero)
                ? compositionDuration +
                      const Duration(milliseconds: 150) // small padding
                : const Duration(milliseconds: 1700); // fallback if not present

            // Use the smaller of the two to prevent very long animations from blocking navigation:
            final wait = durationToWait < _maxFallback
                ? durationToWait
                : _maxFallback;

            // schedule navigation
            _navTimer?.cancel();
            _navTimer = Timer(wait, _navigateToHome);
          },
        ),
      ),
    );
  }
}
