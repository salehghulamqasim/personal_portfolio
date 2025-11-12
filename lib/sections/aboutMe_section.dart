import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/components/aboutMe.dart';

/// HERO SECTION
class HeroSection extends StatelessWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Text(
            'About Me',
            style: TextStyle(
              fontSize: isMobile ? 48.sp : 64.sp,
              fontWeight: FontWeight.w800,
              color: Color(0xFF25282B),
              letterSpacing: -1.5,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            'Developer. Creator. Problem Solver.',
            style: TextStyle(
              fontSize: isMobile ? 18.sp : 22.sp,
              color: Color(0xFF828282),
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

/// BENTO GRID SECTION
class BentoGridSection extends StatelessWidget {
  const BentoGridSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    if (isMobile) {
      return GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 20.h,
        crossAxisSpacing: 16.w,
        childAspectRatio: 0.75,
        children: [
          StoryBox(),
          PassionBox(
            icon: Icons.camera_alt,
            title: 'Photography',
            color: Color(0xFFFCC346),
          ),
          PassionBox(
            icon: Icons.music_note,
            title: 'Music',
            color: Color(0xFFFF6B6B),
          ),
          HackathonBox(number: '1'),
        ],
      );
    }

    return Wrap(
      spacing: 24.w,
      runSpacing: 28.h,
      children: [
        SizedBox(
          width: (1200.w - 48.w) * 2 / 3,
          height: 280.h,
          child: StoryBox(),
        ),
        SizedBox(
          width: (1200.w - 48.w) / 3,
          height: 280.h,
          child: PassionBox(
            icon: Icons.camera_alt,
            title: 'Photography',
            color: Color(0xFFFCC346),
          ),
        ),
      ],
    );
  }
}
