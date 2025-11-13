import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/components/scrollable_page.dart';
import 'package:personal_portfolio/sections/footer_wave.dart';
import 'package:personal_portfolio/sections/socials_footer.dart';
import 'package:lava_lamp_effect/lava_lamp_effect.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'aboutMe_section.dart'; // ← sections live here

class AboutMePage extends StatelessWidget {
  const AboutMePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '/about';

    return ScrollablePage(
      currentRoute: currentRoute,
      child: Container(
        color: const Color(0xFFF9FAFF),
        child: Stack(
          children: [
            // Lava-lamp background
            Positioned.fill(
              child: LavaLampEffect(
                size: Size(800.w, 2000.h),
                color: const Color(0xFFFCC346).withOpacity(0.08),
                lavaCount: 5,
                speed: 1,
                repeatDuration: const Duration(seconds: 8),
              ),
            ),

            // Content
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: kToolbarHeight + 20.h),
                  const HeroSection(),
                  SizedBox(height: 40.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 1200.w),
                      child: const BentoGridSection(),
                    ),
                  ),
                  SizedBox(height: 80.h),
                  const Socials(),
                  SizedBox(height: 40.h),
                  FooterWave(userColor: const Color(0xFFF9FAFF)),
                ],
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 600.ms, curve: Curves.easeOut);
  }
}