// Simple timeline that uses ExperienceCards data
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/themes/text_styles.dart';

// Simple timeline that takes raw data (same as ExperienceCards)
class ExperienceTimeline extends StatelessWidget {
  final List<ExperienceCardData> experiences;
  final int? selectedIndex;

  const ExperienceTimeline({
    super.key,
    required this.experiences,
    this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < experiences.length; i++)
          TimelineItem(
            experience: experiences[i],
            isLast: i == experiences.length - 1,
            isSelected: selectedIndex == i,
          ),
      ],
    );
  }
}

// Data structure that matches ExperienceCards
class ExperienceCardData {
  final String title;
  final String position;
  final String dateRange;
  final String description;

  ExperienceCardData({
    required this.title,
    required this.position,
    required this.dateRange,
    required this.description,
  });
}

// Single timeline item
class TimelineItem extends StatelessWidget {
  final ExperienceCardData experience;
  final bool isLast;
  final bool isSelected;

  const TimelineItem({
    super.key,
    required this.experience,
    required this.isLast,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 900.w),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width < 768 ? 20.w : 0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline dot + line
          Column(
            children: [
              // Yellow dot
              Container(
                width: isSelected ? 24.w : 20.w,
                height: isSelected ? 24.h : 20.h,
                decoration: const BoxDecoration(
                  color: Color(0xFFFDC435),
                  shape: BoxShape.circle,
                ),
              ),

              // Line below dot
              if (!isLast)
                Container(
                  width: 2.w,
                  height: MediaQuery.of(context).size.height * 0.08,
                  color: const Color(0xFFFDC435).withValues(alpha: 0.5),
                  margin: EdgeInsets.symmetric(vertical: 8.h),
                ),
            ],
          ),

          SizedBox(
            width: MediaQuery.of(context).size.width < 768 ? 20.w : 40.w,
          ),

          // Experience card content (same styling as ExperienceCards)
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 24.h),
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.width < 768 ? 20.w : 32.w,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width < 768 ? 12.r : 16.r,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x14708FB0),
                    offset: const Offset(0, 4),
                    blurRadius: 24,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date badge (same as ExperienceCards)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
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
                          color: const Color(0xFFFCC346),
                          borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width < 768
                                ? 8.r
                                : 12.r,
                          ),
                        ),
                        child: Text(
                          experience.dateRange,
                          style: Fonts.roboto.copyWith(
                            fontSize: MediaQuery.of(context).size.width < 768
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

                  // Company name (same as ExperienceCards)
                  Text(
                    experience.title,
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

                  // Position (same as ExperienceCards)
                  Text(
                    experience.position,
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

                  // Description (same as ExperienceCards)
                  Text(
                    experience.description,
                    style: Fonts.nunito.copyWith(
                      fontSize: MediaQuery.of(context).size.width < 768
                          ? 14.sp
                          : 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF828282),
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
