import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:personal_portfolio/components/hover_widget.dart';
import 'package:personal_portfolio/components/tech_skills.dart';
import 'package:personal_portfolio/themes/colors.dart';
import 'package:personal_portfolio/themes/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String? expandedDescription;
  final List<String>? keyFeatures;
  final List<String> imagePaths;
  final List<String>? technologies;
  final String mainImage;
  final bool imageOnRight;
  final String? githubUrl;
  final String? liveUrl;
  final String liveButtonText;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    this.expandedDescription,
    this.keyFeatures,
    required this.imagePaths,
    this.imageOnRight = true,
    required this.mainImage,
    this.technologies,
    this.githubUrl,
    this.liveUrl,
    this.liveButtonText = 'Demo',
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  late bool isMobile;
  late bool isDesktop;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final width = MediaQuery.of(context).size.width;
    isMobile = width < 768;
    isDesktop = width >= 1024;
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ExpandableNotifier(
        // here we add builder in child to get context of expandable
        child: Builder(
          builder: (context) {
            final controller = ExpandableController.of(context);
            final isExpanded = controller?.expanded ?? false;

            Widget textSection = Padding(
              padding: EdgeInsets.all(isMobile ? 16.w : 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: isMobile ? 20.sp : 24.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: Fonts.playfair.fontFamily,
                    ),
                  ),
                  SizedBox(height: isMobile ? 12.h : 16.h),

                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: Text(
                      isExpanded
                          ? (widget.expandedDescription ?? widget.description)
                          : widget.description,

                      key: ValueKey(isExpanded), // Important!
                      style: TextStyle(
                        fontSize: isMobile ? 14.sp : 16.sp,
                        fontFamily: Fonts.roboto.fontFamily,
                        height: 1.5,
                      ),
                    ),
                  ),

                  SizedBox(height: isMobile ? 12.h : 22.h),

                  // Neutral, pill-shaped Expand/Collapse button
                  Center(
                    child: ExpandableButton(
                      child: Semantics(
                        button: true,
                        label: isExpanded
                            ? 'Collapse project details'
                            : 'Expand project details',
                        toggled: isExpanded,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          width: double.infinity,
                          constraints: BoxConstraints(
                            minHeight: 48.h,
                            minWidth: 120.w,
                          ),
                          decoration: BoxDecoration(
                            color: isExpanded
                                ? const Color(0xFFF3F4F6)
                                : Colors.white,
                            border: Border.all(
                              color: const Color(0xFFE5E7EB),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 12.h,
                              horizontal: 18.w,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AnimatedRotation(
                                  turns: isExpanded ? 0.5 : 0.0,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  child: Icon(
                                    Icons.expand_more,
                                    color: const Color(0xFF888888),
                                    size: isMobile ? 22.sp : 24.sp,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  isExpanded ? 'Show Less' : 'Show More',
                                  style: TextStyle(
                                    fontFamily: Fonts.roboto.fontFamily,
                                    fontWeight: FontWeight.w600,
                                    fontSize: isMobile ? 15.sp : 17.sp,
                                    color: const Color(0xFF444444),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ---
                  // Style Guide: ProjectCard Expand/Collapse Button
                  //
                  // - Muted color palette: #F3F4F6 (background), #888888 (icon/border), #444444 (text)
                  // - No hover effect on desktop; all interaction is via click/tap
                  // - Touch targets: min 52px height, 140px width (mobile-first)
                  // - Visual feedback: subtle color change on tap (mobile)
                  // - Only button area triggers expand/collapse (no accidental triggers)
                  // - Accessible: proper contrast, semantics, keyboard focusable
                  // - Animation: smooth expand/collapse, animated icon rotation
                  // ---
                ],
              ),
            );

            // Main image section - CENTERED
            Widget imageSection = Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: SizedBox(
                height: isMobile ? 220.h : 340.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    widget.imagePaths.isNotEmpty
                        ? widget.mainImage
                        : widget.imagePaths[0],
                    fit: BoxFit.contain,
                    alignment: Alignment(0, -0.5),
                    semanticLabel: '${widget.title} project preview image',
                  ),
                ),
              ),
            );

            Widget cardContent = isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [imageSection, textSection],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: widget.imageOnRight ? textSection : imageSection,
                      ),
                      Expanded(
                        child: widget.imageOnRight ? imageSection : textSection,
                      ),
                    ],
                  );

            return Container(
              width: isMobile ? double.infinity : 900.w,
              margin: EdgeInsets.all(isMobile ? 8.w : 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  ExpandablePanel(
                    header: cardContent,
                    collapsed: SizedBox.shrink(),
                    expanded: Container(
                      padding: EdgeInsets.all(isMobile ? 12.w : 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.keyFeatures != null &&
                              widget.keyFeatures!.isNotEmpty) ...[
                            // // Expanded description
                            // if (expandedDescription != null) ...[
                            //   Text(
                            //     expandedDescription!,
                            //     style: TextStyle(
                            //       fontSize: isMobile ? 14.sp : 16.sp,
                            //       fontFamily: Fonts.roboto.fontFamily,
                            //       height: 1.5,
                            //       color: Colors.grey[700],
                            //     ),
                            //   ),
                            //   SizedBox(height: isMobile ? 24.h : 24.h),
                            // ],
                            Text(
                              'Key Features',
                              style: TextStyle(
                                fontSize: isMobile ? 20.sp : 20.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: Fonts.playfair.fontFamily,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: isMobile ? 16.h : 16.h),

                            // Features list with bullet points
                            ...widget.keyFeatures!.map(
                              (feature) => Padding(
                                padding: EdgeInsets.only(bottom: 8.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        top: 8.h,
                                        right: 12.w,
                                      ),
                                      width: 8.w,
                                      height: 8.h,
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        feature,
                                        style: TextStyle(
                                          fontSize: isMobile ? 16.sp : 16.sp,
                                          fontFamily: Fonts.roboto.fontFamily,
                                          height: 1.5,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: isMobile ? 32.h : 24.h),

                            // Technologies section
                            Text(
                              'Technologies',
                              style: TextStyle(
                                fontSize: isMobile ? 20.sp : 20.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: Fonts.playfair.fontFamily,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: isMobile ? 16.h : 16.h),

                            TechSkills(
                              alignment: WrapAlignment.center,
                              skills: widget.technologies ?? [],
                            ),

                            // Spacer with light grey color
                            SizedBox(height: 16.h),
                            Container(height: 1.h, color: Colors.grey[200]),
                            SizedBox(height: 24.h),

                            // Centered buttons for demo and source code
                            Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (widget.githubUrl != null) ...[
                                    ElevatedButton(
                                      onPressed: () async {
                                        final uri = Uri.parse(
                                          widget.githubUrl!,
                                        );
                                        if (await canLaunchUrl(uri)) {
                                          await launchUrl(uri);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppColors.primaryOrange,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: isMobile ? 20.w : 16.w,
                                          vertical: isMobile ? 14.h : 29.h,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        isMobile
                                            ? 'Github Repo'
                                            : 'Github Repository',
                                        style: Fonts.roboto.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    if (widget.liveUrl != null)
                                      SizedBox(width: isMobile ? 12.w : 16.w),
                                  ],
                                  if (widget.liveUrl != null)
                                    OutlinedButton(
                                      onPressed: () async {
                                        final uri = Uri.parse(widget.liveUrl!);
                                        if (await canLaunchUrl(uri)) {
                                          await launchUrl(uri);
                                        }
                                      },
                                      style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                          color: Colors.black,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: isMobile ? 20.w : 16.w,
                                          vertical: isMobile ? 14.h : 29.h,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        widget.liveButtonText,
                                        style: Fonts.roboto.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            // Spacer with light grey color
                            SizedBox(height: 16.h),
                            Container(height: 1.h, color: Colors.grey[200]),

                            // SizedBox(height: 24.h),
                            SizedBox(height: isMobile ? 24.h : 24.h),

                            SizedBox(
                              height: isMobile ? 350.h : 500.h,
                              child: Swiper(
                                itemCount: widget.imagePaths.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: isMobile ? 8.w : 12.w,
                                    ), // spacing between images
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.r),
                                      child: FittedBox(
                                        fit: BoxFit
                                            .contain, // make sure the full image fits without cropping
                                        child: Image.asset(
                                          widget.imagePaths[index],
                                          semanticLabel:
                                              '${widget.title} project screenshot ${index + 1}',
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                layout: SwiperLayout.DEFAULT,
                                viewportFraction:
                                    1.0, // slightly smaller than 1 to show next image
                                scale: 1.0,
                                autoplay: false,
                                loop: true,
                                pagination: const SwiperPagination(
                                  builder: DotSwiperPaginationBuilder(
                                    color: Colors.grey,
                                    activeColor: AppColors.primaryOrange,
                                    size: 8.0,
                                    activeSize: 12.0,
                                  ),
                                ),
                                // control: const SwiperControl(
                                //   color: AppColors.primaryOrange,
                                // ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    theme: const ExpandableThemeData(
                      hasIcon: false,
                      tapHeaderToExpand: true,
                      tapBodyToCollapse: false,
                      animationDuration: Duration(milliseconds: 400),
                      iconPadding: EdgeInsets.zero,
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      useInkWell: true,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
