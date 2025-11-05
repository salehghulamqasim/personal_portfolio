import 'package:flutter/material.dart';

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
                  const Text(
                    'Menu',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
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

            // Simple menu buttons
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _buildSimpleButton(context, 'About', '/about'),
                    const SizedBox(height: 8),
                    _buildSimpleButton(context, 'Projects', '/projects'),
                    const SizedBox(height: 8),
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
          color: isActive ? const Color(0xFFFCC346) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: isActive ? Colors.white : Colors.black87,
            fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
