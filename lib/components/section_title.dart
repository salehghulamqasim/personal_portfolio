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
import 'package:personal_portfolio/themes/text_styles.dart';

class SectionTitle extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            text,
            style: Fonts.playfair.copyWith(
              fontSize: (size ?? 28).sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),

          Container(
            height: 4.h,
            //if user specifies width okay if not the use default 100
            //we wrap it inside parathesis so we can apply .w to it for screen util
            width: (lineWidth ?? 100).w,
            color: Color(0xFFFCC346),
          ),
        ],
      ),
    );
  }
}
