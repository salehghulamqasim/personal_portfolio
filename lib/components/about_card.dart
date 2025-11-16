import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/themes/text_styles.dart';
import 'package:personal_portfolio/components/language_chips.dart';

class AboutCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final List<String>? languages;
  final bool isLanguageCard;
  final WrapAlignment? alignment;

  const AboutCard({
    super.key,
    required this.title,
    required this.icon,
    this.subtitle,
    this.languages,
    this.isLanguageCard = false,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: isMobile ? 340.w : 450.w,
      height: isMobile ? 280.h : 340.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7090B0).withValues(alpha: 0.1),
            offset: const Offset(0, 6),
            blurRadius: 64,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 24.w : 32.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Icon
            Icon(
              icon,
              size: isMobile ? 36 : 40,
              color: const Color(0xFFFDC435),
            ),
            SizedBox(height: isMobile ? 24.h : 24.h),

            // Title
            Text(
              title,
              style: TextStyle(
                fontFamily: Fonts.playfair.fontFamily,
                fontSize: isMobile ? 28 : 28,
                fontWeight: FontWeight.w900,
                color: const Color(0xFF25282B),
                height: 1.2,
              ),
            ),

            // Conditional Content
            if (isLanguageCard && languages != null) ...[
              SizedBox(height: isMobile ? 32.h : 32.h),
              Expanded(
                child: Center(
                  child: LanguageChips(
                    languages: languages!,
                    alignment: WrapAlignment.center,
                  ),
                ),
              ),
            ] else if (!isLanguageCard && subtitle != null) ...[
              SizedBox(height: isMobile ? 24.h : 16.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontFamily: Fonts.nunito.fontFamily,
                      fontSize: isMobile ? 22 : 24,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF25282B),
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: isMobile ? 16.h : 8.h),
                  Container(
                    height: 4,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFDC435), Colors.transparent],
                        stops: [1, 1],
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// USAGE EXAMPLES:
/// 
/// ```dart
/// // Language Card
/// AboutCard(
///   title: 'Languages',
///   icon: Icons.language,
///   isLanguageCard: true,
///   languages: ['English', 'Arabic', 'Urdu'],
///   alignment: WrapAlignment.center,
/// )
/// 
/// // Education Card
/// AboutCard(
///   title: 'Degree',
///   icon: Icons.school,
///   subtitle: 'Bachelors in Computer Science',
/// )
/// ``