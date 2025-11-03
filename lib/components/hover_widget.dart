import 'package:flutter/material.dart';

/*

 This file defines a HoverWidget that can change its appearance when hovered over.
  It uses animations to smoothly transition between different states, such as
   scaling and color changes.
*/

class HoverWidget extends StatefulWidget {
  final Widget? child;
  final Widget Function(bool isHovered)? builder;
  final Color? hoverColor;
  final Color? normalColor;
  final double? hoverScale;
  final Duration animationDuration;
  final Function(bool isHovered)? onHover;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final double? elevation;
  final double? hoverElevation;

  const HoverWidget({
    super.key,
    this.child,
    this.builder,
    this.hoverColor,
    this.normalColor,
    this.hoverScale,
    this.animationDuration = const Duration(milliseconds: 200),
    this.onHover,
    this.borderRadius,
    this.padding,
    this.elevation,
    this.hoverElevation,
  });

  @override
  State<HoverWidget> createState() => _HoverWidgetState();
}

class _HoverWidgetState extends State<HoverWidget>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: widget.hoverScale ?? 1.0)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    _colorAnimation = ColorTween(
      begin: widget.normalColor,
      end: widget.hoverColor,
    ).animate(_animationController);

    _elevationAnimation = Tween<double>(
      begin: widget.elevation ?? 0.0,
      end: widget.hoverElevation ?? widget.elevation ?? 0.0,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isHovered = true;
        });
        _animationController.forward();
        widget.onHover?.call(true);
      },
      onExit: (event) {
        setState(() {
          _isHovered = false;
        });
        _animationController.reverse();
        widget.onHover?.call(false);
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          Widget currentChild;

          // Use builder if provided, otherwise use child
          if (widget.builder != null) {
            currentChild = widget.builder!(_isHovered);
          } else {
            currentChild = widget.child!;
          }

          // Apply scale animation if specified
          if (widget.hoverScale != null && widget.hoverScale != 1.0) {
            currentChild = Transform.scale(
              scale: _scaleAnimation.value,
              child: currentChild,
            );
          }

          // Apply Material wrapper if any elevation/color effects are needed
          bool needsMaterial =
              widget.hoverColor != null ||
              widget.normalColor != null ||
              widget.elevation != null ||
              widget.hoverElevation != null;

          if (needsMaterial) {
            currentChild = Material(
              elevation: _elevationAnimation.value,
              color: _colorAnimation.value ?? Colors.transparent,
              borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              child: Padding(
                padding: widget.padding ?? EdgeInsets.zero,
                child: currentChild,
              ),
            );
          }

          return currentChild;
        },
      ),
    );
  }
}
