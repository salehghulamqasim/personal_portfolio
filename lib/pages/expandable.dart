// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:expandable/expandable.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ExpandableProjectCard extends StatelessWidget {
//   final String title;
//   final String shortDescription;
//   final String fullDescription;
//   final List<String> techStack;
//   final String thumbnailImage;
//   final List<String> screenshots;
//   final String? githubUrl;
//   final String? liveUrl;
//   final bool isFeatured; // For styling featured projects differently

//   const ExpandableProjectCard({
//     super.key,
//     required this.title,
//     required this.shortDescription,
//     required this.fullDescription,
//     required this.techStack,
//     required this.thumbnailImage,
//     this.screenshots = const [],
//     this.githubUrl,
//     this.liveUrl,
//     this.isFeatured = false,
//   });

//   Future<void> _launchUrl(String url) async {
//     final Uri uri = Uri.parse(url);
//     if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
//       debugPrint('Could not launch $url');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ExpandableNotifier(
//       child: Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: 24.w,
//           vertical: isFeatured ? 16.h : 12.h,
//         ),
//         child: Card(
//           elevation: 4,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(isFeatured ? 20.w : 16.w),
//             child: ExpandablePanel(
//               theme: const ExpandableThemeData(
//                 hasIcon: true,
//                 iconColor: Colors.black87,
//                 iconSize: 28,
//                 iconPadding: EdgeInsets.only(top: 8),
//               ),
//               header: _buildHeader(context),
//               collapsed: _buildCollapsed(),
//               expanded: _buildExpanded(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         // Check if mobile or desktop
//         final isMobile = constraints.maxWidth < 600;

//         if (isMobile) {
//           // Mobile: Stack layout (image on top)
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.asset(
//                   thumbnailImage,
//                   width: double.infinity,
//                   height: 180.h,
//                   fit: BoxFit.cover,
//                   cacheHeight: (180 * MediaQuery.of(context).devicePixelRatio).round(),
//                 ),
//               ),
//               SizedBox(height: 16.h),
//               _buildTitleAndDescription(),
//             ],
//           );
//         } else {
//           // Desktop: Horizontal layout
//           return Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.asset(
//                   thumbnailImage,
//                   width: isFeatured ? 160.w : 120.w,
//                   height: isFeatured ? 160.w : 120.w,
//                   fit: BoxFit.cover,
//                   cacheHeight: ((isFeatured ? 160 : 120) * MediaQuery.of(context).devicePixelRatio).round(),
//                   cacheWidth: ((isFeatured ? 160 : 120) * MediaQuery.of(context).devicePixelRatio).round(),
//                 ),
//               ),
//               SizedBox(width: 20.w),
//               Expanded(child: _buildTitleAndDescription()),
//             ],
//           );
//         }
//       },
//     );
//   }

//   Widget _buildTitleAndDescription() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: isFeatured ? 24.sp : 20.sp,
//             fontWeight: FontWeight.bold,
//             color: Colors.black87,
//           ),
//         ),
//         SizedBox(height: 8.h),
//         Text(
//           shortDescription,
//           style: TextStyle(
//             fontSize: 14.sp,
//             color: Colors.grey[600],
//             height: 1.4,
//           ),
//         ),
//         SizedBox(height: 12.h),
//         Wrap(
//           spacing: 8.w,
//           runSpacing: 8.h,
//           children: techStack.take(isFeatured ? 6 : 4).map((tech) {
//             return Container(
//               padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFFCC346).withOpacity(0.2),
//                 borderRadius: BorderRadius.circular(16),
//                 border: Border.all(
//                   color: const Color(0xFFFCC346),
//                   width: 1,
//                 ),
//               ),
//               child: Text(
//                 tech,
//                 style: TextStyle(
//                   fontSize: 12.sp,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black87,
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }

//   Widget _buildCollapsed() {
//     return Padding(
//       padding: EdgeInsets.only(top: 8.h),
//       child: Text(
//         'Tap to view details →',
//         style: TextStyle(
//           fontSize: 13.sp,
//           color: const Color(0xFFFCC346),
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//     );
//   }

//   Widget _buildExpanded() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Divider(height: 32.h, thickness: 1, color: Colors.grey[300]),

//         // Full Description
//         Text(
//           fullDescription,
//           style: TextStyle(
//             fontSize: 15.sp,
//             color: Colors.black87,
//             height: 1.6,
//           ),
//         ),

//         SizedBox(height: 24.h),

//         // All Tech Stack
//         if (techStack.length > (isFeatured ? 6 : 4))
//           Wrap(
//             spacing: 8.w,
//             runSpacing: 8.h,
//             children: techStack.skip(isFeatured ? 6 : 4).map((tech) {
//               return Container(
//                 padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Text(
//                   tech,
//                   style: TextStyle(
//                     fontSize: 12.sp,
//                     color: Colors.black87,
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),

//         SizedBox(height: 24.h),

//         // Screenshots Gallery
//         if (screenshots.isNotEmpty) ...[
//           Text(
//             'Screenshots',
//             style: TextStyle(
//               fontSize: 16.sp,
//               fontWeight: FontWeight.bold,
//               color: Colors.black87,
//             ),
//           ),
//           SizedBox(height: 12.h),
//           SizedBox(
//             height: 200.h,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: screenshots.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: EdgeInsets.only(right: 12.w),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.asset(
//                       screenshots[index],
//                       height: 200.h,
//                       fit: BoxFit.cover,
//                       cacheHeight: (200 * MediaQuery.of(context).devicePixelRatio).round(),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           SizedBox(height: 24.h),
//         ],

//         // Action Buttons
//         Wrap(
//           spacing: 12.w,
//           runSpacing: 12.h,
//           children: [
//             if (githubUrl != null)
//               ElevatedButton.icon(
//                 onPressed: () => _launchUrl(githubUrl!),
//                 icon: const Icon(Icons.code, size: 20),
//                 label: const Text('GitHub'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.black87,
//                   foregroundColor: Colors.white,
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 20.w,
//                     vertical: 12.h,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ),
//             if (liveUrl != null)
//               OutlinedButton.icon(
//                 onPressed: () => _launchUrl(liveUrl!),
//                 icon: const Icon(Icons.open_in_new, size: 20),
//                 label: const Text('Live Demo'),
//                 style: OutlinedButton.styleFrom(
//                   foregroundColor: Colors.black87,
//                   side: const BorderSide(color: Colors.black87, width: 2),
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 20.w,
//                     vertical: 12.h,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// // Example usage in your homescreen:
// /*
// // FEATURED PROJECTS (Big cards)
// ExpandableProjectCard(
//   isFeatured: true,
//   title: 'Play Baloot',
//   shortDescription: 'A card game app built with Flutter',
//   fullDescription: 'Play Baloot is a complete card game application featuring real-time multiplayer, custom animations, and beautiful UI. Built with Flutter and Firebase for seamless cross-platform experience.',
//   techStack: ['Flutter', 'Firebase', 'Provider', 'WebSocket', 'Custom Animations'],
//   thumbnailImage: 'assets/images/baloot_thumb.png',
//   screenshots: [
//     'assets/images/baloot_1.png',
//     'assets/images/baloot_2.png',
//     'assets/images/baloot_3.png',
//   ],
//   githubUrl: 'https://github.com/yourusername/play-baloot',
//   liveUrl: 'https://play-baloot.netlify.app',
// ),

// // REGULAR PROJECTS (Smaller cards)
// ExpandableProjectCard(
//   isFeatured: false,
//   title: 'Ashwat Counter',
//   shortDescription: 'Counter app with state management',
//   fullDescription: 'A simple yet elegant counter application showcasing state management patterns in Flutter.',
//   techStack: ['Flutter', 'Riverpod'],
//   thumbnailImage: 'assets/images/counter_thumb.png',
//   githubUrl: 'https://github.com/yourusername/ashwat-counter',
// ),
// */
