//this hsould be widget about social media and a text in bottom

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_portfolio/themes/colors.dart';

class Socials extends StatelessWidget {
  const Socials({super.key});

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
                SvgPicture.asset('assets/icons/instagram.svg'),
                SizedBox(width: 28),
                SvgPicture.asset('assets/icons/linkedin.svg'),
                SizedBox(width: 30),
                SvgPicture.asset('assets/icons/email.svg'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Saleh Ghulam 2025',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
