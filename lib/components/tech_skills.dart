// This page renders simple outlined chips for tech skills.
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/themes/colors.dart';

class TechSkills extends StatelessWidget {
  final List<String> skills;

  const TechSkills({super.key, required this.skills});

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
        alignment: WrapAlignment.center, // center items in each row
        runAlignment: WrapAlignment.center, // center rows as well
        spacing: 14.w, // horizontal gap
        runSpacing: 14.h, // vertical gap
        children: [for (var skill in skills) _buildChip(skill)],
      ),
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      backgroundColor: Colors.white,
      side: const BorderSide(
        color: AppColors.primaryOrange, // Orange outline
        width: 2,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }
}
