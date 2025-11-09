import 'package:flutter/material.dart';
import 'package:personal_portfolio/components/hover_widget.dart';
import 'package:personal_portfolio/components/tech_skills.dart';
import 'package:personal_portfolio/themes/colors.dart';
import 'package:personal_portfolio/themes/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String? expandedDescription;
  final List<String>? keyFeatures; // Add this parameter
  final List<String> imagePaths;

  final List<String>? technologies;
  //main image
  final String mainImage;
  final bool imageOnRight;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    this.expandedDescription,
    this.keyFeatures, // Add this parameter
    required this.imagePaths,
    this.imageOnRight = true,
    required this.mainImage,
    this.technologies,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // Check if mobile (you can adjust the breakpoint)
    bool isMobile = MediaQuery.of(context).size.width < 768;

    Widget textSection = Padding(
      padding: EdgeInsets.all(isMobile ? 16.w : 24.w),
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

          // Animated description switcher
          AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            layoutBuilder: (currentChild, previousChildren) {
              return Stack(
                alignment: Alignment.centerLeft, // Align text to the left
                children: <Widget>[
                  ...previousChildren,
                  if (currentChild != null) currentChild,
                ],
              );
            },
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Text(
              isExpanded && widget.expandedDescription != null
                  ? widget.expandedDescription!
                  : widget.description,
              style: TextStyle(
                fontSize: isMobile ? 14.sp : 16.sp,
                fontFamily: Fonts.roboto.fontFamily,
                height: 1.5,
              ),
            ),
          ),

          SizedBox(height: isMobile ? 12.h : 22.h),
          OutlinedButton(
            //on pressed would expand the entire box not just description
            onPressed: () {
              setState(() {
                // isExpanded = !isExpanded;
              });
            },
            child: Text(
              'tap to expand',
              style: TextStyle(
                fontFamily: Fonts.roboto.fontFamily,
                fontSize: isMobile ? 14.sp : 16.sp,
              ),
            ),
          ),
        ],
      ),
    );

    // Main image section - shows only the first image from the list
    Widget imageSection = HoverWidget(
      hoverScale: 1.05, // Slightly enlarge the image on hover
      animationDuration: Duration(milliseconds: 300),
      child: SizedBox(
        height: isMobile ? 320.h : 550.h, // Increased height for larger images
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.asset(
            widget.imagePaths.isNotEmpty
                ? widget.mainImage
                : widget.imagePaths[0],
            fit: BoxFit.cover, // Ensures the image fills the container
            width: double.infinity, // Ensures the image takes full width
          ),
        ),
      ),
    );

    // Mobile: Stack vertically, Desktop: Side by side
    Widget cardContent = isMobile
        ? Column(children: [imageSection, textSection])
        : Row(
            children: [
              Expanded(child: widget.imageOnRight ? textSection : imageSection),
              Expanded(child: widget.imageOnRight ? imageSection : textSection),
            ],
          );

    return Container(
      width: isMobile ? double.infinity : 1000.w,
      margin: EdgeInsets.all(isMobile ? 8.w : 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero,
          trailing: SizedBox.shrink(), // Removes the arrow icon

          onExpansionChanged: (expanded) {
            setState(() {
              isExpanded = expanded;
            });
          },

          title: Row(
            children: [Expanded(child: cardContent)],
          ), //to ensure tile takes or uses free space by arrow above which we turned to shrink()
          // Expanded section with key features and carousel
          children: [
            Container(
              padding: EdgeInsets.all(isMobile ? 12.w : 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Key Features Section
                  if (widget.keyFeatures != null &&
                      widget.keyFeatures!.isNotEmpty) ...[
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
                    ...widget.keyFeatures!
                        // ... means instead of adding a single widget, it expands the entire
                        // list and adds each item as a separate widget.
                        .map(
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
                        )
                        .toList(),

                    SizedBox(height: isMobile ? 32.h : 24.h),
                    //text style to say technologies used
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            //if technologies is null, provide empty list
                          ),

                          //buttons for demo and source code
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
                        ],
                      ),
                    ),

                    // Carousel Section
                    CarouselSlider(
                      options: CarouselOptions(
                        height: isMobile ? 350.h : 500.h,
                        viewportFraction: isMobile ? 1.0 : 0.9,
                        enableInfiniteScroll: widget.imagePaths.length > 1,
                        autoPlay: false,
                        enlargeCenterPage: !isMobile,
                      ),
                      items: widget.imagePaths.map((imagePath) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: isMobile ? 0 : 8.w,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: Image.asset(
                                  imagePath,
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
