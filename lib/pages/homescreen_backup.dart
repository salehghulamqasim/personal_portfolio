// import 'package:flutter/material.dart';
// import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
// import 'package:personal_portfolio/components/app_bar.dart';
// import 'package:personal_portfolio/components/mobilebar.dart';

// class Homescreen extends StatefulWidget {
//   const Homescreen({super.key});

//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }

// class _HomescreenState extends State<Homescreen> {
//   final _advancedDrawerController = AdvancedDrawerController();
//   bool _isAtTop = true;
//   String currentRoute = '/';
//   bool isMobile = false; // Set based on your responsive logic

//   @override
//   void dispose() {
//     _advancedDrawerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Determine if mobile based on screen width
//     isMobile = MediaQuery.of(context).size.width < 768;

//     // If mobile, wrap with AdvancedDrawer
//     if (isMobile) {
//       return AdvancedDrawer(
//         backdrop: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [Colors.grey.shade800, Colors.grey.shade900],
//             ),
//           ),
//         ),
//         controller: _advancedDrawerController,
//         animationCurve: Curves.easeInOut,
//         animationDuration: const Duration(milliseconds: 300),
//         animateChildDecoration: true,
//         rtlOpening: false,
//         disabledGestures: false,
//         childDecoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
//         drawer: MobileDrawerContent(
//           currentRoute: currentRoute,
//         ),
//         child: Scaffold(
//           extendBodyBehindAppBar: true,
//           appBar: MobileAppBar(
//             opacity: _isAtTop ? 1.0 : 0.0,
//             currentRoute: currentRoute,
//             drawerController: _advancedDrawerController,
//           ),
//           body: _buildBody(),
//         ),
//       );
//     }

//     // Desktop view (no drawer needed)
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: CustomAppBar(
//         opacity: _isAtTop ? 1.0 : 0.0,
//         currentRoute: currentRoute,
//       ),
//       body: _buildBody(),
//     );
//   }

//   Widget _buildBody() {
//     return NotificationListener<ScrollNotification>(
//       onNotification: (scrollNotification) {
//         if (scrollNotification is ScrollUpdateNotification) {
//           setState(() {
//             _isAtTop = scrollNotification.metrics.pixels < 50;
//           });
//         }
//         return true;
//       },
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Your content here
//             Container(
//               height: 1000,
//               color: Colors.amber.withOpacity(0.3),
//               child: const Center(child: Text('Your Content')),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
