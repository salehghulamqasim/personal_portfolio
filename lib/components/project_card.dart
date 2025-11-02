import 'package:flutter/material.dart';
import 'package:personal_portfolio/themes/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectCard extends StatelessWidget {
  //our variables
  final String title;
  final String description;
  final String imagePath;
  final bool imageOnRight; //so we can tell if image is on right or left

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    this.imageOnRight = true, //by default image on right
  });

  @override
  Widget build(BuildContext context) {
    Widget textSide = Expanded(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                fontFamily: Fonts.playfair.fontFamily,
              ),
            ),
            SizedBox(height: 16.h),

            Text(
              description,
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: Fonts.nunito.fontFamily,
              ),
            ),
            SizedBox(height: 16.h),
            OutlinedButton(
              onPressed: () {},
              child: Text(
                'View Project',
                style: TextStyle(fontFamily: Fonts.roboto.fontFamily),
              ),
            ),
          ],
        ),
      ),
    );
    //image side
    Widget imageSide = Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(imagePath, fit: BoxFit.cover, height: 350.h),
      ),
    );

    return SizedBox(
      width: 1100.w,

      child: Container(
        margin: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          //if imageonRight is true then textside thens how imageside. else vice versa
          children: imageOnRight
              ? [textSide, imageSide] // Normal order
              : [imageSide, textSide],
        ),
      ),
    );
  }
}
