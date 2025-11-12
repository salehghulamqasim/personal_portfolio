import 'package:flutter/material.dart';
import 'package:lava_lamp_effect/lava_lamp_effect.dart';
import 'package:personal_portfolio/components/scrollable_page.dart';
import 'package:personal_portfolio/components/section_title.dart';
import 'package:personal_portfolio/sections/contact_me.dart';
import 'package:personal_portfolio/sections/footer_wave.dart';
import 'package:personal_portfolio/sections/socials_footer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/themes/text_styles.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '/';
    final isMobile = MediaQuery.of(context).size.width < 768;

    return ScrollablePage(
      currentRoute: currentRoute,
      child: Container(
        color: const Color(0xFFF9FAFF),

        child: Column(
          children: [
            SizedBox(
              height: kToolbarHeight,
            ), // Add space for transparent AppBar

            Stack(
              children: [
                SizedBox(
                  height: 600.h,
                  width: double.infinity,
                  child: LavaLampEffect(
                    size: Size(800.w, 600.h),
                    color: const Color.fromRGBO(252, 248, 230, 1.0),
                    lavaCount: 4,
                    speed: 2,
                    repeatDuration: const Duration(seconds: 4),
                  ),
                ),

                Column(
                  children: [
                    SizedBox(height: 18.h),

                    SectionTitle(
                      text: 'Get in Touch!',
                      lineWidth: 100,
                      size: isMobile ? 42 : 66,
                    )
                        .animate()
                        .fadeIn(delay: 200.ms, duration: 600.ms)
                        .slideY(begin: -0.1, end: 0, duration: 600.ms, curve: Curves.easeOut),
                    SizedBox(
                      height: 32.h,
                    ), // Standardized height after SectionTitle
                    SizedBox(
                      width: isMobile ? 300.w : 700.w,
                      child: Text(
                        'Have a question or want to work together? I\'d love to hear from you. Send me a message and I\'ll respond as soon as possible!',
                        style: TextStyle(
                          fontFamily: Fonts.nunito.fontFamily,
                          fontSize: isMobile ? 16 : 18, // Smaller on mobile
                          color: const Color(0xFF828282),
                          height: 1.6,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 4,
                      ),
                    )
                        .animate()
                        .fadeIn(delay: 400.ms, duration: 600.ms)
                        .slideY(begin: 0.1, end: 0, duration: 600.ms, curve: Curves.easeOut),

                    SizedBox(height: 30.h),

                    const ContactForm()
                        .animate()
                        .fadeIn(delay: 600.ms, duration: 600.ms)
                        .scale(begin: const Offset(0.95, 0.95), duration: 600.ms, curve: Curves.easeOut),
                  ],
                ),
              ],
            ),

            SizedBox(height: 60.h),
            // Social links/footer
            Socials()
                .animate()
                .fadeIn(delay: 800.ms, duration: 600.ms),

            SizedBox(height: 80.h),
            FooterWave(userColor: Color(0xFFF9FAFF))
                .animate()
                .fadeIn(delay: 1000.ms, duration: 600.ms),
          ],
        ),
      ),
    );
  }
}
