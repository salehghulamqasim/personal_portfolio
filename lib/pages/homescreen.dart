import 'package:flutter/material.dart';
import 'package:personal_portfolio/components/app_bar.dart';
import 'package:personal_portfolio/components/project_card.dart';
import 'package:personal_portfolio/components/section_title.dart';
import 'package:personal_portfolio/sections/footer_wave.dart';

import 'package:personal_portfolio/sections/hero_section.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/sections/socials_footer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isAtTop = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final atTop =
        !_scrollController.hasClients || _scrollController.offset <= 0.0;
    if (atTop != _isAtTop) {
      setState(() => _isAtTop = atTop);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '/';

    return Scaffold(
      extendBodyBehindAppBar:
          true, //tells the body to go behind app bar. so the yellow blob starting from appbar
      appBar: CustomAppBar(
        opacity: _isAtTop ? 1.0 : 0.0,
        currentRoute: currentRoute,
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              const HeroSection(),

              // Projects section with lava lamp background
              Stack(
                children: [
                  // Lava lamp background (only for projects section)
                  // Positioned.fill(
                  //   child: LavaLampEffect(
                  //     size: const Size(500, 300),
                  //     color: const Color.fromRGBO(252, 248, 230, 1.0),

                  //     lavaCount: 2,
                  //     speed: 3,
                  //     repeatDuration: const Duration(seconds: 4),
                  //   ),
                  // ),
                  // Projects content on top
                  Column(
                    children: [
                      SizedBox(height: 108.h),
                      SectionTitle(text: 'Projects!', lineWidth: 80),
                      SizedBox(height: 48.h),

                      // All your project cards (keeping them as they are)
                      const ProjectCard(
                        title: 'Play Baloot',
                        description:
                            'I created this personal project in order to show how to create an interface in Figma using a portfolio as an example.',
                        imagePath: 'assets/images/circle.jpg',
                        imageOnRight: true,
                      ),
                      const ProjectCard(
                        title: 'Ashwat Counter',
                        description:
                            'I created this personal project in order to show how to create an interface in Figma using a portfolio as an example.',
                        imagePath: 'assets/images/circle.jpg',
                        imageOnRight: false,
                      ),

                      // ... (rest of your project cards)
                      const SizedBox(height: 80),
                      Socials(),
                      const SizedBox(height: 40),
                      FooterWave(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // Remove any bottomNavigationBar or ensure resizeToAvoidBottomInset: false
      resizeToAvoidBottomInset: false,
    );
  }
}
