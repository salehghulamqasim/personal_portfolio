import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:personal_portfolio/components/hover_widget.dart';
import 'package:personal_portfolio/components/tech_skills.dart';
import 'package:personal_portfolio/themes/colors.dart';
import 'package:personal_portfolio/themes/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String? expandedDescription;
  final List<String>? keyFeatures;
  final List<String> imagePaths;
  final List<String>? technologies;
  final String mainImage;
  final bool imageOnRight;

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
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  late bool isMobile;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isMobile = MediaQuery.of(context).size.width < 768;
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
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

                // Expandable button indicator
                ExpandableButton(
                  child: OutlinedButton(
                    onPressed: null, // Disabled tap functionality
                    child: Text(
                      isExpanded ? 'Details Disabled' : 'Details Disabled',
                      style: TextStyle(
                        fontFamily: Fonts.roboto.fontFamily,
                        fontSize: isMobile ? 14.sp : 16.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );

          // Main image section - CENTERED
          Widget imageSection = Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: HoverWidget(
              hoverScale: 1.05,
              animationDuration: Duration(milliseconds: 300),
              child: SizedBox(
                height: isMobile ? 320.h : 550.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    widget.imagePaths.isNotEmpty
                        ? widget.mainImage
                        : widget.imagePaths[0],
                    fit: BoxFit.contain,
                  ),
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
              borderRadius: BorderRadius.circular(12.r),
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

                          // Buttons for demo and source code
                          SizedBox(height: isMobile ? 24.h : 24.h),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryOrange,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isMobile ? 20.w : 16.w,
                                    vertical: isMobile ? 14.h : 29.h,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
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
                              SizedBox(width: isMobile ? 12.w : 16.w),
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: Colors.black),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isMobile ? 20.w : 16.w,
                                    vertical: isMobile ? 14.h : 29.h,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'View Live',
                                  style: Fonts.roboto.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: isMobile ? 24.h : 24.h),

                          // Replace your CarouselSlider section with this:
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
                                      ),
                                    ),
                                  ),
                                );
                              },
                              layout: SwiperLayout.DEFAULT,
                              viewportFraction:
                                  0.9, // slightly smaller than 1 to show next image
                              scale: 1.0, // full scale, no shrinking
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

                          // // Carousel Section
                          // CarouselSlider(
                          //   options: CarouselOptions(
                          //     height: isMobile ? 350.h : 500.h,
                          //     viewportFraction: isMobile ? 1.0 : 0.9,
                          //     enableInfiniteScroll: imagePaths.length > 1,
                          //     autoPlay: false,
                          //     enlargeCenterPage: !isMobile,
                          //   ),
                          //   items: imagePaths.map((imagePath) {
                          //     return Builder(
                          //       builder: (BuildContext context) {
                          //         return Container(
                          //           margin: EdgeInsets.symmetric(
                          //             horizontal: isMobile ? 0 : 8.w,
                          //           ),
                          //           child: ClipRRect(
                          //             borderRadius: BorderRadius.circular(12.r),
                          //             child: Image.asset(
                          //               imagePath,
                          //               fit: BoxFit.contain,
                          //               width: double.infinity,
                          //             ),
                          //           ),
                          //         );
                          //       },
                          //     );
                          //   }).toList(),
                          // ),
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
    );
  }
}
