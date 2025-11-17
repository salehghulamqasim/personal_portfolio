// This page renders simple outlined chips for tech skills.
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/components/hover_widget.dart';
import 'package:personal_portfolio/themes/colors.dart';

class LanguageChips extends StatelessWidget {
  final List<String> languages;
  final WrapAlignment alignment;

  const LanguageChips({
    super.key,
    required this.languages,
    this.alignment = WrapAlignment
        .center, //default to center if we dont specify when reusing this component
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    // Use isMobile to adjust chip size dynamically
    return Container(
      constraints: BoxConstraints(maxWidth: 900.w), // Limit max width
      padding: EdgeInsets.all(7.w),
      color: Colors.transparent,
      child: Wrap(
        alignment: alignment,
        runAlignment: alignment,
        spacing: 19.w,
        runSpacing: 14.h,
        children: [
          for (var language in languages)
            HoverWidget(
              hoverScale: 1.0,
              borderRadius: BorderRadius.circular(28.r),
              builder: (isHovered) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                  transform: Matrix4.identity()
                    ..translate(
                      0.0,
                      isHovered ? -4.0 : 0.0,
                    ), // Raise up on hover
                  child: Chip(
                    label: Text(
                      language,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 16.sp : 18.sp,
                      ),
                    ),
                    backgroundColor: AppColors.primaryOrange,
                    side: BorderSide(
                      color: AppColors.primaryOrange,
                      width: 0.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: isMobile ? 12.h : 20.h,
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
