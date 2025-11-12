import 'package:flutter/material.dart';
import 'package:personal_portfolio/themes/text_styles.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String name = "Saleh Ghulam";
  final double height;
  final double opacity;
  final String? currentRoute;

  const MobileAppBar({
    super.key,
    this.height = kToolbarHeight,
    this.opacity = 1.0,
    this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 200),
      child: IgnorePointer(
        ignoring: opacity < 0.5,
        child: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          toolbarHeight: height,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // GestureDetector(
                //   onTap: () => Scaffold.of(context).openEndDrawer(),
                //   child: const Icon(Icons.menu, color: Colors.black, size: 24),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class MobileDrawerContent extends StatelessWidget {
  final String? currentRoute;

  const MobileDrawerContent({super.key, this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Simple header with Menu title and close button
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Menu',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: Fonts.comfortaa.fontFamily,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close,
                      size: 24,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // Light grey divider under "Menu"
            const Divider(
              height: 1,
              thickness: 1,
              color: Color(0xFFE8E8E8), // subtle grey divider
            ),

            // Simple menu buttons
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // small spacing between divider and first item
                    SizedBox(height: 12),
                    // Home button (new)
                    _buildSimpleButton(context, 'Home', '/'),
                    const SizedBox(height: 8),
                    _buildSimpleButton(context, 'About', '/about'),
                    const SizedBox(height: 8),
                    // _buildSimpleButton(context, 'Projects', '/projects'),
                    // const SizedBox(height: 8),
                    _buildSimpleButton(
                      context,
                      'Experience',
                      '/experience_education',
                    ),
                    const SizedBox(height: 8),
                    _buildSimpleButton(context, 'Contact', '/contact'),
                  ],
                ),
              ),
            ),

            // Footer text at bottom
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Saleh Ghulam 2025',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSimpleButton(BuildContext context, String title, String route) {
    final isActive = currentRoute == route;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isActive
              ? const Color(0xFFFCC346).withValues(alpha: 0.3)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: isActive ? Colors.black87 : Colors.black,
            fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
            fontFamily: Fonts.comfortaa.fontFamily,
          ),
        ),
      ),
    );
  }
}
