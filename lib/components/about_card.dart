import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/themes/text_styles.dart';

class AboutCard extends StatefulWidget {
  final String title; // e.g. "Languages" or "Education"
  final String? subtitle; // e.g. "Bachelors in Computer Science"
  final IconData icon; // Icon to display
  final List<String>? languages; // For language pills
  final bool isLanguageCard; // Determines if it's a language card

  const AboutCard({
    super.key,
    required this.title,
    required this.icon,
    this.subtitle,
    this.languages,
    this.isLanguageCard = false,
  });

  @override
  State<AboutCard> createState() => _AboutCardState();
}

class _AboutCardState extends State<AboutCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // final isMobile = MediaQuery.of(context).size.width < 768;
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return ScaleTransition(
      scale: _scaleAnimation,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: AnimatedScale(
          scale: _isHovered ? 1.02 : 1.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          child: Container(
            width: isMobile ? 320.w : 450.w,
            height: isMobile ? 220.h : 340.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF7090B0).withValues(alpha: 0.1),
                  offset: const Offset(0, 6),
                  blurRadius: 64,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(
                isMobile ? 24.w : 32.w,
              ), // Currently 32 and 48
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: 1),
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOut,
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Icon(
                          widget.icon,
                          size: isMobile ? 32 : 40,
                          color: const Color(0xFFFDC435),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: isMobile ? 24.h : 24.h),

                  // Title
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: 1),
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOut,
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontFamily: Fonts.playfair.fontFamily,
                            fontSize: isMobile ? 24 : 28,
                            fontWeight: FontWeight.w900,
                            color: const Color(0xFF25282B),
                            height: 1.2,
                          ),
                        ),
                      );
                    },
                  ),

                  // Conditional Content based on card type
                  if (widget.isLanguageCard && widget.languages != null) ...[
                    SizedBox(height: isMobile ? 24.h : 32.h),
                    // Language Pills
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: widget.languages!.asMap().entries.map((entry) {
                        return _LanguagePill(
                          text: entry.value,
                          delay: 600 + (entry.key * 100),
                        );
                      }).toList(),
                    ),
                  ] else if (!widget.isLanguageCard &&
                      widget.subtitle != null) ...[
                    SizedBox(height: isMobile ? 12.h : 16.h),
                    // Education/Other content
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeOut,
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.subtitle!,
                                style: TextStyle(
                                  fontFamily: Fonts.nunito.fontFamily,
                                  fontSize: isMobile ? 20 : 24,
                                  fontWeight:
                                      FontWeight.w400, // Reduced boldness
                                  color: const Color(0xFF25282B),
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Animated Gradient Line
                              TweenAnimationBuilder<double>(
                                tween: Tween(begin: 0, end: 1),
                                duration: const Duration(milliseconds: 600),
                                curve: Curves.easeOut,
                                builder: (context, lineValue, child) {
                                  return Container(
                                    height: 4,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: const [
                                          Color(0xFFFDC435),
                                          Colors.transparent,
                                        ],
                                        stops: [lineValue, lineValue],
                                      ),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguagePill extends StatefulWidget {
  final String text;
  final int delay;

  const _LanguagePill({required this.text, required this.delay});

  @override
  State<_LanguagePill> createState() => _LanguagePillState();
}

class _LanguagePillState extends State<_LanguagePill> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.8 + (0.2 * value),
          child: Opacity(
            opacity: value,
            child: MouseRegion(
              onEnter: (_) => setState(() => _isHovered = true),
              onExit: (_) => setState(() => _isHovered = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                transform: Matrix4.identity()
                  ..translate(0.0, _isHovered ? -4.0 : 0.0),
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 24,
                  vertical: isMobile ? 8 : 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDC435),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  widget.text,
                  style: TextStyle(
                    fontFamily: Fonts.nunito.fontFamily,
                    fontSize: isMobile ? 16 : 18,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF25282B),
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// USAGE EXAMPLES:
/// 
/// ```dart
/// // Language Card
/// AboutCard(
///   title: 'Languages',
///   icon: Icons.language,
///   isLanguageCard: true,
///   languages: ['English', 'Arabic', 'Urdu'],
/// )
/// 
/// // Education Card
/// AboutCard(
///   title: 'Education',
///   icon: Icons.school,
///   subtitle: 'Bachelors in Computer Science',
/// )
/// 
/// // Custom Card
/// AboutCard(
///   title: 'Experience',
///   icon: Icons.work,
///   subtitle: '5+ Years in Flutter Development',
/// )
/// ```