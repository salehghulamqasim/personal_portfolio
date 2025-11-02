import 'package:flutter/material.dart';
import 'package:personal_portfolio/themes/colors.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class FooterWave extends StatelessWidget {
  //colorfrom user
  final Color? userColor;
  const FooterWave({super.key, this.userColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: WaveWidget(
        config: CustomConfig(
          colors: [
            Colors.orange.shade500, // Medium orange
            AppColors.primaryOrange, // Your primary orange - front
            Colors.amber.shade400, // Lighter amber accent
          ],

          durations: [
            18000, // Medium speed
            12000, // Faster
            8000, // Fastest - front accent
          ], // Different speeds for each layer
          heightPercentages: [
            0.35, // Medium height
            0.25, // Lower
            0.15, // Shortest - just accent peaks
          ], // Different heights for depth
        ),
        //if user defeined color then color else white
        backgroundColor: userColor ?? Colors.white,
        size: Size(double.infinity, 200), //  height of wave
        waveAmplitude: 0, //wave
      ),
    );
  }
}
