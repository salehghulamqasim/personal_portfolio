import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:personal_portfolio/pages/homescreen.dart';
import 'package:personal_portfolio/utils/preload_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _navTimer;
  bool assetsLoaded = false;

  // Fallback safety max (so splash never hangs longer than this).
  static const Duration _maxFallback = Duration(milliseconds: 4000);

  @override
  void initState() {
    super.initState();
    _loadAssets();
  }

  Future<void> _loadAssets() async {
    await preloadAssets(context);
    setState(() {
      assetsLoaded = true;
    });
    _navigateToHome(); // Ensure navigation happens after assets load
  }

  void _navigateToHome() {
    if (!mounted || !assetsLoaded) return;
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
          width: 300,
          height: 300,
          fit: BoxFit.contain,
          onLoaded: (composition) {
            final durationToWait =
                composition.duration + const Duration(milliseconds: 150);

            final wait = durationToWait < _maxFallback
                ? durationToWait
                : _maxFallback;

            _navTimer?.cancel();
            _navTimer = Timer(wait, _navigateToHome);
          },
        ),
      ),
    );
  }
}
