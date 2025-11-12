import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/components/about_card.dart';
import 'package:personal_portfolio/components/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Center(
      child: Column(
        children: [
          SectionTitle(text: "About Me"),
          SizedBox(height: 32.h), // Standardized height after SectionTitle
          Wrap(
            spacing: isMobile ? 12.w : 12.w,
            runSpacing: isMobile ? 12.h : 24.h,
            alignment: WrapAlignment.center,
            children: [
              AboutCard(
                title: "Degree",
                isLanguageCard: false,
                subtitle: "Bachelors in Computer Science",
                icon: Icons.school,
              ),
              SizedBox(width: isMobile ? 100.h : 1.h),
              AboutCard(
                title: "Languages",
                icon: Icons.language,
                isLanguageCard: true,
                languages: ["English", "Arabic", "Urdu"],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
