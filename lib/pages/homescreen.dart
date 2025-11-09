import 'package:flutter/material.dart';
import 'package:personal_portfolio/components/scrollable_page.dart';
import 'package:personal_portfolio/components/section_title.dart';
import 'package:personal_portfolio/sections/footer_wave.dart';
import 'package:personal_portfolio/sections/hero_section.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/sections/project_sections.dart';
import 'package:personal_portfolio/sections/socials_footer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final ScrollController _scrollController = ScrollController();
  // final _advancedDrawerController = AdvancedDrawerController();
  bool _isAtTop = true;
  bool isMobile = false; // Set based on your responsive logic

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
    // _advancedDrawerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '/';

    return ScrollablePage(
      currentRoute: currentRoute,
      child: Column(
        children: [
          const HeroSection(),
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 108.h),
                  SectionTitle(text: 'Projects!', lineWidth: 80),
                  SizedBox(height: 48.h),
                  ProjectSection(),

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
    );
  }
}
