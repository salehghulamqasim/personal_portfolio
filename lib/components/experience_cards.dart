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
import 'package:personal_portfolio/themes/text_styles.dart';

class ExperienceCards extends StatelessWidget {
  final String title; // Company name
  final String position; // Job title
  final String dateRange; // Date range
  final String description; // Job description
  final bool isSelected; // For timeline dot animation
  final VoidCallback? onTap; // Tap callback

  const ExperienceCards({
    super.key,
    required this.title,
    required this.position,
    required this.dateRange,
    required this.description,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(maxWidth: 900.w),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width < 768 ? 20.w : 0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline dot (left side) - Following design specs
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 20.w,
              height: 20.h,
              transform: isSelected
                  ? (Matrix4.identity()..scale(1.3))
                  : Matrix4.identity(),
              decoration: const BoxDecoration(
                color: Color(0xFFFDC435),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width < 768 ? 20.w : 40.w,
            ),
            //TODO we might remove the above animated and gesture and add TimeLine package instead for ease and better time line look

            // Content section with white card background - Following design specs
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.all(
                  MediaQuery.of(context).size.width < 768 ? 20.w : 32.w,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF), // White from specs
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width < 768 ? 12.r : 16.r,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(
                        0x14708FB0,
                      ), // rgba(112,144,176,0.08) from specs
                      offset: const Offset(0, 4),
                      blurRadius: 24,
                      spreadRadius: 0,
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
                        const Spacer(), // this pushes date to right
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width < 768
                                ? 12.w
                                : 16.w,
                            vertical: MediaQuery.of(context).size.width < 768
                                ? 4.h
                                : 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(
                              0xFFFCC346,
                            ), // Changed to primaryOrange
                            borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width < 768
                                  ? 8.r
                                  : 12.r,
                            ),
                          ),
                          child: Text(
                            dateRange,
                            style: Fonts.roboto.copyWith(
                              fontSize: MediaQuery.of(context).size.width < 768
                                  ? 12.sp
                                  : 14.sp,
                              fontWeight: FontWeight.w500, // Medium from specs
                              color: const Color(
                                0xFF25282B,
                              ), // Dark Text from specs
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

                    // Company name (main title) - Playfair Display Bold from specs
                    Text(
                      title,
                      style: Fonts.playfair.copyWith(
                        fontSize: MediaQuery.of(context).size.width < 768
                            ? 22.sp
                            : 28.sp,
                        fontWeight: FontWeight.w900,
                        color: const Color(0xFF25282B), // Dark Text from specs
                        height: 1.3, // Line height from specs
                      ),
                    ),

                    SizedBox(height: 4.h), // Gap from specs
                    // Position (subtitle) - Nunito Regular from specs
                    Text(
                      position,
                      style: Fonts.nunito.copyWith(
                        fontSize: MediaQuery.of(context).size.width < 768
                            ? 16.sp
                            : 18.sp,
                        color: const Color(0xFF828282), // Gray Text from specs
                        fontWeight: FontWeight.w400, // Regular from specs
                        height: 1.5, // Line height from specs
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.width < 768
                          ? 12.h
                          : 16.h,
                    ),

                    // Description - Nunito Regular from specs
                    Text(
                      description,
                      style: Fonts.nunito.copyWith(
                        fontSize: MediaQuery.of(context).size.width < 768
                            ? 14.sp
                            : 16.sp,
                        fontWeight: FontWeight.w400, // Regular from specs
                        color: const Color(0xFF828282), // Gray Text from specs
                        height: 1.6, // Line height from specs
                      ),
                    ),

                    SizedBox(height: 40.h), // Space before next card
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
