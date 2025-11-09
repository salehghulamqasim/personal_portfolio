import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EasySkeleton extends StatefulWidget {
  final Widget child;
  final int loadingSeconds; // How long to show skeleton

  const EasySkeleton({super.key, required this.child, this.loadingSeconds = 2});

  @override
  State<EasySkeleton> createState() => _EasySkeletonState();
}

class _EasySkeletonState extends State<EasySkeleton> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Auto-hide skeleton after delay
    Future.delayed(Duration(seconds: widget.loadingSeconds), () {
      if (mounted) setState(() => _isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: _isLoading,
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
      ),
      child: widget.child,
    );
  }
}

// USAGE EXAMPLES:

// Example 1: Wrap any widget
// EasySkeleton(
//   child: ProjectCard(...),
// )

// Example 2: Custom loading time
// EasySkeleton(
//   loadingSeconds: 3,
//   child: HeroSection(),
// )

// Example 3: Wrap multiple widgets
// EasySkeleton(
//   child: Column(
//     children: [
//       ProjectCard(...),
//       ProjectCard(...),
//     ],
//   ),
// )
