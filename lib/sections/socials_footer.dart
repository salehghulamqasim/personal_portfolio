//this hsould be widget about social media and a text in bottom

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/themes/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Socials extends StatelessWidget {
  const Socials({super.key});

  //Urls for social media icons
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // keeps content centered vertically
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisSize:
                    MainAxisSize.min, // makes row as wide as its content
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //how to add on tap in svg
                  GestureDetector(
                    onTap: () => _launchUrl(
                      'https://www.instagram.com/salehclicks?igsh=dGVqY3h1bG1jbmZj',
                    ),
                    child: SvgPicture.asset('assets/icons/instagram.svg'),
                  ),
                  SizedBox(width: 28.w),
                  GestureDetector(
                    onTap: () =>
                        _launchUrl('https://www.linkedin.com/in/salehghulam/'),
                    child: SvgPicture.asset('assets/icons/linkedin.svg'),
                  ),
                  SizedBox(width: 30.w),
                  GestureDetector(
                    onTap: () => _launchUrl(
                      'https://mail.google.com/mail/?view=cm&fs=1&to=SalehTheCoder@gmail.com&su=Contact%20from%20Portfolio',
                    ),
                    child: SvgPicture.asset('assets/icons/email.svg'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Saleh Ghulam 2025',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
  }
}
