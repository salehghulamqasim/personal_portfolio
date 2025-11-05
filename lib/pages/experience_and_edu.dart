import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lava_lamp_effect/lava_lamp_effect.dart';
import 'package:personal_portfolio/components/education_cards.dart';
// import 'package:personal_portfolio/components/hover_widget.dart';

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
                // Fixed container for lava lamp background
                SizedBox(
                  height: 2000, // Fixed large height
                  width: double.infinity,
                  child: LavaLampEffect(
                    size: const Size(800, 2000),
                    color: const Color.fromRGBO(252, 248, 230, 1.0),
                    lavaCount: 8,
                    speed: 2,
                    repeatDuration: const Duration(seconds: 4),
                  ),
                ),
                Column(
                  children: [
                    SectionTitle(text: 'Experiences!', lineWidth: 80, size: 32),
                    SizedBox(height: 48.h),
                    ExperienceCards(
                      title: 'Qayd Tech Solutions',
                      position: ' Software Developer',
                      dateRange: 'Nov 2025 - Oct 2025',
                      description:
                          'Worked on developing mobile applications using Flutter framework. Collaborated with cross-functional teams to design and implement new features, improving user engagement by 20%.',
                    ),
                    const SizedBox(height: 24),
                    ExperienceCards(
                      title: 'RedSand Technology',
                      position: 'Front end web developer',
                      dateRange: 'Nov 2025 - Oct 2025',
                      description:
                          'Developed responsive web applications using React.js and Redux. Improved website performance by 30% through code optimization and implemented SEO best practices to increase organic traffic.',
                    ),
                    const SizedBox(height: 24),
                    ExperienceCards(
                      title: 'Technocolab',
                      position: 'Data Analysis Intern',
                      dateRange: 'Nov 2025 - Oct 2025',
                      description:
                          'Assisted in data collection and analysis for various projects. Developed dashboards using Tableau to visualize key metrics and support decision-making processes.',
                    ),
                    const SizedBox(height: 24),
                    ExperienceCards(
                      title: 'SmartMethods',
                      position: 'IOT engineer Intern',
                      dateRange: 'Nov 2025 - Oct 2025',
                      description:
                          'Worked on developing IoT solutions using Raspberry Pi and Arduino. Collaborated with hardware engineers to design and implement new features, improving device connectivity and performance.',
                    ),
                    const SizedBox(height: 68),
                    SectionTitle(text: 'Education!', lineWidth: 80, size: 32),
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
                            ),
                            EducationCards(
                              institution: 'University of XYZ',
                              degree: 'Bachelor of Science in Computer Science',
                              dateRange: '2019 - 2023',
                              description:
                                  'Graduated with Honors. Relevant coursework: Data Structures, Algorithms, Database Systems, Web Development, Mobile App Development.',
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
