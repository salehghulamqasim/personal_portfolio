// This page renders simple outlined chips for tech skills.
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/components/hover_widget.dart';
import 'package:personal_portfolio/themes/colors.dart';

class TechSkills extends StatelessWidget {
  final List<String> skills;
  final WrapAlignment alignment;

  const TechSkills({
    super.key,
    required this.skills,
    this.alignment = WrapAlignment
        .center, //default to center if we dont specify when reusing this component
  });

  @override
  Widget build(BuildContext context) {
    // Constrain the content so it visually sits inside a box without borders
    return Container(
      constraints: BoxConstraints(
        // Limit the width so chips wrap nicely like inside a box
        maxWidth: 900.w,
      ),
      padding: EdgeInsets.all(12.w),
      color: Colors.transparent, // no border/background, just constraints
      child: Wrap(
        alignment:
            alignment, //by default its center but we can specify where we want it
        // center items in each row
        runAlignment: alignment, // center rows as well
        spacing: 14.w, // horizontal gap
        runSpacing: 14.h, // vertical gap
        children: [for (var skill in skills) _buildChip(skill)],
      ),
    );
  }

  Widget _buildChip(String label) {
    return HoverWidget(
      hoverScale: 1.1,
      borderRadius: BorderRadius.circular(20.r),
      builder: (isHovered) {
        return Chip(
          label: Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          backgroundColor: isHovered ? AppColors.primaryOrange : Colors.white,
          side: BorderSide(color: AppColors.primaryOrange, width: 2.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        );
      },
    );
  }
}
