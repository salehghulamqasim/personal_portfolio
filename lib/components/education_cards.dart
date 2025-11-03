// for education background
/*
shoudl return somthing like this 

EducationCard(
  institution: 'State University',
  degree: 'Bachelor of Science in Computer Science', 
  dateRange: '2015 - 2019',
  description: '...',
  imagePath: 'assets/images/university_logo.png',
),

*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/themes/colors.dart';
import 'package:personal_portfolio/themes/text_styles.dart';

class EducationCards extends StatefulWidget {
  final String institution;
  final String degree;
  final String description;
  final String dateRange;
  const EducationCards({
    super.key,
    required this.institution,
    required this.degree,
    required this.description,
    required this.dateRange,
  });

  @override
  State<EducationCards> createState() => _EducationCardsState();
}

class _EducationCardsState extends State<EducationCards> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width < 768 ? 280.w : 400.w,
        maxWidth: MediaQuery.of(context).size.width < 768 ? 350.w : 400.w,
      ),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          // Move UP by 8px when hovered
          transform: Matrix4.translationValues(0, isHovered ? -8 : 0, 0),
          padding: EdgeInsets.all(
            MediaQuery.of(context).size.width < 768 ? 16.w : 20.w,
          ),
          decoration: BoxDecoration(
            color: AppColors.cardBackground, // White stays same
            borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.width < 768 ? 16.r : 24.r,
            ),
            boxShadow: [
              BoxShadow(
                // Exact shadow specifications
                color: isHovered
                    ? const Color(0x26708FB0) // rgba(112, 144, 176, 0.15)
                    : const Color(0x14708FB0), // rgba(112, 144, 176, 0.08)
                offset: Offset(0, isHovered ? 12 : 4), // Y: 4px -> 12px
                blurRadius: isHovered ? 48 : 24, // Blur: 24px -> 48px
                spreadRadius: 0, // Spread: 0px (no change)
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.institution,
                style: Fonts.playfair.copyWith(
                  fontSize: MediaQuery.of(context).size.width < 768
                      ? 18.sp
                      : 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width < 768 ? 12.h : 16.h,
              ),
              Text(
                widget.degree,
                style: Fonts.nunito.copyWith(
                  fontSize: MediaQuery.of(context).size.width < 768
                      ? 14.sp
                      : 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width < 768 ? 10.h : 12.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width < 768
                      ? 10.w
                      : 12.w,
                  vertical: MediaQuery.of(context).size.width < 768 ? 3.h : 4.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryOrange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width < 768 ? 8.r : 12.r,
                  ),
                ),
                child: Text(
                  widget.dateRange,
                  style: Fonts.roboto.copyWith(
                    fontSize: MediaQuery.of(context).size.width < 768
                        ? 10.sp
                        : 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width < 768 ? 10.h : 12.h,
              ),
              Text(
                widget.description,
                style: Fonts.nunito.copyWith(
                  fontSize: MediaQuery.of(context).size.width < 768
                      ? 12.sp
                      : 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
