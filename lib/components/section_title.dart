/*

i want to turn this int or eusable widget 
 Center(
                      child: Text(
                        'Projects!',
                        style: Fonts.playfair.copyWith(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
but should have a eylow line in bottom of the text
*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/themes/colors.dart';
import 'package:personal_portfolio/themes/text_styles.dart';

class SectionTitle extends StatefulWidget {
  final String text; // we will type it in when we use the widget
  final double? lineWidth; // optional line width
  final double? size; // optional font size

  const SectionTitle({
    super.key,
    required this.text,
    this.lineWidth,
    this.size,
  });

  @override
  State<SectionTitle> createState() => _SectionTitleState();
}

class _SectionTitleState extends State<SectionTitle> {
  //Variable to track animation state
  bool _isExpanded = false;

  //start animation when widget loads
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 800), () {
      if (mounted) {
        setState(() {
          _isExpanded = true;
        });
      }
    });
  }
  //basically above function says after 300 milliseconds of loading the widget
  //set the state to expanded true so the line will expand

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            widget.text,
            style: Fonts.playfair.copyWith(
              fontSize: 36.sp, // Unified font size
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),

          AnimatedContainer(
            duration: Duration(milliseconds: 800),
            curve: Curves.easeOutCubic,
            height: 4.h,
            width: _isExpanded ? (widget.lineWidth ?? 100).w : 0,
            color: AppColors.primaryOrange,
          ),
        ],
      ),
    );
  }
}
