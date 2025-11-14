import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lava_lamp_effect/lava_lamp_effect.dart';
import 'package:personal_portfolio/components/education_cards.dart';
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
                SizedBox(
                  height: 2000.h,
                  width: double.infinity,
                  child: LavaLampEffect(
                    size: Size(double.infinity, 600.h),
                    color: const Color.fromRGBO(252, 248, 230, 1.0),
                    lavaCount: 6,
                    speed: 1,
                    repeatDuration: const Duration(seconds: 10),
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
                            title: 'Qayd Tech Solutions',
                            position: ' Software Developer',
                            dateRange: 'Nov 2025 - Oct 2025',
                            description:
                                'Worked on developing mobile applications using Flutter framework. Collaborated with cross-functional teams to design and implement new features, improving user engagement by 20%.',
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
                            title: 'RedSand Technology',
                            position: 'Front end web developer',
                            dateRange: 'Nov 2025 - Oct 2025',
                            description:
                                'Developed responsive web applications using React.js and Redux. Improved website performance by 30% through code optimization and implemented SEO best practices to increase organic traffic.',
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
                            title: 'Technocolab',
                            position: 'Data Analysis Intern',
                            dateRange: 'Nov 2025 - Oct 2025',
                            description:
                                'Assisted in data collection and analysis for various projects. Developed dashboards using Tableau to visualize key metrics and support decision-making processes.',
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
                            title: 'SmartMethods',
                            position: 'IOT engineer Intern',
                            dateRange: 'Nov 2025 - Oct 2025',
                            description:
                                'Worked on developing IoT solutions using Raspberry Pi and Arduino. Collaborated with hardware engineers to design and implement new features, improving device connectivity and performance.',
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
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width < 768
                                ? 40.w
                                : 60.w, // align with timeline dot + gap
                          ),
                          child: Wrap(
                            spacing: 24.w,
                            runSpacing: 24.h,
                            children: [
                              EducationCards(
                                    institution:
                                        'Pakistan International School Jeddah',
                                    degree: 'HSSC - Commerce',
                                    dateRange: '2012 - 2019',
                                    description:
                                        'Graduated with Honors. Relevant coursework: Data Structures, Algorithms, Database Systems, Web Development, Mobile App Development.',
                                  )
                                  .animate()
                                  .fadeIn(delay: 1100.ms, duration: 600.ms)
                                  .scale(
                                    begin: const Offset(0.9, 0.9),
                                    duration: 600.ms,
                                    curve: Curves.easeOut,
                                  ),
                              EducationCards(
                                    institution: 'University of XYZ',
                                    degree:
                                        'Bachelor of Science in Computer Science',
                                    dateRange: '2019 - 2023',
                                    description:
                                        'Graduated with Honors. Relevant coursework: Data Structures, Algorithms, Database Systems, Web Development, Mobile App Development.',
                                  )
                                  .animate()
                                  .fadeIn(delay: 1200.ms, duration: 600.ms)
                                  .scale(
                                    begin: const Offset(0.9, 0.9),
                                    duration: 600.ms,
                                    curve: Curves.easeOut,
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
                          )
                          .animate()
                          .fadeIn(delay: 1400.ms, duration: 600.ms)
                          .slideY(
                            begin: 0.1,
                            end: 0,
                            duration: 600.ms,
                            curve: Curves.easeOut,
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
                          )
                          .animate()
                          .fadeIn(delay: 1600.ms, duration: 600.ms)
                          .scale(
                            begin: const Offset(0.95, 0.95),
                            duration: 600.ms,
                            curve: Curves.easeOut,
                          ),
                      const SizedBox(height: 48),
                      Socials().animate().fadeIn(
                        delay: 1800.ms,
                        duration: 600.ms,
                      ),
                      const SizedBox(height: 80),
                      FooterWave(
                        userColor: Color(0xFFF9FAFF),
                      ).animate().fadeIn(delay: 2000.ms, duration: 600.ms),
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
