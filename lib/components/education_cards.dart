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
    final isMobile = MediaQuery.of(context).size.width < 768;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: isMobile ? 280.w : 350.w,
        maxWidth: isMobile ? 350.w : 400.w,
      ),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          // Move UP by 8px when hovered (same as experience cards)
          transform: Matrix4.translationValues(0, isHovered ? -8 : 0, 0),
          width: double
              .infinity, // to take full width of parent SizedBox in EduAndExp page

          padding: EdgeInsets.all(
            isMobile ? 20.w : 24.w, // Match experience cards padding better
          ),
          decoration: BoxDecoration(
            color: AppColors.cardBackground, // White stays same
            borderRadius: BorderRadius.circular(isMobile ? 12.r : 16.r),
            boxShadow: [
              BoxShadow(
                // Exact shadow specifications (same as experience cards)
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 12.w : 16.w,
                      vertical: isMobile ? 4.h : 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryOrange,
                      borderRadius: BorderRadius.circular(
                        isMobile ? 8.r : 12.r,
                      ),
                    ),
                    child: Text(
                      widget.dateRange,
                      style: Fonts.roboto.copyWith(
                        fontSize: isMobile ? 12.sp : 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: isMobile ? 16.h : 20.h),

              // Institution name (main title)
              Text(
                widget.institution,
                style: Fonts.playfair.copyWith(
                  fontSize: isMobile ? 20.sp : 24.sp, // Slightly larger
                  fontWeight: FontWeight.w900, // Match experience cards
                  color: AppColors.textPrimary,
                  height: 1.3,
                ),
              ),

              SizedBox(height: 8.h),

              // Degree (subtitle)
              Text(
                widget.degree,
                style: Fonts.nunito.copyWith(
                  fontSize: isMobile ? 14.sp : 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors
                      .textSecondary, // Use secondary color like experience cards
                  height: 1.5,
                ),
              ),

              SizedBox(height: isMobile ? 16.h : 20.h),

              // Description
              Text(
                widget.description,
                style: Fonts.nunito.copyWith(
                  fontSize: isMobile ? 14.sp : 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                  height: 1.6, // Match experience cards line height
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
