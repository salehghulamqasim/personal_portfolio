import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lava_lamp_effect/lava_lamp_effect.dart';
import 'package:personal_portfolio/components/scrollable_page.dart';
import 'package:personal_portfolio/components/section_title.dart';
import 'package:personal_portfolio/pages/about_screen.dart';
import 'package:personal_portfolio/sections/footer_wave.dart';
import 'package:personal_portfolio/sections/hero_section.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/sections/project_sections.dart';
import 'package:personal_portfolio/sections/socials_footer.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final ScrollController _scrollController = ScrollController();
  bool isMobile = false; // Set based on your responsive logic

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '/';

    return WebSmoothScroll(
      controller: _scrollController,
      scrollSpeed: 0.7, // Lower means slower scroll
      scrollAnimationLength: 1200, // Higher means longer smoother animation
      curve: Curves.easeInOutCirc, // Gentler acceleration
      child: ScrollablePage(
        currentRoute: currentRoute,
        child: Column(
          children: [
            HeroSection()
                .animate()
                .fadeIn(delay: 100.ms, duration: 600.ms)
                .slideY(
                  begin: -0.1,
                  end: 0,
                  duration: 600.ms,
                  curve: Curves.easeOut,
                ),

            Stack(
              children: [
                SizedBox(
                  height: 950.h,
                  width: double.infinity,
                  child: LavaLampEffect(
                    size: Size(800.w, 950.h),
                    color: const Color.fromRGBO(252, 248, 230, 1.0),
                    lavaCount: 6,
                    speed: 1,
                    repeatDuration: const Duration(seconds: 4),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 58.h),
                    AboutSection()
                        .animate()
                        .fadeIn(delay: 200.ms, duration: 600.ms)
                        .slideY(
                          begin: 0.1,
                          end: 0,
                          duration: 600.ms,
                          curve: Curves.easeOut,
                        ),
                    SizedBox(height: 58.h),

                    SectionTitle(text: 'Projects!', lineWidth: 80)
                        .animate()
                        .fadeIn(delay: 400.ms, duration: 600.ms)
                        .slideY(
                          begin: 0.1,
                          end: 0,
                          duration: 600.ms,
                          curve: Curves.easeOut,
                        ),
                    SizedBox(height: 8.h), // Unified bottom spacing
                    ProjectSection()
                        .animate()
                        .fadeIn(delay: 600.ms, duration: 600.ms)
                        .slideY(
                          begin: 0.1,
                          end: 0,
                          duration: 600.ms,
                          curve: Curves.easeOut,
                        ),

                    const SizedBox(height: 80),
                    Socials().animate().fadeIn(delay: 800.ms, duration: 600.ms),
                    const SizedBox(height: 40),

                    FooterWave().animate().fadeIn(
                      delay: 1000.ms,
                      duration: 600.ms,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
