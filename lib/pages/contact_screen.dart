import 'package:flutter/material.dart';
import 'package:lava_lamp_effect/lava_lamp_effect.dart';
import 'package:personal_portfolio/components/scrollable_page.dart';
import 'package:personal_portfolio/components/section_title.dart';
import 'package:personal_portfolio/sections/contact_me.dart';
import 'package:personal_portfolio/sections/footer_wave.dart';
import 'package:personal_portfolio/sections/socials_footer.dart';
import 'package:personal_portfolio/themes/colors.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '/';

    return ScrollablePage(
      currentRoute: currentRoute,
      child: Container(
        color: const Color(0xFFF9FAFF),

        child: Column(
          children: [
            SizedBox(
              height: kToolbarHeight,
            ), // Add space for transparent AppBar

            SizedBox(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: LavaLampEffect(
                      size: const Size(500, 300), // Same as experience page
                      color: AppColors.primaryOrange,
                      lavaCount: 8,
                      speed: 2,
                      repeatDuration: const Duration(seconds: 4),
                    ),
                  ),

                  Column(
                    children: [
                      const SizedBox(height: 18),

                      const SectionTitle(
                        text: 'Get in Touch!',
                        lineWidth: 100,
                        size: 32,
                      ),
                      const SizedBox(height: 8), // Add some space
                      ContactForm(),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Socials(),
            const SizedBox(height: 16),
            FooterWave(userColor: Color(0xFFF9FAFF)),
          ],
        ),
      ),
    );
  }
}
