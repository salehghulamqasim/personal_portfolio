//  lib / pages / aboutMe.dart
//  Leaf-level widgets used by aboutMe_section.dart

import 'package:flutter/material.dart';
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
      'award': 'Certificate of Appreciation',
      'description':
          'I was a proud member of my university\'s Computer Club. During my time there, I actively participated in organizing and attending club events. I helped plan and execute events, attended regular meetings, and played a key role in recruiting students who were interested in joining the club. The Computer Club was a hub for creativity and innovation, and I was honored to receive a Certificate of Appreciation for my contributions, especially in idea generation. It was an incredible experience that allowed me to collaborate with talented peers and make a meaningful impact.',
      'team': '30 members',
      'duration': '1 year',
      'imagePath':
          'assets/Certificates/computer club certificate of appreciation.pdf',
    },
    '2': {
      'name': 'International Conference on Logistics',
      'project': 'SkyPort',
      'award': 'Certificate of Appreciation',
      'description':
          'At the International Conference on Logistics, my team of three presented SkyPort, a project aimed at revolutionizing port operations using drones, AI, and data analytics. We collaborated with Dr. Nesrine Atitallah and the Arab Open University to refine our concept, design a poster, and pitch our vision to industry professionals. SkyPort focuses on enhancing safety, efficiency, and sustainability in port logistics through real-time tracking, predictive analytics, and aerial surveillance.',
      'tech': ['Drones', 'AI', 'Data Analytics', 'AWS S3'],
      'team': '3 members',
      'duration': '2 months',
      'imagePath':
          'assets/Certificates/international_conference_certificate.pdf',
    },
    '3': {
      'name': 'Tech Meetup 3',
      'project': 'Augmented Reality Bookstore',
      // 'award': '⭐ Top 10 Finalist',
      'description':
          'Built an AR app that transforms traditional bookstores into interactive experiences. Users can preview books in 3D before purchasing.',
      'tech': ['Unity', 'ARCore', 'C#'],
      'team': '4 members',
      'duration': '48 hours',
    },
    '4': {
      'name': 'Smart City Hackathon',
      'project': 'Jeddah University',
      // 'award': '🏆 Best Urban Solution',
      'description':
          'Developed a smart parking solution that reduces traffic congestion by 30% using IoT sensors and real-time data analytics.',
      'tech': ['IoT', 'Firebase', 'Flutter', 'Node.js'],
      'team': '3 members',
      'duration': '36 hours',
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
                            children: (data['tech'] as List<dynamic>)
                                .map(
                                  (e) => Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 6.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                        color: hackathonColor.withOpacity(0.3),
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
                          SizedBox(height: 24.h),
                          Row(
                            children: [
                              Expanded(
                                child: _StatItem(
                                  icon: Icons.people,
                                  label: 'Team',
                                  value: data['team']!,
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: _StatItem(
                                  icon: Icons.access_time,
                                  label: 'Duration',
                                  value: data['duration']!,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h),
                          Container(
                            width: double.infinity,
                            height: 200.h,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(
                                color: hackathonColor.withOpacity(0.2),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image_outlined,
                                  size: 48.sp,
                                  color: hackathonColor.withOpacity(0.4),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  'Project Screenshot',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: const Color(0xFF828282),
                                  ),
                                ),
                              ],
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
                            'Led technical workshops and mentored 30+ students in mobile development. Organized 5 successful tech events with 200+ attendees. Contributed to open-source projects and helped build the local developer community.',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xFF525252),
                              height: 1.6,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          const Text(
                            'Technologies & Skills',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Wrap(
                            spacing: 8.w,
                            runSpacing: 8.h,
                            children: [
                              _TechChip('Flutter'),
                              _TechChip('Firebase'),
                              _TechChip('Public Speaking'),
                              _TechChip('Event Management'),
                              _TechChip('Mentoring'),
                              _TechChip('Leadership'),
                            ],
                          ),
                          SizedBox(height: 24.h),
                          Row(
                            children: [
                              Expanded(
                                child: _StatItem(
                                  icon: Icons.people,
                                  label: 'Students Mentored',
                                  value: '30+',
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: _StatItem(
                                  icon: Icons.event,
                                  label: 'Events Organized',
                                  value: '5',
                                ),
                              ),
                            ],
                          ),
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
                                  value: '8 members',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h),
                          Container(
                            width: double.infinity,
                            height: 200.h,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(
                                color: const Color(0xFF4ECDC4).withOpacity(0.2),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.photo_library_outlined,
                                  size: 48.sp,
                                  color: const Color(
                                    0xFF4ECDC4,
                                  ).withOpacity(0.4),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  'GDSC Event Photos',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: const Color(0xFF828282),
                                  ),
                                ),
                              ],
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
                  Wrap(
                    spacing: 8.w,
                    runSpacing: 8.h,
                    children: const [_Tag('30+ Students'), _Tag('5 Events')],
                  ),
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
class _TechChip extends StatelessWidget {
  final String text;
  const _TechChip(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: const Color(0xFF4ECDC4).withOpacity(0.3)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF525252),
        ),
      ),
    );
  }
}

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

class _Tag extends StatelessWidget {
  final String text;
  final Color? color;
  // ignore: unused_element_parameter
  const _Tag(this.text, {this.color});

  @override
  Widget build(BuildContext context) {
    final tagColor = color ?? const Color(0xFFFCC346);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: tagColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w600,
          color: tagColor,
        ),
      ),
    );
  }
}
