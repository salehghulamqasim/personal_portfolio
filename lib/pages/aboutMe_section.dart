import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../components/aboutMe.dart';

/// ---------------------------  HERO  ---------------------------
class HeroSection extends StatelessWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(height: 8.h),
          Text(
            'About Me',
            style: TextStyle(
              fontSize: isMobile ? 48.sp : 64.sp,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF25282B),
              letterSpacing: -1.5,
            ),
          ).animate().scale(
            delay: 200.ms,
            duration: 500.ms,
            curve: Curves.easeOutBack,
          ),
          SizedBox(height: 16.h),
          Text(
            'Developer. Creator. Problem Solver.',
            style: TextStyle(
              fontSize: isMobile ? 18.sp : 22.sp,
              color: const Color(0xFF828282),
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ).animate().fadeIn(delay: 400.ms, duration: 600.ms),
        ],
      ),
    );
  }
}

/// ------------------------  BENTO  GRID  ------------------------
class BentoGridSection extends StatelessWidget {
  const BentoGridSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 768;

    if (isMobile) {
      return GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 20.h,
        crossAxisSpacing: 16.w,
        childAspectRatio: 0.75,
        children: const [
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
          PassionBox(
            icon: Icons.menu_book,
            title: 'Reading',
            color: Color(0xFF4ECDC4),
          ),
          HackathonBox(number: '1'),
          HackathonBox(number: '2'),
          PassionBox(
            icon: Icons.sports_esports,
            title: 'Gaming',
            color: Color(0xFF95E1D3),
          ),
          GDSCBox(),
          HackathonBox(number: '3'),
          HackathonBox(number: '4'),
        ],
      );
    }

    // Desktop layout - Passions grouped above, one wider hackathon box
    return Wrap(
      spacing: 24.w,
      runSpacing: 28.h,
      children: [
        SizedBox(
          width: (1200.w - 48.w) * 2 / 3,
          height: 280.h,
          child: const StoryBox(),
        ),
        SizedBox(
          width: (1200.w - 48.w) / 3,
          height: 280.h,
          child: const PassionBox(
            icon: Icons.camera_alt,
            title: 'Photography',
            color: Color(0xFFFCC346),
          ),
        ),
        // Passions row - grouped together
        SizedBox(
          width: (1200.w - 48.w) / 3,
          height: 180.h,
          child: const PassionBox(
            icon: Icons.music_note,
            title: 'Music',
            color: Color(0xFFFF6B6B),
          ),
        ),
        SizedBox(
          width: (1200.w - 48.w) / 3,
          height: 180.h,
          child: const PassionBox(
            icon: Icons.menu_book,
            title: 'Reading',
            color: Color(0xFF4ECDC4),
          ),
        ),
        SizedBox(
          width: (1200.w - 48.w) / 3,
          height: 180.h,
          child: const PassionBox(
            icon: Icons.sports_esports,
            title: 'Gaming',
            color: Color(0xFF95E1D3),
          ),
        ),
        // Wider hackathon box
        SizedBox(
          width: (1200.w - 48.w) / 2,
          height: 420.h,
          child: const HackathonBox(number: '1'),
        ),
        SizedBox(
          width: (1200.w - 48.w) / 2,
          height: 420.h,
          child: const GDSCBox(),
        ),
        SizedBox(
          width: (1200.w - 72.w) / 3,
          height: 300.h,
          child: const HackathonBox(number: '2'),
        ),
        SizedBox(
          width: (1200.w - 72.w) / 3,
          height: 300.h,
          child: const HackathonBox(number: '3'),
        ),
        SizedBox(
          width: (1200.w - 72.w) / 3,
          height: 300.h,
          child: const HackathonBox(number: '4'),
        ),
      ],
    );
  }
}
