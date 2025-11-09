import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/themes/colors.dart';
import 'package:personal_portfolio/themes/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // WIDE SCREEN LAYOUT (Laptop)
        if (constraints.maxWidth > 800) {
          return SizedBox(
            height: 600.h, // Fixed height prevents layout shift
            child: Row(
              children: [
                // 1. LEFT SIDE: Text content with padding
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 24.w),
                    child: HeroTextContent(),
                  ),
                ),

                // 2. RIGHT SIDE: Image without padding (full width)
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Placeholder with same aspect ratio
                      Container(
                        color:
                            Colors.grey[100], // Subtle background while loading
                        child: AspectRatio(
                          aspectRatio: 640 / 560, // Match your image ratio
                          child: Image.asset(
                            "assets/images/MaskedSaleh.webp",
                            cacheHeight:
                                (560 * MediaQuery.of(context).devicePixelRatio)
                                    .round(),
                            cacheWidth:
                                (640 * MediaQuery.of(context).devicePixelRatio)
                                    .round(),
                            fit: BoxFit.cover,
                            frameBuilder:
                                (
                                  context,
                                  child,
                                  frame,
                                  wasSynchronouslyLoaded,
                                ) {
                                  if (wasSynchronouslyLoaded) return child;
                                  return AnimatedOpacity(
                                    opacity: frame == null ? 0 : 1,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeOut,
                                    child: child,
                                  );
                                },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        // NARROW SCREEN LAYOUT (Mobile)
        else {
          return Column(
            children: [
              HeroImageStack(), // Image stays full-width
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: HeroTextContent(),
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
    return Container(
      height: 400.h,
      color: Colors.grey[100], // Subtle background while loading
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
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded) return child;
                return AnimatedOpacity(
                  opacity: frame == null ? 0 : 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  child: child,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//left side text content
class HeroTextContent extends StatelessWidget {
  const HeroTextContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Flutter Developer',
            style: Fonts.playfair.copyWith(
              fontSize: 20.sp,
              fontFamily: Fonts.nunito.fontFamily,
              color: const Color(0xFFFCC346),
            ),
          ),
          SizedBox(height: 16.h),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Hello, my name\nis Saleh Ghulam',
                textStyle: Fonts.playfair.copyWith(
                  fontSize: 42.sp,
                  color: Colors.black87,
                  height: 1.2,
                  fontFamily: Fonts.playfair.fontFamily,
                ),
                speed: Duration(milliseconds: 150),
              ),
            ],
            totalRepeatCount: 1,
            pause: Duration(milliseconds: 1000),
            displayFullTextOnTap: true,
          ),
          SizedBox(height: 16.h),
          Text(
            'I build apps that people actually want to use.\nStarted coding during university, got obsessed with Flutter, and now I can\'t stop building stuff. Currently crushing on clean animations and pixel-perfect UIs.',
            style: Fonts.nunito.copyWith(
              fontSize: 16.sp,
              color: Colors.grey[600],
              height: 1.5,
              fontFamily: Fonts.nunito.fontFamily,
            ),
          ),
          SizedBox(height: 32.h),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
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
              ),
              SizedBox(width: 16.w),
              OutlinedButton(
                onPressed: () {},
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
