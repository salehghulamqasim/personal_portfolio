//For work experience

/*
ExperienceCard(
  title: 'Tech Innovators Inc.',
  position: 'Senior UI/UX Designer', 
  dateRange: '2020 - Present',
  description: '...',
  isSelected: false,
  onTap: () {},
),
*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:personal_portfolio/themes/text_styles.dart';

class ExperienceCards extends StatefulWidget {
  final String title; // Company name
  final String position; // Job title
  final String dateRange; // Date range
  final String description; // Job description
  final bool isSelected; // For timeline dot animation
  final VoidCallback? onTap; // Tap callback
  final bool isLast; // To hide line on last card

  const ExperienceCards({
    super.key,
    required this.title,
    required this.position,
    required this.dateRange,
    required this.description,
    this.isSelected = false,
    this.onTap,
    this.isLast = false,
  });

  @override
  State<ExperienceCards> createState() => _ExperienceCardsState();
}

class _ExperienceCardsState extends State<ExperienceCards> {
  bool isCardHovered = false;
  bool isDotHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        constraints: BoxConstraints(maxWidth: 900.w),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width < 768 ? 20.w : 0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline section (dot + line)
            Column(
              children: [
                // Timeline dot (yellow circle) with hover effect
                MouseRegion(
                  onEnter: (_) => setState(() => isDotHovered = true),
                  onExit: (_) => setState(() => isDotHovered = false),
                  cursor: SystemMouseCursors.click,
                  child:
                      AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: isDotHovered
                                ? 26.w
                                : 20.w, // 20px normal, 26px hover
                            height: isDotHovered ? 26.h : 20.h,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFDC435),
                              shape: BoxShape.circle,
                            ),
                          )
                          .animate()
                          .fadeIn(delay: 200.ms, duration: 500.ms)
                          .scale(
                            begin: Offset(0.5, 0.5),
                            end: Offset(1, 1),
                            duration: 500.ms,
                            curve: Curves.easeOut,
                          ),
                ),

                // Timeline line below the dot
                if (!widget.isLast) // Only show line if not last card
                  Container(
                    width: 2.w,
                    height: MediaQuery.of(context).size.height * 0.08,
                    color: const Color(0xFFFDC435).withValues(alpha: 0.5),
                    margin: EdgeInsets.symmetric(vertical: 8.h),
                  ).animate().fadeIn(delay: 400.ms, duration: 500.ms),
              ],
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width < 768 ? 20.w : 40.w,
            ),

            // Content section with exact hover specifications
            Expanded(
              child: MouseRegion(
                onEnter: (_) => setState(() => isCardHovered = true),
                onExit: (_) => setState(() => isCardHovered = false),
                cursor: SystemMouseCursors.click,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  // Move UP by 8px when hovered
                  transform: Matrix4.translationValues(
                    0,
                    isCardHovered ? -8 : 0,
                    0,
                  ),
                  padding: EdgeInsets.all(
                    MediaQuery.of(context).size.width < 768 ? 20.w : 32.w,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF), // White stays same
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width < 768 ? 12.r : 16.r,
                    ),
                    boxShadow: [
                      BoxShadow(
                        // Exact shadow specifications
                        color: isCardHovered
                            ? const Color(
                                0x26708FB0,
                              ) // rgba(112, 144, 176, 0.15)
                            : const Color(
                                0x14708FB0,
                              ), // rgba(112, 144, 176, 0.08)
                        offset: Offset(
                          0,
                          isCardHovered ? 12 : 4,
                        ), // Y: 4px -> 12px
                        blurRadius: isCardHovered
                            ? 48
                            : 24, // Blur: 24px -> 48px
                        spreadRadius: 0, // Spread: 0px (no change)
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Date badge (top right)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width < 768
                                  ? 12.w
                                  : 16.w,
                              vertical: MediaQuery.of(context).size.width < 768
                                  ? 4.h
                                  : 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFCC346),
                              borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width < 768
                                    ? 8.r
                                    : 12.r,
                              ),
                            ),
                            child: Text(
                              widget.dateRange,
                              style: Fonts.roboto.copyWith(
                                fontSize:
                                    MediaQuery.of(context).size.width < 768
                                    ? 12.sp
                                    : 14.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF25282B),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.width < 768
                            ? 12.h
                            : 16.h,
                      ),

                      // Company name (main title)
                      Text(
                        widget.title,
                        style: Fonts.playfair.copyWith(
                          fontSize: MediaQuery.of(context).size.width < 768
                              ? 22.sp
                              : 28.sp,
                          fontWeight: FontWeight.w900,
                          color: const Color(0xFF25282B),
                          height: 1.3,
                        ),
                      ),

                      SizedBox(height: 4.h),

                      // Position (subtitle)
                      Text(
                        widget.position,
                        style: Fonts.nunito.copyWith(
                          fontSize: MediaQuery.of(context).size.width < 768
                              ? 16.sp
                              : 18.sp,
                          color: const Color(0xFF828282),
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.width < 768
                            ? 12.h
                            : 16.h,
                      ),

                      // Description
                      Text(
                        widget.description,
                        style: Fonts.nunito.copyWith(
                          fontSize: MediaQuery.of(context).size.width < 768
                              ? 14.sp
                              : 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF828282),
                          height: 1.6,
                        ),
                      ),

                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
