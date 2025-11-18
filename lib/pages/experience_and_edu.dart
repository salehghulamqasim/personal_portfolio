import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lava_lamp_effect/lava_lamp_effect.dart';
// import 'package:lava_lamp_effect/lava_lamp_effect.dart';
import 'package:personal_portfolio/components/education_cards.dart';
// import 'package:personal_portfolio/components/hover_widget.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:personal_portfolio/components/scrollable_page.dart';
import 'package:personal_portfolio/components/experience_cards.dart';
import 'package:personal_portfolio/components/section_title.dart';
import 'package:personal_portfolio/components/tech_skills.dart';
import 'package:personal_portfolio/sections/footer_wave.dart';
import 'package:personal_portfolio/sections/socials_footer.dart';

class ExperienceAndEducation extends StatelessWidget {
  const ExperienceAndEducation({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '/';
    final isMobile = MediaQuery.of(context).size.width < 768;
    return ScrollablePage(
      currentRoute: currentRoute,

      child: Container(
        color: const Color(
          0xFFF9FAFF,
        ), // Add this property if ScrollablePage supports it

        child: Column(
          children: [
            SizedBox(
              height: kToolbarHeight,
            ), // Add space for transparent AppBar
            Stack(
              children: [
                // Fixed container for lava lamp background
                SizedBox(
                  height: 2000, // Fixed large height
                  width: double.infinity,
                  child: LavaLampEffect(
                    size: Size(800.w, 600.h),
                    color: const Color.fromRGBO(252, 248, 230, 1.0),
                    lavaCount: 4,
                    speed: 2,
                    repeatDuration: const Duration(seconds: 4),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SectionTitle(
                            text: 'Experiences!',
                            lineWidth: 80,
                            size: 32,
                          )
                          .animate()
                          .fadeIn(delay: 200.ms, duration: 600.ms)
                          .slideY(
                            begin: 0.1,
                            end: 0,
                            duration: 600.ms,
                            curve: Curves.easeOut,
                          ),
                      SizedBox(height: 48.h),
                      ExperienceCards(
                            title: 'QaYd Company, Jeddah, Saudi Arabia',
                            position: 'Software Developer',
                            dateRange: 'Mar 2025 – Aug 2025',
                            description:
                                '• Created and managed company GitHub org for version control and collaboration.\n• Added QR code features in Flutter, fixed NFC, integrated backend, created docs, supported handover.\n• Enhanced and optimized WordPress site for SEO, performance, responsiveness, and booking features.\n• Managed company POS devices, handled IT troubleshooting, and set up ClickUp for project management.',
                          )
                          .animate()
                          .fadeIn(delay: 400.ms, duration: 600.ms)
                          .slideX(
                            begin: -0.1,
                            end: 0,
                            duration: 600.ms,
                            curve: Curves.easeOut,
                          ),
                      const SizedBox(height: 24),
                      ExperienceCards(
                            title:
                                'RedSand Technology - Internship, Jeddah, Saudi Arabia',
                            position: 'Front-End Web Developer',
                            dateRange: 'Oct 2023 – Dec 2023',
                            description:
                                '• Developed front-end using HTML, CSS, and JavaScript, enhancing user interface.\n• Collaborated with UI/UX designers to ensure responsive, cross-browser compatibility.\n• Created a MySQL database schema and optimized SQL queries.',
                          )
                          .animate()
                          .fadeIn(delay: 500.ms, duration: 600.ms)
                          .slideX(
                            begin: -0.1,
                            end: 0,
                            duration: 600.ms,
                            curve: Curves.easeOut,
                          ),
                      const SizedBox(height: 24),
                      ExperienceCards(
                            title: 'Technocolab - Internship, Remote',
                            position: 'Data Analyst',
                            dateRange: 'Jan 2023 – Mar 2023',
                            description:
                                '• Streamlined data processing and analysis, improving data quality and usability.\n• Executed data visualizations and exploratory analysis to extract actionable insights.\n• Built machine learning models to predict trends, optimizing decision-making processes.',
                          )
                          .animate()
                          .fadeIn(delay: 600.ms, duration: 600.ms)
                          .slideX(
                            begin: -0.1,
                            end: 0,
                            duration: 600.ms,
                            curve: Curves.easeOut,
                          ),
                      const SizedBox(height: 24),
                      ExperienceCards(
                            title:
                                'SmartMethods - Internship, Jeddah, Saudi Arabia',
                            position: 'Internet of Things Engineer',
                            dateRange: 'Jun 2021 – Aug 2021',
                            description:
                                '• Developed robot arm control interfaces using HTML, CSS, and JavaScript.\n• Implemented PHP and MySQL backends, ensuring robust data integration.\n• Utilized IBM Watson for AI tasks for enhanced user interaction and automation.',
                          )
                          .animate()
                          .fadeIn(delay: 700.ms, duration: 600.ms)
                          .slideX(
                            begin: -0.1,
                            end: 0,
                            duration: 600.ms,
                            curve: Curves.easeOut,
                          ),
                      const SizedBox(height: 68),
                      SectionTitle(text: 'Education!', lineWidth: 80, size: 32)
                          .animate()
                          .fadeIn(delay: 900.ms, duration: 600.ms)
                          .slideY(
                            begin: 0.1,
                            end: 0,
                            duration: 600.ms,
                            curve: Curves.easeOut,
                          ),
                      const SizedBox(height: 48),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width < 768
                                ? 20.w
                                : 60.w,
                          ),
                          child: Wrap(
                            spacing: 24.w,
                            runSpacing: 24.h,
                            alignment:
                                WrapAlignment.center, //this centers the card
                            children: [
                              SizedBox(
                                width: isMobile
                                    ? 320.w
                                    : 400.w, // so the width is fixed for consistency

                                child:
                                    EducationCards(
                                          institution:
                                              'Pakistan International School Jeddah',
                                          degree: 'HSSC - Commerce',
                                          dateRange: '2007 - 2019',
                                          description:
                                              'Relevant coursework: Principles of Accounting, Business Mathematics, Economics, Banking, and Commerce.',
                                        )
                                        .animate()
                                        .fadeIn(
                                          delay: 1100.ms,
                                          duration: 600.ms,
                                        )
                                        .scale(
                                          begin: const Offset(0.9, 0.9),
                                          duration: 600.ms,
                                          curve: Curves.easeOut,
                                        ),
                              ),
                              SizedBox(
                                width: isMobile
                                    ? 320.w
                                    : 400.w, // so the width is fixed for consistency
                                child:
                                    EducationCards(
                                          institution:
                                              'Arab Open University - Jeddah',
                                          degree:
                                              'Bachelor of Science in Computer Science',
                                          dateRange: '2019 - 2024',
                                          description:
                                              'Relevant coursework: Data Structures & Algorithms, Database Management, Object Oriented Programming, Operating Systems, Mathematics.',
                                        )
                                        .animate()
                                        .fadeIn(
                                          delay: 1200.ms,
                                          duration: 600.ms,
                                        )
                                        .scale(
                                          begin: const Offset(0.9, 0.9),
                                          duration: 600.ms,
                                          curve: Curves.easeOut,
                                        ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 48),
                      const SectionTitle(
                        text: 'Tech Skills',
                        lineWidth: 80,
                        size: 32,
                      ),

                      const SizedBox(height: 24),
                      TechSkills(
                        skills: const [
                          "flutter",
                          "dart",
                          "figma",
                          "adobe xd",
                          "sketch",
                          "photoshop",
                          "illustrator",
                          "html/css",
                          "javascript",
                          "react",
                          "user research",
                          "prototyping",
                          "design systems",
                          "wireframing",
                          "typography",
                          "color theory",
                        ],
                      ),

                      const SizedBox(height: 48),
                      Socials(),
                      const SizedBox(height: 80),
                      FooterWave(userColor: Color(0xFFF9FAFF)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
