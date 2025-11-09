import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart' deferred as lottie;
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
  bool _lottieLibLoaded = false;
  bool _compositionLoaded = false;
  Duration _compositionDuration = const Duration(milliseconds: 0);

  // Fallback safety max (so splash never hangs longer than this).
  static const Duration _maxFallback = Duration(milliseconds: 4000);

  @override
  void initState() {
    super.initState();
    // Load both the app assets and the Lottie package (deferred) in parallel.
    _initSplash();
  }

  Future<void> _initSplash() async {
    // Start loading the deferred Lottie library and the critical assets.
    final preloadFuture = preloadAssets(context);
    final lottieLibFuture = lottie.loadLibrary().then((_) {
      _lottieLibLoaded = true;
    });

    await Future.wait([preloadFuture, lottieLibFuture]);

    // Mark assets loaded (images/fonts) but wait for the Lottie composition
    // (the animation data) to be parsed by the widget's onLoaded callback.
    setState(() {
      assetsLoaded = true;
    });

    // If composition already parsed by the time assets finished loading,
    // schedule navigation; otherwise navigation will be scheduled by
    // the onLoaded callback when both are ready.
    if (_compositionLoaded) {
      _scheduleNavigationAfterComposition();
    }
  }

  void _scheduleNavigationAfterComposition() {
    // Safety: don't schedule multiple timers.
    _navTimer?.cancel();
    final durationToWait =
        _compositionDuration + const Duration(milliseconds: 150);
    final wait = durationToWait < _maxFallback ? durationToWait : _maxFallback;
    _navTimer = Timer(wait, _navigateToHome);
  }

  void _navigateToHome() {
    if (!mounted || !assetsLoaded) return;
    // Proceed to home screen
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
        child: Builder(
          builder: (ctx) {
            // If the deferred Lottie library is not yet loaded, show a lightweight
            // placeholder to avoid pulling the animation code in the initial
            // JS bundle. Lottie will be loaded in init and the widget tree will
            // re-build once ready.
            if (!_lottieLibLoaded) {
              return SizedBox(
                width: 120,
                height: 120,
                child: const Center(child: CircularProgressIndicator()),
              );
            }

            // Lottie library is loaded; show the animation and use the
            // onLoaded callback to learn the composition duration so we can
            // keep the splash visible until both composition and assets are ready.
            return lottie.Lottie.asset(
              'assets/splash_screen/Gradient_blob.json',
              repeat: false,
              width: 300,
              height: 300,
              fit: BoxFit.contain,
              onLoaded: (composition) {
                // composition.duration is a Duration; capture it and mark parsed
                _compositionDuration = composition.duration;
                _compositionLoaded = true;

                // If assets are already loaded, schedule navigation now.
                if (assetsLoaded) {
                  _scheduleNavigationAfterComposition();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
