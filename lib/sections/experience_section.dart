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
          title: 'QaYd Company, Jeddah, Saudi Arabia',
          position: 'Software Developer',
          dateRange: 'Mar 2025 – Aug 2025',
          description:
              '• Created and managed company GitHub org for version control and collaboration.\n• Added QR code features in Flutter, fixed NFC, integrated backend, created docs, supported handover.\n• Enhanced and optimized WordPress site for SEO, performance, responsiveness, and booking features.\n• Managed company POS devices, handled IT troubleshooting, and set up ClickUp for project management.',
        ),
        const SizedBox(height: 24),
        ExperienceCards(
          title: 'RedSand Technology - Internship, Jeddah, Saudi Arabia',
          position: 'Front-End Web Developer',
          dateRange: 'Oct 2023 – Dec 2023',
          description:
              '• Developed front-end using HTML, CSS, and JavaScript, enhancing user interface.\n• Collaborated with UI/UX designers to ensure responsive, cross-browser compatibility.\n• Created a MySQL database schema and optimized SQL queries.',
        ),
        const SizedBox(height: 24),
        ExperienceCards(
          title: 'Technocolab - Internship, Remote',
          position: 'Data Analyst',
          dateRange: 'Jan 2023 – Mar 2023',
          description:
              '• Streamlined data processing and analysis, improving data quality and usability.\n• Executed data visualizations and exploratory analysis to extract actionable insights.\n• Built machine learning models to predict trends, optimizing decision-making processes.',
        ),
        const SizedBox(height: 24),
        ExperienceCards(
          title: 'SmartMethods - Internship, Jeddah, Saudi Arabia',
          position: 'Internet of Things Engineer',
          dateRange: 'Jun 2021 – Aug 2021',
          description:
              '• Developed robot arm control interfaces using HTML, CSS, and JavaScript.\n• Implemented PHP and MySQL backends, ensuring robust data integration.\n• Utilized IBM Watson for AI tasks for enhanced user interaction and automation.',
        ),
      ],
    );
  }
}
