import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/components/education_cards.dart';
import 'package:personal_portfolio/components/skeleton.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySkeleton(
      child: Wrap(
        spacing: 24.w,
        runSpacing: 24.h,
        children: const [
          EducationCards(
            institution: 'Pakistan International School',
            degree: 'Higher Secondary School Certificate - Commerce',
            dateRange: '2012 - 2019',
            description:
                //commerce economics accounting banking background
                'Relevant coursework: Accounting, Economics, Business Studies, Banking, and Finance...',
          ),
          EducationCards(
            institution: 'Arab Open University',
            degree: 'Bachelor of Science in Computer Science',
            dateRange: '2019 - 2024',
            description:
                'Graduated with Honors. Relevant coursework: Data Structures, Algorithms, Database Systems, Coding...',
          ),
        ],
      ),
    );
  }
}
