import 'package:flutter/material.dart';
import 'package:personal_portfolio/themes/colors.dart';
import 'package:personal_portfolio/themes/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  final bool delayStart;

  const HeroSection({super.key, this.delayStart = false});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // WIDE SCREEN LAYOUT (Laptop)
        if (constraints.maxWidth > 800) {
          return Row(
            children: [
              // 1. LEFT SIDE: Text content with padding
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: HeroTextContent(delayStart: delayStart)
                      .animate()
                      .fadeIn(
                        duration: 500.ms,
                        delay: delayStart ? 2500.ms + 150.ms : 150.ms,
                        curve: Curves.easeOutCubic,
                      )
                      .slideX(
                        begin: -0.15,
                        end: 0,
                        duration: 500.ms,
                        curve: Curves.easeOutCubic,
                      ),
                ),
              ),

              // 2. RIGHT SIDE: Image - wrapped in RepaintBoundary for performance
              Expanded(
                child: RepaintBoundary(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // the actual file size is [2880×2516] but the oen being load is 640×559
                      //so we add cache height and widht so flutter knows it needs to be only load at 640x559 so it wont cause perfoamcen issues
                      Image.asset(
                            "assets/images/MaskedSaleh.webp",
                            cacheHeight:
                                (560 * MediaQuery.of(context).devicePixelRatio)
                                    .round(),
                            cacheWidth:
                                (640 * MediaQuery.of(context).devicePixelRatio)
                                    .round(),
                            fit: BoxFit.cover,
                            semanticLabel: 'Saleh Ghulam - Software Developer and Flutter expert',
                          )
                          .animate()
                          .fadeIn(
                            duration: 600.ms,
                            delay: delayStart ? 2500.ms : 0.ms,
                            curve: Curves.easeOutCubic,
                          )
                          .scale(
                            begin: const Offset(
                              0.95,
                              0.95,
                            ), // Less scale = better performance
                            end: const Offset(1, 1),
                            duration: 600.ms,
                            curve: Curves.easeOutCubic,
                          ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        // NARROW SCREEN LAYOUT (Mobile)
        else {
          final isMobile = MediaQuery.of(context).size.width < 768;
          final horizontalPadding = isMobile ? 16.w : 24.w;

          return Column(
            children: [
              // Mobile: Simpler animation for better performance
              RepaintBoundary(
                child: const HeroImageStack()
                    .animate()
                    .fadeIn(
                      duration: 400.ms,
                      delay: delayStart ? 2500.ms : 0.ms,
                      curve: Curves.easeOutCubic,
                    )
                    .scale(
                      begin: const Offset(
                        0.96,
                        0.96,
                      ), // Minimal scale on mobile
                      end: const Offset(1, 1),
                      duration: 400.ms,
                      curve: Curves.easeOutCubic,
                    ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: HeroTextContent(delayStart: delayStart)
                    .animate()
                    .fadeIn(
                      duration: 400.ms,
                      delay: delayStart ? 2500.ms + 200.ms : 200.ms,
                      curve: Curves.easeOutCubic,
                    )
                    .slideY(
                      begin: 0.1,
                      end: 0,
                      duration: 400.ms,
                      curve: Curves.easeOutCubic,
                    ),
              ),
            ],
          );
        }
      },
    );
  }
}

// You can make the Stack its own helper widget--- for phones
class HeroImageStack extends StatelessWidget {
  const HeroImageStack({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/MaskedSaleh.webp",
              cacheHeight: (560 * MediaQuery.of(context).devicePixelRatio)
                  .round(),
              cacheWidth: (640 * MediaQuery.of(context).devicePixelRatio)
                  .round(),
              fit: BoxFit.cover,
              semanticLabel: 'Saleh Ghulam professional profile image',
            ),
          ),

          // Photo
        ],
      ),
    );
  }
}

//left side text content
class HeroTextContent extends StatelessWidget {
  final bool delayStart;

  const HeroTextContent({super.key, this.delayStart = false});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final baseDelay = delayStart
        ? 2500
        : 0; // 2.5s delay if splash screen is active

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 24.h,
        horizontal: isMobile ? 18.w : 24.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Badge - quick fade in
          Text(
                'Flutter Developer',
                style: Fonts.playfair.copyWith(
                  fontSize: 20.sp,
                  fontFamily: Fonts.nunito.fontFamily,
                  color: const Color(0xFFFCC346),
                ),
              )
              .animate()
              .fadeIn(
                duration: 400.ms,
                delay: (baseDelay + 0).ms,
                curve: Curves.easeOutCubic,
              )
              .slideY(
                begin: -0.2,
                end: 0,
                duration: 400.ms,
                curve: Curves.easeOutCubic,
              ),
          SizedBox(height: 16.h),
          // Main heading - Apple-style typewriter with modern flair
          DefaultTextStyle(
                style: Fonts.playfair.copyWith(
                  fontSize: isMobile ? 30.sp : 40.sp,
                  color: Colors.black87,
                  height: 1.2,
                  fontFamily: Fonts.playfair.fontFamily,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Hello, my name is Saleh Ghulam',
                      textStyle: Fonts.playfair.copyWith(
                        fontSize: isMobile ? 30.sp : 40.sp,
                        color: Colors.black87,
                        height: 1.2,
                        fontFamily: Fonts.playfair.fontFamily,
                        fontWeight: FontWeight.w600,
                      ),
                      speed: const Duration(
                        milliseconds: 80,
                      ), // Super snappy, Gen Z speed
                      cursor: '|',
                    ),
                  ],
                  totalRepeatCount: 1,
                  pause: const Duration(milliseconds: 400), // Quick pause
                  displayFullTextOnTap: true,
                ),
              )
              .animate()
              .fadeIn(
                duration: 300.ms,
                delay: (baseDelay + 200).ms,
                curve: Curves.easeOutCubic,
              )
              .slideX(
                begin: -0.1,
                end: 0,
                duration: 400.ms,
                delay: (baseDelay + 200).ms,
                curve: Curves.easeOutCubic,
              ),
          SizedBox(height: 16.h),
          // Description - appears after typewriter
          Text(
                'From concept to clean, responsive user interfaces\nI love turning ideas into products that just feel right.',
                style: Fonts.nunito.copyWith(
                  fontSize: 16.sp,
                  color: Colors.grey[600],
                  height: 1.5.h,
                  fontFamily: Fonts.nunito.fontFamily,
                ),
              )
              .animate()
              .fadeIn(
                duration: 500.ms,
                delay:
                    (baseDelay + 400).ms, // Faster - appears sooner after name
                curve: Curves.easeOutCubic,
              )
              .slideY(
                begin: 0.15,
                end: 0,
                duration: 500.ms,
                curve: Curves.easeOutCubic,
              ),
          SizedBox(height: 32.h),
          // Buttons - smash effect with bounce (provides instant feedback)
          Row(
            children: [
              ElevatedButton(
                    onPressed: () {
                      launchUrl(
                        Uri.parse(
                          'https://drive.google.com/file/d/1H276mDZ2b1HYLAiw2yMOiUK8bRvsR98x/view?usp=sharing',
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryOrange,
                      padding: EdgeInsets.symmetric(
                        horizontal: 22.w,
                        vertical: 12.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Resume',
                      style: Fonts.roboto.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                  .animate()
                  .fadeIn(
                    duration: 300.ms,
                    delay: (baseDelay + 500).ms,
                  ) // Faster - appears sooner
                  .scale(
                    begin: const Offset(
                      1.5,
                      1.5,
                    ), // Start large for "smash" effect
                    end: const Offset(1, 1),
                    duration: 500.ms, // Faster bounce
                    delay: (baseDelay + 500).ms,
                    curve: Curves
                        .elasticOut, // Bounce effect - provides instant feedback
                  ),
              SizedBox(width: 16.w),
              OutlinedButton(
                    onPressed: () {
                      launchUrl(
                        Uri.parse('https://www.linkedin.com/in/salehghulam/'),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.black),
                      padding: EdgeInsets.symmetric(
                        horizontal: 22.w,
                        vertical: 12.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'LinkedIn',
                      style: Fonts.roboto.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  )
                  .animate()
                  .fadeIn(
                    duration: 300.ms,
                    delay: (baseDelay + 550).ms,
                  ) // Faster - slight stagger from first button
                  .scale(
                    begin: const Offset(
                      1.5,
                      1.5,
                    ), // Start large for "smash" effect
                    end: const Offset(1, 1),
                    duration: 500.ms, // Faster bounce
                    delay: (baseDelay + 550).ms,
                    curve: Curves
                        .elasticOut, // Bounce effect - provides instant feedback
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
