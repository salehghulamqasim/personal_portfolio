import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/themes/colors.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:personal_portfolio/components/skeleton.dart';

class FooterWave extends StatelessWidget {
  final Color? userColor;
  const FooterWave({super.key, this.userColor});

  @override
  Widget build(BuildContext context) {
    return EasySkeleton(
      child: SizedBox(
        width: double.infinity,
        height: 100.h, // Responsive height
        child: Stack(
          children: [
            // Background to ensure no gaps
            Container(
              width: double.infinity,
              height: double.infinity,
              color: userColor ?? Colors.white,
            ),
            // Wave overlay
            WaveWidget(
              config: CustomConfig(
                colors: [
                  Colors.orange.shade500,
                  AppColors.primaryOrange,
                  Colors.amber.shade400,
                ],
                durations: [18000, 12000, 8000],
                heightPercentages: [0.35, 0.25, 0.15],
              ),
              backgroundColor: Colors.transparent,
              size: Size(double.infinity, 100.h),
              waveAmplitude: 0,
            ),
          ],
        ),
      ),
    );
  }
}
