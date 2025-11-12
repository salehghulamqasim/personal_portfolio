import 'package:flutter/material.dart';
import 'package:personal_portfolio/themes/colors.dart';
import 'package:personal_portfolio/themes/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

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
                    child: HeroTextContent(),
                  ),
                ),

                // 2. RIGHT SIDE: Image without padding (full width)
                Expanded(
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
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          // NARROW SCREEN LAYOUT (Mobile)
          else {
            final isMobile = MediaQuery.of(context).size.width < 768;
            // create a small variable for mobile horizontal padding so it's easy to tweak
            final horizontalPadding = isMobile ? 16.w : 24.w;

            return Column(
              children: [
                const HeroImageStack(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: const HeroTextContent(),
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
  const HeroTextContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 24.h,
        horizontal: isMobile ? 18.w : 24.w,
      ),
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
                'Hello, my name is Saleh Ghulam',
                textStyle: Fonts.playfair.copyWith(
                  fontSize: MediaQuery.of(context).size.width < 768
                      ? 30.sp
                      : 40.sp, // Mobile: 20.sp, Desktop: 40.sp
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
            'From concept to clean, responsive user interfaces\nI love turning ideas into products that just feel right.',
            style: Fonts.nunito.copyWith(
              fontSize: 16.sp,
              color: Colors.grey[600],
              height: 1.5.h,
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
