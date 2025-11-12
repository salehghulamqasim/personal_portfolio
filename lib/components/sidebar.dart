import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/themes/text_styles.dart';
import 'package:personal_portfolio/themes/colors.dart';

/// Sidebar Theme Colors based on the specifications
class SidebarColors {
  // Light Mode Colors
  static const Color lightBackground = Color(0xFFFAFAFA); // --sidebar
  static const Color lightForeground = Color(
    0xFF252525,
  ); // --sidebar-foreground
  static const Color lightPrimary = Color(0xFF030213); // --sidebar-primary
  static const Color lightPrimaryForeground = Color(0xFFFAFAFA);
  static const Color lightAccent = Color(0xFFF7F7F7); // --sidebar-accent
  static const Color lightAccentForeground = Color(0xFF353535);
  static const Color lightBorder = Color(0xFFEBEBEB); // --sidebar-border
  static const Color lightRing = Color(0xFFB5B5B5); // --sidebar-ring

  // Dark Mode Colors
  static const Color darkBackground = Color(0xFF353535);
  static const Color darkForeground = Color(0xFFFAFAFA);
  static const Color darkPrimary = Color(0xFF7C3AED); // Blue/purple primary
  static const Color darkPrimaryForeground = Color(0xFFFAFAFA);
  static const Color darkAccent = Color(0xFF454545);
  static const Color darkAccentForeground = Color(0xFFFAFAFA);
  static const Color darkBorder = Color(0xFF454545);
  static const Color darkRing = Color(0xFF707070);
}

/// Sidebar Configuration
class SidebarConfig {
  static const double desktopExpandedWidth = 256.0; // 16rem
  static const double desktopCollapsedWidth = 48.0; // 3rem
  static const double mobileWidth = 288.0; // 18rem
  static const Duration animationDuration = Duration(milliseconds: 200);
  static const Curve animationCurve = Curves.easeInOut; // Fixed: was easeLinear
}

/// Enhanced Sidebar Menu Item Model
class SidebarMenuItem {
  final String title;
  final IconData icon;
  final String? route;
  final VoidCallback? onTap;
  final bool isActive;
  final String? badge;
  final List<SidebarMenuItem>? submenu;

  const SidebarMenuItem({
    required this.title,
    required this.icon,
    this.route,
    this.onTap,
    this.isActive = false,
    this.badge,
    this.submenu,
  });
}

/// Professional Sidebar Component
class ProfessionalSidebar extends StatefulWidget {
  final List<SidebarMenuItem> menuItems;
  final String? currentRoute;
  final bool isRightSide;
  final Widget? header;
  final Widget? footer;
  final bool isDarkMode;

  const ProfessionalSidebar({
    super.key,
    required this.menuItems,
    this.currentRoute,
    this.isRightSide = true,
    this.header,
    this.footer,
    this.isDarkMode = false,
  });

  @override
  State<ProfessionalSidebar> createState() => _ProfessionalSidebarState();
}

class _ProfessionalSidebarState extends State<ProfessionalSidebar> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Get colors based on theme
  Color get backgroundColor => widget.isDarkMode
      ? SidebarColors.darkBackground
      : SidebarColors.lightBackground;

  Color get foregroundColor => widget.isDarkMode
      ? SidebarColors.darkForeground
      : SidebarColors.lightForeground;

  Color get accentColor =>
      widget.isDarkMode ? SidebarColors.darkAccent : SidebarColors.lightAccent;

  Color get accentForegroundColor => widget.isDarkMode
      ? SidebarColors.darkAccentForeground
      : SidebarColors.lightAccentForeground;

  Color get borderColor =>
      widget.isDarkMode ? SidebarColors.darkBorder : SidebarColors.lightBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SidebarConfig.mobileWidth.w,
      height: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          left: widget.isRightSide
              ? BorderSide(color: borderColor, width: 1.w)
              : BorderSide.none,
          right: !widget.isRightSide
              ? BorderSide(color: borderColor, width: 1.w)
              : BorderSide.none,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Sidebar Header
            if (widget.header != null) widget.header!,

            // Sidebar Content (Scrollable)
            Expanded(
              child: ListView(
                controller: _scrollController,
                children: [
                  // Add Home Button
                  _buildMenuItem(
                    SidebarMenuItem(
                      title: "Home",
                      icon: Icons.home,
                      route: "/",
                      onTap: () {
                        Navigator.pushNamed(context, "/");
                      },
                      isActive: widget.currentRoute == "/",
                    ),
                  ),

                  // Existing Menu Items
                  ...widget.menuItems.map((item) => _buildMenuItem(item)),
                ],
              ),
            ),

            // Sidebar Separator
            Container(height: 1.h, color: borderColor),

            // Sidebar Footer
            if (widget.footer != null)
              Container(padding: EdgeInsets.all(8.w), child: widget.footer!),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(SidebarMenuItem item) {
    final isActive = item.route == widget.currentRoute || item.isActive;

    return Column(
      children: [
        // Main Menu Button
        Container(
          margin: EdgeInsets.only(bottom: 2.h),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(6.r),
            child: InkWell(
              onTap:
                  item.onTap ??
                  () {
                    if (item.route != null) {
                      Navigator.pushNamed(context, item.route!);
                    }
                  },
              borderRadius: BorderRadius.circular(6.r),
              child: AnimatedContainer(
                duration: SidebarConfig.animationDuration,
                height: 32.h,
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                decoration: BoxDecoration(
                  color: isActive ? accentColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Row(
                  children: [
                    // Icon
                    Icon(
                      item.icon,
                      size: 16.sp,
                      color: isActive ? accentForegroundColor : foregroundColor,
                    ),

                    SizedBox(width: 8.w),

                    // Text
                    Expanded(
                      child: Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: isActive
                              ? FontWeight.w500
                              : FontWeight.w400,
                          color: isActive
                              ? accentForegroundColor
                              : foregroundColor,
                          fontFamily: Fonts.comfortaa.fontFamily,
                        ),
                      ),
                    ),

                    // Badge - FIXED: Use ConstrainedBox instead of minWidth
                    if (item.badge != null)
                      ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 20.w),
                        child: Container(
                          height: 20.h,
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          decoration: BoxDecoration(
                            color: AppColors.primaryOrange,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            item.badge!,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                    // Submenu indicator
                    if (item.submenu != null && item.submenu!.isNotEmpty)
                      Icon(
                        Icons.chevron_right,
                        size: 14.sp,
                        color: foregroundColor.withValues(alpha: 0.5),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Submenu
        if (item.submenu != null && item.submenu!.isNotEmpty)
          Container(
            margin: EdgeInsets.only(left: 14.w, bottom: 2.h),
            padding: EdgeInsets.only(left: 10.w, top: 2.h, bottom: 2.h),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: borderColor, width: 1.w),
              ),
            ),
            child: Column(
              children: item.submenu!
                  .map((subItem) => _buildSubMenuItem(subItem))
                  .toList(),
            ),
          ),
      ],
    );
  }

  Widget _buildSubMenuItem(SidebarMenuItem item) {
    final isActive = item.route == widget.currentRoute || item.isActive;

    return Container(
      margin: EdgeInsets.only(bottom: 1.h),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(6.r),
        child: InkWell(
          onTap:
              item.onTap ??
              () {
                if (item.route != null) {
                  Navigator.pushNamed(context, item.route!);
                }
              },
          borderRadius: BorderRadius.circular(6.r),
          child: AnimatedContainer(
            duration: SidebarConfig.animationDuration,
            height: 28.h,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              color: isActive ? accentColor : Colors.transparent,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
                      color: isActive ? accentForegroundColor : foregroundColor,
                      fontFamily: Fonts.comfortaa.fontFamily,
                    ),
                  ),
                ),

                // Fixed badge for submenu
                if (item.badge != null)
                  ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 16.w),
                    child: Container(
                      height: 16.h,
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      decoration: BoxDecoration(
                        color: AppColors.primaryOrange,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        item.badge!,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Sidebar Header Component
class SidebarHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? avatar;
  final bool isDarkMode;

  const SidebarHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.avatar,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final foregroundColor = isDarkMode
        ? SidebarColors.darkForeground
        : SidebarColors.lightForeground;

    return Column(
      children: [
        SizedBox(height: 16.h),

        // Avatar or Logo
        if (avatar != null)
          Container(
            width: 48.w,
            height: 48.h,
            margin: EdgeInsets.only(bottom: 12.h),
            child: avatar!,
          ),

        // Title
        Text(
          title,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: foregroundColor,
            fontFamily: Fonts.comfortaa.fontFamily,
          ),
          textAlign: TextAlign.center,
        ),

        // Subtitle
        if (subtitle != null) ...[
          SizedBox(height: 4.h),
          Text(
            subtitle!,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: foregroundColor.withValues(alpha: 0.7),
              fontFamily: Fonts.comfortaa.fontFamily,
            ),
            textAlign: TextAlign.center,
          ),
        ],

        SizedBox(height: 16.h),

        // Divider below "Menu"
        Container(
          height: 1.h,
          color: SidebarColors.lightBorder.withValues(alpha: 0.5),
        ),
      ],
    );
  }
}

/// Sidebar Footer Component
class SidebarFooter extends StatelessWidget {
  final String copyrightText;
  final bool isDarkMode;

  const SidebarFooter({
    super.key,
    required this.copyrightText,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final foregroundColor = isDarkMode
        ? SidebarColors.darkForeground
        : SidebarColors.lightForeground;

    return Column(
      children: [
        SizedBox(height: 8.h),
        Text(
          copyrightText,
          style: TextStyle(
            fontSize: 12.sp,
            color: foregroundColor.withValues(alpha: 0.6),
            fontFamily: Fonts.comfortaa.fontFamily,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),

        // Add "Saleh Ghulam 2025" at the bottom
        Text(
          "Saleh Ghulam 2025",
          style: TextStyle(
            fontSize: 12.sp,
            color: foregroundColor.withValues(alpha: 0.7),
            fontFamily: Fonts.comfortaa.fontFamily,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
