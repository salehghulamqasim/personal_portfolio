// for connecting lines with animation logic
// Create: lib/components/experience_timeline.dart
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: unused_import
import 'package:personal_portfolio/themes/text_styles.dart';

class ExperienceTimeline extends StatelessWidget {
  final List<ExperienceData> experiences;
  final int? selectedIndex;

  const ExperienceTimeline({
    super.key,
    required this.experiences,
    this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 900.w),
      child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0.0, // Put dots on the left
          connectorTheme: ConnectorThemeData(
            thickness: 2.0,
            color: Color(0xFFFDC435).withOpacity(0.3), // Connecting line
          ),
        ),
        builder: TimelineTileBuilder.connected(
          itemCount: experiences.length,

          // The timeline dots
          indicatorBuilder: (context, index) => DotIndicator(
            color: selectedIndex == index
                ? Color(0xFFFDC435)
                : Color(0xFFFDC435).withOpacity(0.7),
            size: selectedIndex == index ? 24.0 : 20.0,
          ),

          // The connecting lines
          connectorBuilder: (context, index, type) {
            if (index < experiences.length - 1) {
              return SolidLineConnector(
                color: Color(0xFFFDC435).withOpacity(0.3),
              );
            }
            return null; // No line after last item
          },

          // Your experience card content
          contentsBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width < 768 ? 20.w : 40.w,
              bottom: 20.h,
            ),
            child: ExperienceCardContent(experience: experiences[index]),
          ),
        ),
      ),
    );
  }
}

// Data model
class ExperienceData {
  final String title;
  final String position;
  final String dateRange;
  final String description;

  ExperienceData({
    required this.title,
    required this.position,
    required this.dateRange,
    required this.description,
  });
}

// Just the card content (without the dot)
class ExperienceCardContent extends StatelessWidget {
  final ExperienceData experience;

  const ExperienceCardContent({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        MediaQuery.of(context).size.width < 768 ? 20.w : 32.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          MediaQuery.of(context).size.width < 768 ? 12.r : 16.r,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x14708FB0),
            offset: Offset(0, 4),
            blurRadius: 24,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Your existing card content here...
          // (date badge, title, position, description)
        ],
      ),
    );
  }
}
