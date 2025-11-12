//this is a project sections file WHICH is a collection of different project sections s
// its a reusable section to be used in hoemscreen page

import 'package:flutter/material.dart';
import 'package:personal_portfolio/components/experience_cards.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          ExperienceCards(
            title: 'QaYd Company',
            position: 'Software Developer',
            dateRange: ' Mar 2025 – Aug 2025',
            description:
                'Created and managed company GitHub org, added QR code features in Flutter, and optimized WordPress site for SEO.',
          ),
          const SizedBox(height: 24),
          ExperienceCards(
            title: 'RedSand Technology',
            position: 'Front-End Web Developer (Intern)',
            dateRange: 'Oct 2023 – Dec 2023',
            description:
                'Developed front-end using HTML, CSS, and JavaScript. Collaborated with UI/UX designers for responsive design.',
          ),
          const SizedBox(height: 24),
          ExperienceCards(
            title: 'Technocolab',
            position: 'Data Analyst (Intern)',
            dateRange: 'Jan 2023 – Mar 2023',
            description:
                'Streamlined data processing, built machine learning models, and created data visualizations.',
          ),
          const SizedBox(height: 24),
          ExperienceCards(
            title: 'SmartMethods',
            position: 'IoT Engineer (Intern)',
            dateRange: 'Jun 2021 – Aug 2021',
            description:
                'Developed robot arm control interfaces and implemented PHP/MySQL backends.',
          ),
        ],
      );
  }
}
