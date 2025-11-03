import 'package:flutter/material.dart';
import 'package:personal_portfolio/themes/colors.dart';
// import 'package:flutter_svg/flutter_svg.dart';
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
          return Row(
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
                    Image.asset(
                      "assets/images/MaskedSaleh.png",
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
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/MaskedSaleh.png",
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
          Text(
            'Hello, my name\nis Saleh Ghulam',
            style: Fonts.playfair.copyWith(
              fontSize: 42.sp,
              color: Colors.black87,
              height: 1.2,
              fontFamily: Fonts.playfair.fontFamily,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Front-end developer and designer. I\'m passionate about creating beautiful and functional digital experiences.',
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
                  'Portfolio',
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
