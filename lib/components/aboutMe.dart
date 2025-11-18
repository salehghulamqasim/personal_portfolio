//  lib / pages / aboutMe.dart
//  Leaf-level widgets used by aboutMe_section.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:personal_portfolio/components/section_title.dart';

/*  --------------------------------------------------
    STORY  BOX  (tap opens modal)
    -------------------------------------------------- */
class StoryBox extends StatefulWidget {
  const StoryBox({super.key});
  @override
  State<StoryBox> createState() => _StoryBoxState();
}

class _StoryBoxState extends State<StoryBox> {
  bool _isHovered = false;

  void _showDetails(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600.w),
          child: SingleChildScrollView(
            child:
                Container(
                      padding: EdgeInsets.all(32.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 40,
                            offset: const Offset(0, 20),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(Icons.close, size: 24.sp),
                              onPressed: () => Navigator.pop(context),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'My Journey',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF25282B),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'I believe great software comes from understanding people. That\'s why I focus on building apps that solve real problems with intuitive experiences. My journey started in university hackathons where I learned to turn ideas into working prototypes in hours, not weeks.',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: const Color(0xFF525252),
                              height: 1.6,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            'Philosophy',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF25282B),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Code is craft. Every app is an opportunity to create something meaningful. I combine technical excellence with human-centered design to build products people love.',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xFF525252),
                              height: 1.6,
                            ),
                          ),
                        ],
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 300.ms, curve: Curves.easeOut)
                    .scale(
                      begin: const Offset(0.9, 0.9),
                      curve: Curves.easeOutCubic,
                    ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => _showDetails(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          transform: Matrix4.identity()
            ..translate(0.0, _isHovered ? -8.0 : 0.0),
          padding: EdgeInsets.all(isMobile ? 20.w : 32.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_isHovered ? 0.12 : 0.06),
                blurRadius: _isHovered ? 30 : 20,
                offset: Offset(0, _isHovered ? 12 : 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'My Story',
                style: TextStyle(
                  fontSize: isMobile ? 22.sp : 28.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF25282B),
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                'Flutter developer who loves building apps people actually want to use. From university hackathons to production apps, I turn ideas into reality.',
                style: TextStyle(
                  fontSize: isMobile ? 13.sp : 15.sp,
                  color: const Color(0xFF525252),
                  height: 1.6,
                ),
              ),
              const Spacer(),
              Center(
                child: Text(
                  'Tap to learn more',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: const Color(0xFF828282).withOpacity(0.75),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*  --------------------------------------------------
    PASSION  BOX  (simple – no modal)
    -------------------------------------------------- */
class PassionBox extends StatefulWidget {
  final IconData? icon;
  final String title;
  final Color? color;
  const PassionBox({super.key, this.icon, required this.title, this.color});

  @override
  State<PassionBox> createState() => _PassionBoxState();
}

class _PassionBoxState extends State<PassionBox> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            transform: Matrix4.identity()
              ..translate(0.0, _isHovered ? -8.0 : 0.0)
              ..scale(_isHovered ? 1.05 : 1.0),
            decoration: BoxDecoration(
              color: widget.color?.withValues(alpha: _isHovered ? 0.15 : 0.1),
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null) ...[
                  Icon(
                    widget.icon,
                    size: isMobile ? 36.sp : 48.sp,
                    color: widget.color,
                  ),
                  SizedBox(height: 12.h),
                ],
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: isMobile ? 15.sp : 18.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF25282B),
                  ),
                ),
              ],
            ),
          ),
        )
        .animate()
        .fadeIn(duration: 300.ms, delay: 100.ms * widget.title.length)
        .scale(begin: const Offset(0.8, 0.8), curve: Curves.easeOutCubic);
  }
}

/*  --------------------------------------------------
    TITLE BOX WHITE (white background with SectionTitle)
    -------------------------------------------------- */
class TitleBoxWhite extends StatelessWidget {
  final String title;
  final int size;
  const TitleBoxWhite({super.key, required this.title, this.size = 28});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(isMobile ? 20.w : 32.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: SectionTitle(text: title, size: size),
        )
        .animate()
        .fadeIn(duration: 300.ms, delay: 100.ms * title.length)
        .scale(begin: const Offset(0.8, 0.8), curve: Curves.easeOutCubic);
  }
}

/*  --------------------------------------------------
    TITLE BOX COLORED (transparent/colored background with SectionTitle)
    -------------------------------------------------- */
class TitleBoxColored extends StatelessWidget {
  final String title;
  final Color? color;
  final int size;
  const TitleBoxColored({
    super.key,
    required this.title,
    this.color,
    this.size = 28,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(isMobile ? 20.w : 32.w),
          decoration: BoxDecoration(
            color: color?.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: SectionTitle(text: title, size: size),
        )
        .animate()
        .fadeIn(duration: 300.ms, delay: 100.ms * title.length)
        .scale(begin: const Offset(0.8, 0.8), curve: Curves.easeOutCubic);
  }
}

/*  --------------------------------------------------
    HACKATHON  BOX  (tap opens modal)
    -------------------------------------------------- */
class HackathonBox extends StatefulWidget {
  final String number;
  const HackathonBox({super.key, required this.number});

  @override
  State<HackathonBox> createState() => _HackathonBoxState();
}

class _HackathonBoxState extends State<HackathonBox> {
  bool _isHovered = false;

  final Map<String, Map<String, dynamic>> _hackathons = {
    '1': {
      'name': 'Computer Club Member',
      'project': 'University',
      //'award': 'Certificate of Appreciation',
      'description':
          'I was a proud member of my university\'s Computer Club. During my time there, I actively participated in organizing and attending club events. I helped plan and execute events, attended regular meetings, and played a key role in recruiting students who were interested in joining the club. The Computer Club was a hub for creativity and innovation, and I was honored to receive a Certificate of Appreciation for my contributions, especially in idea generation. It was an incredible experience that allowed me to collaborate with talented peers and make a meaningful impact.',
      'team': '30 members',
      'duration': '1 year',
      'imagePath': 'assets/Certificates/computer_club.webp',
    },
    '2': {
      'name': 'International Conference on Logistics',
      'project': 'Jeddah Universtiy',
      //'award': 'Certificate of Participation',
      'description':
          'At the International Conference on Logistics, my team of three presented SkyPort, a project aimed at revolutionizing port operations using drones, AI, and data analytics. We collaborated with our university tutors to refine our concept, design a poster, and pitch our vision to industry professionals. SkyPort focuses on enhancing safety, efficiency, and sustainability in port logistics through real-time tracking, predictive analytics, and aerial surveillance.',
      'team': '3 members',
      'duration': '2 months',
      'imagePath': 'assets/Certificates/Skyport.jpeg',
    },
    '3': {
      'name': 'Tech Meetup 3',
      'project': 'Majid BootCamp, Google Developer Club',
      //'award': '⭐ Top 10 Finalist',
      'description':
          'We pitched the idea of Jidni, a mobile app designed for bookstore visitors to easily find books on shelves using their phone camera and AR technology. The app is simple, clean, and accessible for all age groups, supporting multiple languages. It’s worth noting this was a prototype concept we presented, not an actual coded project—just a vision for a seamless, tech-driven bookstore experience.',
      'team': '4 Members',
      'duration': '3 Days',
      // 'imagePath': '[]',
    },
    '4': {
      'name': 'Smart City Hackathon',
      'project': 'Jeddah Hackathon',
      // 'award': '🏆 Best Urban Solution',
      'description':
          'We pitched our app Plasticless Planet, a volunteer-driven platform where people can report garbage and plastic waste in their neighborhoods or discover areas with high plastic pollution to clean up and earn points. The app fosters a community effort and also enables reporting to government sectors to address trash and plastic issues. We collected a significant dataset of plastic bottles and trained a YOLOv8 pretrained model, achieving an accuracy between 80% and 86%.',
      'tech': ['Yolov8', 'LabelBox', 'kaggle', 'Figma'],
      'team': '4 members',
      'duration': '36 hours',
      'imagePath': '[]',
    },
  };

  // Helper methods to get color and icon based on hackathon number
  Color _getHackathonColor() {
    switch (widget.number) {
      case '1':
        return const Color(0xFF4ECDC4); // GDSC-like teal
      case '2':
        return const Color(0xFF4285F4); // Tech blue
      case '3':
        return const Color(0xFF9C27B0); // Tech purple
      case '4':
        return const Color(0xFF00BCD4); // Tech cyan
      default:
        return const Color(0xFFFCC346);
    }
  }

  IconData _getHackathonIcon() {
    switch (widget.number) {
      case '1':
        return Icons.group; // Similar to GDSC
      case '2':
        return Icons.code; // Tech/competition icon
      case '3':
        return Icons.computer; // Tech/competition icon
      case '4':
        return Icons.terminal; // Tech/competition icon
      default:
        return Icons.emoji_events;
    }
  }

  void _showDetails(BuildContext context) {
    final data = _hackathons[widget.number]!;
    final hackathonColor = _getHackathonColor();
    final hackathonIcon = _getHackathonIcon();
    final techList = (data['tech'] as List<dynamic>?) ?? const [];
    final team = (data['team'] as String?) ?? 'N/A';
    final duration = (data['duration'] as String?) ?? 'N/A';
    debugPrint('Opening hackathon details: ${data['name']}');
    if (techList.isEmpty) {
      debugPrint('No tech stack provided for ${data['name']}');
    }

    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600.w),
          child: SingleChildScrollView(
            child:
                Container(
                      padding: EdgeInsets.all(32.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 40,
                            offset: const Offset(0, 20),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(Icons.close, size: 24.sp),
                              onPressed: () => Navigator.pop(context),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ),
                          Container(
                            width: 64.w,
                            height: 64.w,
                            decoration: BoxDecoration(
                              color: hackathonColor.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Icon(
                              hackathonIcon,
                              color: hackathonColor,
                              size: 32.sp,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            data['name']!,
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF25282B),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            data['project']!,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: hackathonColor,
                            ),
                          ),
                          // SizedBox(height: 12.h),
                          // Container(
                          //   padding: EdgeInsets.symmetric(
                          //     horizontal: 16.w,
                          //     vertical: 8.h,
                          //   ),
                          //   decoration: BoxDecoration(
                          //     color: hackathonColor.withOpacity(0.15),
                          //     borderRadius: BorderRadius.circular(12.r),
                          //   ),
                          //   child: Text(
                          //     data['award']!,
                          //     style: TextStyle(
                          //       fontSize: 14.sp,
                          //       fontWeight: FontWeight.w600,
                          //       color: hackathonColor,
                          //     ),
                          //   ),
                          // ),
                          SizedBox(height: 24.h),
                          const Text(
                            'About the Project',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            data['description']!,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xFF525252),
                              height: 1.6,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          if (techList.isNotEmpty) ...[
                            const Text(
                              'Tech Stack',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Wrap(
                              spacing: 8.w,
                              runSpacing: 8.h,
                              children: techList
                                  .map(
                                    (e) => Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 6.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF5F5F5),
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                        border: Border.all(
                                          color: hackathonColor.withOpacity(
                                            0.3,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        e.toString(),
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF525252),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                          SizedBox(height: 24.h),
                          Row(
                            children: [
                              Expanded(
                                child: _StatItem(
                                  icon: Icons.people,
                                  label: 'Team',
                                  value: team,
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: _StatItem(
                                  icon: Icons.access_time,
                                  label: 'Duration',
                                  value: duration,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h),
                          Builder(
                            builder: (context) {
                              final isMobile =
                                  MediaQuery.of(context).size.width < 768;
                              return _ZoomableAssetImage(
                                path: data['imagePath'] as String?,
                                height: isMobile ? 260.h : 380.h,
                                borderRadius: BorderRadius.circular(20.r),
                                borderColor: hackathonColor.withOpacity(0.2),
                                placeholderIconColor: hackathonColor,
                                label: 'Project image',
                              );
                            },
                          ),
                        ],
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 300.ms, curve: Curves.easeOut)
                    .scale(
                      begin: const Offset(0.9, 0.9),
                      curve: Curves.easeOutCubic,
                    ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final cardData = _hackathons[widget.number]!;
    final hackathonColor = _getHackathonColor();
    final hackathonIcon = _getHackathonIcon();

    return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: GestureDetector(
            onTap: () => _showDetails(context),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              transform: Matrix4.identity()
                ..translate(0.0, _isHovered ? -8.0 : 0.0),
              padding: EdgeInsets.all(isMobile ? 16.w : 24.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: hackathonColor.withOpacity(_isHovered ? 0.15 : 0.08),
                    blurRadius: _isHovered ? 24 : 16,
                    offset: Offset(0, _isHovered ? 12 : 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: isMobile ? 44.w : 56.w,
                    height: isMobile ? 44.w : 56.w,
                    decoration: BoxDecoration(
                      color: hackathonColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Icon(
                      hackathonIcon,
                      color: hackathonColor,
                      size: isMobile ? 22.sp : 28.sp,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    cardData['name']!,
                    style: TextStyle(
                      fontSize: isMobile ? 15.sp : 18.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF25282B),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    cardData['project']!,
                    style: TextStyle(
                      fontSize: isMobile ? 12.sp : 14.sp,
                      color: const Color(0xFF828282),
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // const Spacer(),
                  // Container(
                  //   padding: EdgeInsets.symmetric(
                  //     horizontal: 12.w,
                  //     vertical: 6.h,
                  //   ),
                  //   decoration: BoxDecoration(
                  //     color: hackathonColor.withOpacity(0.15),
                  //     borderRadius: BorderRadius.circular(12.r),
                  //   ),
                  //   child: Text(
                  //     cardData['award']!,
                  //     style: TextStyle(
                  //       fontSize: isMobile ? 11.sp : 12.sp,
                  //       fontWeight: FontWeight.w600,
                  //       color: hackathonColor,
                  //     ),
                  //     maxLines: 1,
                  //     overflow: TextOverflow.ellipsis,
                  //   ),
                  // ),
                  const Spacer(),
                  Center(
                    child: Text(
                      'Tap for details',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: const Color(0xFF828282).withOpacity(0.75),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .animate()
        .fadeIn(duration: 300.ms, delay: 100.ms * int.parse(widget.number))
        .scale(begin: const Offset(0.8, 0.8), curve: Curves.easeOutCubic);
  }
}

/*  --------------------------------------------------
    GDSC  BOX  (tap opens modal)
    -------------------------------------------------- */
class GDSCBox extends StatefulWidget {
  const GDSCBox({Key? key}) : super(key: key);
  @override
  State<GDSCBox> createState() => _GDSCBoxState();
}

class _GDSCBoxState extends State<GDSCBox> {
  bool _isHovered = false;

  void _showDetails(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600.w),
          child: SingleChildScrollView(
            child:
                Container(
                      padding: EdgeInsets.all(32.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 40,
                            offset: const Offset(0, 20),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(Icons.close, size: 24.sp),
                              onPressed: () => Navigator.pop(context),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ),
                          Container(
                            width: 64.w,
                            height: 64.w,
                            decoration: BoxDecoration(
                              color: const Color(0xFF4ECDC4).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Icon(
                              Icons.group,
                              color: const Color(0xFF4ECDC4),
                              size: 32.sp,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            'GDSC Core Team Member',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF25282B),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Google Developer Student Clubs',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF4ECDC4),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF4ECDC4).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Text(
                              '🏆 Core Team Leadership',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF4ECDC4),
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          const Text(
                            'About the Role',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'As a GDSC member, I assisted in organizing workshops and webinars, represented the community at events like ‘Digitize the Future,’ participated in hackathons, attended meetings, and contributed to various initiatives supporting developer learning and collaboration.',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xFF525252),
                              height: 1.6,
                            ),
                          ),
                          SizedBox(height: 24.h),

                          SizedBox(height: 16.h),
                          Row(
                            children: [
                              Expanded(
                                child: _StatItem(
                                  icon: Icons.access_time,
                                  label: 'Duration',
                                  value: '1 year',
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: _StatItem(
                                  icon: Icons.group,
                                  label: 'Team Size',
                                  value: '10+ members',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h),
                          Builder(
                            builder: (context) {
                              final isMobile =
                                  MediaQuery.of(context).size.width < 768;
                              return _ZoomableAssetImage(
                                path: 'assets/Certificates/raqman.webp',
                                height: isMobile ? 260.h : 380.h,
                                borderRadius: BorderRadius.circular(20.r),
                                borderColor: const Color(
                                  0xFF4ECDC4,
                                ).withOpacity(0.2),
                                placeholderIconColor: const Color(0xFF4ECDC4),
                                label: 'Certificate',
                              );
                            },
                          ),
                        ],
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 300.ms, curve: Curves.easeOut)
                    .scale(
                      begin: const Offset(0.9, 0.9),
                      curve: Curves.easeOutCubic,
                    ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: GestureDetector(
            onTap: () => _showDetails(context),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              transform: Matrix4.identity()
                ..translate(0.0, _isHovered ? -8.0 : 0.0),
              padding: EdgeInsets.all(isMobile ? 20.w : 32.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: const Color(
                      0xFF4ECDC4,
                    ).withOpacity(_isHovered ? 0.15 : 0.08),
                    blurRadius: _isHovered ? 24 : 16,
                    offset: Offset(0, _isHovered ? 12 : 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: isMobile ? 44.w : 56.w,
                    height: isMobile ? 44.w : 56.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4ECDC4).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Icon(
                      Icons.group,
                      size: isMobile ? 22.sp : 28.sp,
                      color: const Color(0xFF4ECDC4),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'GDSC Core Team',
                    style: TextStyle(
                      fontSize: isMobile ? 18.sp : 22.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF25282B),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Led technical workshops and mentored 30+ students in mobile development.',
                    style: TextStyle(
                      fontSize: isMobile ? 13.sp : 15.sp,
                      color: const Color(0xFF525252),
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  // Preserving yellow chips containing student/collaboration-related text as per requirements
                  // Any removal/hide logic for these chips is intentionally commented out to keep them visible.
                  // Wrap(
                  //   spacing: 8.w,
                  //   runSpacing: 8.h,
                  //   children: const [_Tag('30+ Students'), _Tag('5 Events')],
                  // ),
                  const Spacer(),
                  Center(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        ColorizeAnimatedText(
                          'Tap for details',
                          textStyle: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          colors: [
                            const Color(0xFF828282).withOpacity(0.6),
                            const Color(0xFFB0B0B0).withOpacity(0.8),
                            const Color(0xFF828282).withOpacity(0.6),
                          ],
                        ),
                      ],
                      repeatForever: true,
                      pause: const Duration(milliseconds: 500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .animate()
        .fadeIn(duration: 500.ms, delay: 300.ms)
        .scale(begin: const Offset(0.8, 0.8), curve: Curves.easeOutCubic);
  }
}

class RaqmanBox extends StatefulWidget {
  const RaqmanBox({Key? key}) : super(key: key);
  @override
  State<RaqmanBox> createState() => _RaqmanBoxState();
}

class _RaqmanBoxState extends State<RaqmanBox> {
  bool _isHovered = false;

  void _showDetails(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600.w),
          child: SingleChildScrollView(
            child:
                Container(
                      padding: EdgeInsets.all(32.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 40,
                            offset: const Offset(0, 20),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(Icons.close, size: 24.sp),
                              onPressed: () => Navigator.pop(context),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ),
                          Container(
                            width: 64.w,
                            height: 64.w,
                            decoration: BoxDecoration(
                              color: const Color(0xFF4ECDC4).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Icon(
                              Icons.group,
                              color: const Color(0xFF4ECDC4),
                              size: 32.sp,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            'Raqman Community Event',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF25282B),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Google Developer Student Clubs',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF4ECDC4),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF4ECDC4).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Text(
                              'Community Gathering & Collaboration',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF4ECDC4),
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          const Text(
                            'About the Event',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Engaging the next generation of innovators, Planned by GDSC community of our university, We visited a school to illuminate pathways in technology, including computer science, network security, and cybersecurity. Students received curated resources, hands-on insights, and guidance on future academic pursuits, all captured through professional documentation.',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xFF525252),
                              height: 1.6,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Row(
                            children: [
                              Expanded(
                                child: _StatItem(
                                  icon: Icons.event,
                                  label: 'Sessions',
                                  value: '1',
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: _StatItem(
                                  icon: Icons.people,
                                  label: 'Attendees',
                                  value: '50',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h),
                          Builder(
                            builder: (context) {
                              final isMobile =
                                  MediaQuery.of(context).size.width < 768;
                              return _ZoomableAssetImage(
                                path: 'assets/Certificates/raqman.webp',
                                height: isMobile ? 260.h : 380.h,
                                borderRadius: BorderRadius.circular(20.r),
                                borderColor: const Color(
                                  0xFF4ECDC4,
                                ).withOpacity(0.2),
                                placeholderIconColor: const Color(0xFF4ECDC4),
                                label: 'Raqman event photo',
                              );
                            },
                          ),
                        ],
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 300.ms, curve: Curves.easeOut)
                    .scale(
                      begin: const Offset(0.9, 0.9),
                      curve: Curves.easeOutCubic,
                    ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: GestureDetector(
            onTap: () => _showDetails(context),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              transform: Matrix4.identity()
                ..translate(0.0, _isHovered ? -8.0 : 0.0),
              padding: EdgeInsets.all(isMobile ? 20.w : 32.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: const Color(
                      0xFF4ECDC4,
                    ).withOpacity(_isHovered ? 0.15 : 0.08),
                    blurRadius: _isHovered ? 24 : 16,
                    offset: Offset(0, _isHovered ? 12 : 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: isMobile ? 44.w : 56.w,
                    height: isMobile ? 44.w : 56.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4ECDC4).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Icon(
                      Icons.group,
                      size: isMobile ? 22.sp : 28.sp,
                      color: const Color(0xFF4ECDC4),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Digitize The future',
                    style: TextStyle(
                      fontSize: isMobile ? 18.sp : 22.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF25282B),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Faculty & future career guidance.',
                    style: TextStyle(
                      fontSize: isMobile ? 13.sp : 15.sp,
                      color: const Color(0xFF525252),
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  // Preserving yellow chips containing student/collaboration-related text as per requirements
                  // Removal/hide logic disabled for these chips to keep them visible.
                  // Wrap(
                  //   spacing: 8.w,
                  //   runSpacing: 8.h,
                  //   children: const [_Tag('Collab'), _Tag('Talks')],
                  // ),
                  const Spacer(),
                  Center(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        ColorizeAnimatedText(
                          'Tap for details',
                          textStyle: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          colors: [
                            const Color(0xFF828282).withOpacity(0.6),
                            const Color(0xFFB0B0B0).withOpacity(0.8),
                            const Color(0xFF828282).withOpacity(0.6),
                          ],
                        ),
                      ],
                      repeatForever: true,
                      pause: const Duration(milliseconds: 500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .animate()
        .fadeIn(duration: 500.ms, delay: 300.ms)
        .scale(begin: const Offset(0.8, 0.8), curve: Curves.easeOutCubic);
  }
}

class IftarBox extends StatefulWidget {
  const IftarBox({Key? key}) : super(key: key);
  @override
  State<IftarBox> createState() => _IftarBoxState();
}

class _IftarBoxState extends State<IftarBox> {
  bool _isHovered = false;

  void _showDetails(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600.w),
          child: SingleChildScrollView(
            child:
                Container(
                      padding: EdgeInsets.all(32.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 40,
                            offset: const Offset(0, 20),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(Icons.close, size: 24.sp),
                              onPressed: () => Navigator.pop(context),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ),
                          Container(
                            width: 64.w,
                            height: 64.w,
                            decoration: BoxDecoration(
                              color: const Color(0xFF4ECDC4).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Icon(
                              Icons.group,
                              color: const Color(0xFF4ECDC4),
                              size: 32.sp,
                            ),
                          ),
                          SizedBox(height: 20.h),

                          //GDSC IFTAR BOX
                          Text(
                            'Ramadan Iftar distribution',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF25282B),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Arab Open University - Jeddah',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF4ECDC4),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF4ECDC4).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Text(
                              'Community & Collaboration',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF4ECDC4),
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          const Text(
                            'About the Event',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'We organized a meaningful Iftar initiative, procuring, packaging, and distributing food to those fasting in Ramadan. The event fostered connection, compassion, and shared moments in holy month of Ramadan',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xFF525252),
                              height: 1.6,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Row(
                            children: [
                              Expanded(
                                child: _StatItem(
                                  icon: Icons.event,
                                  label: 'Activities',
                                  value: ', Food Packaging & Distribution',
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: _StatItem(
                                  icon: Icons.people,
                                  label: 'Days Distributed',
                                  value: '7 days',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h),
                          Builder(
                            builder: (context) {
                              final isMobile =
                                  MediaQuery.of(context).size.width < 768;
                              return _ZoomableAssetImage(
                                path: null,
                                height: isMobile ? 260.h : 380.h,
                                borderRadius: BorderRadius.circular(20.r),
                                borderColor: const Color(
                                  0xFF4ECDC4,
                                ).withOpacity(0.2),
                                placeholderIconColor: const Color(0xFF4ECDC4),
                                label:
                                    'Certificate of participation in Iftar event',
                              );
                            },
                          ),
                        ],
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 300.ms, curve: Curves.easeOut)
                    .scale(
                      begin: const Offset(0.9, 0.9),
                      curve: Curves.easeOutCubic,
                    ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: GestureDetector(
            onTap: () => _showDetails(context),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              transform: Matrix4.identity()
                ..translate(0.0, _isHovered ? -8.0 : 0.0),
              padding: EdgeInsets.all(isMobile ? 20.w : 32.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: const Color(
                      0xFF4ECDC4,
                    ).withOpacity(_isHovered ? 0.15 : 0.08),
                    blurRadius: _isHovered ? 24 : 16,
                    offset: Offset(0, _isHovered ? 12 : 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: isMobile ? 44.w : 56.w,
                    height: isMobile ? 44.w : 56.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4ECDC4).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Icon(
                      Icons.group,
                      size: isMobile ? 22.sp : 28.sp,
                      color: const Color(0xFF4ECDC4),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'GDSC Iftar',
                    style: TextStyle(
                      fontSize: isMobile ? 18.sp : 22.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF25282B),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Community gathering and celebration with devs.',
                    style: TextStyle(
                      fontSize: isMobile ? 13.sp : 15.sp,
                      color: const Color(0xFF525252),
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  // Preserving yellow chips containing student/collaboration-related text as per requirements
                  // Removal/hide logic disabled for these chips to keep them visible.
                  // Wrap(
                  //   spacing: 8.w,
                  //   runSpacing: 8.h,
                  //   children: const [_Tag('Community'), _Tag('Celebration')],
                  // ),
                  const Spacer(),
                  Center(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        ColorizeAnimatedText(
                          'Tap for details',
                          textStyle: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          colors: [
                            const Color(0xFF828282).withOpacity(0.6),
                            const Color(0xFFB0B0B0).withOpacity(0.8),
                            const Color(0xFF828282).withOpacity(0.6),
                          ],
                        ),
                      ],
                      repeatForever: true,
                      pause: const Duration(milliseconds: 500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .animate()
        .fadeIn(duration: 500.ms, delay: 300.ms)
        .scale(begin: const Offset(0.8, 0.8), curve: Curves.easeOutCubic);
  }
}

/*  --------------------------------------------------
    HELPERS  used inside modals / cards
    -------------------------------------------------- */
class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20.sp, color: const Color(0xFF4ECDC4)),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: const Color(0xFF828282),
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF25282B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ZoomableAssetImage extends StatefulWidget {
  final String? path;
  final double height;
  final BorderRadius borderRadius;
  final Color borderColor;
  final Color placeholderIconColor;
  final String label;
  const _ZoomableAssetImage({
    required this.path,
    required this.height,
    required this.borderRadius,
    required this.borderColor,
    required this.placeholderIconColor,
    required this.label,
  });

  @override
  State<_ZoomableAssetImage> createState() => _ZoomableAssetImageState();
}

class _ZoomableAssetImageState extends State<_ZoomableAssetImage> {
  bool _hover = false;

  bool get _validPath {
    final p = widget.path;
    return p != null && p.trim().isNotEmpty && p.trim() != '[]';
  }

  void _openFullScreen(BuildContext context) {
    if (!_validPath) {
      debugPrint('Invalid imagePath: ${widget.path}');
      return;
    }
    debugPrint('Opening full-screen image: ${widget.path}');
    showGeneralDialog(
      context: context,
      barrierLabel: 'Image',
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, anim1, anim2) {
        return RawKeyboardListener(
          focusNode: FocusNode(),
          autofocus: true,
          onKey: (event) {
            if (event.logicalKey == LogicalKeyboardKey.escape &&
                event is RawKeyDownEvent) {
              Navigator.of(context).pop();
            }
          },
          child: Stack(
            children: [
              Center(
                child: InteractiveViewer(
                  minScale: 1,
                  maxScale: 4,
                  panEnabled: true,
                  child: Image.asset(
                    widget.path!,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.low,
                  ),
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: Semantics(
                  button: true,
                  label: 'Close image',
                  child: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      color: Colors.white,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      transitionBuilder: (context, anim, secondaryAnim, child) {
        return FadeTransition(
          opacity: anim,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.98, end: 1).animate(anim),
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.label,
      button: true,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: InkWell(
          onTap: () => _openFullScreen(context),
          focusColor: widget.placeholderIconColor.withOpacity(0.1),
          hoverColor: widget.placeholderIconColor.withOpacity(0.05),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            width: double.infinity,
            height: widget.height,
            decoration: BoxDecoration(
              color: const Color(0xFFFDFDFD),
              borderRadius: widget.borderRadius,
              border: Border.all(color: widget.borderColor),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            clipBehavior: Clip.hardEdge,
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: AnimatedScale(
                duration: const Duration(milliseconds: 180),
                scale: _hover ? 0.995 : 1,
                curve: Curves.easeOut,
                child: _validPath
                    ? Image.asset(
                        widget.path!,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.low,
                        errorBuilder: (context, error, stack) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_outlined,
                                size: 48.sp,
                                color: widget.placeholderIconColor.withOpacity(
                                  0.4,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                'View image',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xFF828282),
                                ),
                              ),
                            ],
                          );
                        },
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_outlined,
                            size: 48.sp,
                            color: widget.placeholderIconColor.withOpacity(0.4),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'View image',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xFF828282),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
