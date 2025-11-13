import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_portfolio/themes/colors.dart';
import 'package:personal_portfolio/themes/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String name = "Saleh Ghulam";
  //below are to press buttons on app bar
  final double height;
  final double opacity;
  final String? currentRoute;
  final ScrollController? scrollController;

  const CustomAppBar({
    super.key,
    this.height = kToolbarHeight,
    this.opacity = 1.0,
    this.currentRoute,
    this.scrollController,
  });

  //below are navigation functions to navigate to different pages
  /// Navigation handler methods for the main menu actions.
  /// These methods use Flutter's Navigator to push named routes when menu items are pressed.
  /// Navigates to the specific page when the about button is pressed.
  void _onAboutPressed(BuildContext context) {
    Navigator.pushNamed(context, '/about');
  }

  // void _onProjectsPressed(BuildContext context) {
  //   Navigator.pushNamed(context, '/projects');
  // }

  void _onExperienceEducationPressed(BuildContext context) {
    Navigator.pushNamed(context, '/experience_education');
  }

  void _onContactPressed(BuildContext context) {
    Navigator.pushNamed(context, '/contact');
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOut, //easeout for smoothness
      child: IgnorePointer(
        ignoring: opacity < 0.5, // avoid clicks when hidden/fading out
        child: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.primaryOrange, // Android status bar
            statusBarIconBrightness: Brightness.dark, // Dark icons
          ),
          //backgroundColor: Colors.blue.withOpacity(0.0), // Make transparent
          backgroundColor: Colors.transparent,
          //elevation: 0, // Remove shadow
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false, //remove back button
          toolbarHeight: height,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left side - Name
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: Fonts.comfortaa.fontFamily,
                  ),
                ),

                // Right side - Navigation buttons
                Row(
                  children: [
                    //here we use the _buildNavButton method to build buttons
                    //When the current route matches the button route, we set isActive to true
                    // hence highlighting the active page
                    _buildNavButton(
                      text: 'About Me',
                      onPressed: () => _onAboutPressed(context),
                      isActive: currentRoute == '/about',
                    ),

                    // _buildNavButton(
                    //   text: 'Projects',
                    //   onPressed: () => _onProjectsPressed(context),
                    //   isActive: currentRoute == '/projects',
                    // ),
                    _buildNavButton(
                      text: 'Experience & Education',
                      onPressed: () => _onExperienceEducationPressed(context),
                      isActive: currentRoute == '/experience_education',
                    ),

                    _buildNavButton(
                      text: 'Contacts Me',
                      onPressed: () => _onContactPressed(context),
                      isActive: currentRoute == '/contact',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton({
    //first we create a nav button widget
    //then we add string and onpressed required and a isActive boolean
    //then we return TextButton with the styles
    required String text,
    required VoidCallback onPressed,
    required bool isActive,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              //Colors.black,
              fontSize: 19.sp,
            ),
          ),
        ),

        //when is acttive is true we add an orange underline
        if (isActive)
          Container(height: 2.h, width: 60.w, color: Color(0xFFFCC346)),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
