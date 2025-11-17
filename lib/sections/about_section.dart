// import 'package:flutter/material.dart';

// /// Senior Flutter Developer Implementation
// /// About Me Section with Languages and Education Cards
// /// 
// /// Design Specifications:
// /// - Primary Yellow: #FDC435
// /// - Dark Text: #25282B
// /// - Gray Text: #828282
// /// - Background: #F9FAFF
// /// - Card Background: White (#FFFFFF)
// /// - Border Radius: 24px
// /// - Shadow: 0px 6px 64px rgba(112, 144, 176, 0.1)

// class AboutMeSection extends StatelessWidget {
//   const AboutMeSection({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final isDesktop = MediaQuery.of(context).size.width >= 1024;
//     final isTablet = MediaQuery.of(context).size.width >= 768;

//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(
//         horizontal: 16,
//         vertical: isDesktop ? 80 : (isTablet ? 60 : 48),
//       ),
//       child: Column(
//         children: [
//           // Section Title
//           _SectionTitle(),
//           SizedBox(height: 32), // Standardized height after SectionTitle
          
//           // Cards Container
//           ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: 992),
//             child: isDesktop
//                 ? Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(child: LanguagesCard()),
//                       const SizedBox(width: 24),
//                       Expanded(child: EducationCard()),
//                     ],
//                   )
//                 : Column(
//                     children: [
//                       LanguagesCard(),
//                       const SizedBox(height: 20),
//                       EducationCard(),
//                     ],
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _SectionTitle extends StatefulWidget {
//   @override
//   State<_SectionTitle> createState() => _SectionTitleState();
// }

// class _SectionTitleState extends State<_SectionTitle>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 800),
//       vsync: this,
//     );
//     _animation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeOut),
//     );
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isMobile = MediaQuery.of(context).size.width < 768;

//     return Column(
//       children: [
//         Text(
//           'About Me',
//           style: TextStyle(
//             fontFamily: 'Playfair Display',
//             fontSize: isMobile ? 36 : 48,
//             fontWeight: FontWeight.w700, // Bold
//             color: const Color(0xFF25282B),
//             height: 1.5,
//           ),
//         ),
//         const SizedBox(height: 4),
//         AnimatedBuilder(
//           animation: _animation,
//           builder: (context, child) {
//             return Container(
//               width: 100 * _animation.value,
//               height: 4,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFFDC435),
//                 borderRadius: BorderRadius.circular(2),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

// class LanguagesCard extends StatefulWidget {
//   const LanguagesCard({Key? key}) : super(key: key);

//   @override
//   State<LanguagesCard> createState() => _LanguagesCardState();
// }

// class _LanguagesCardState extends State<LanguagesCard>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;
//   bool _isHovered = false;

//   final List<String> languages = ['English', 'Arabic', 'Urdu'];

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _scaleAnimation = Tween<double>(begin: 0.95, end: 1).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeOut),
//     );
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isMobile = MediaQuery.of(context).size.width < 768;

//     return ScaleTransition(
//       scale: _scaleAnimation,
//       child: MouseRegion(
//         onEnter: (_) => setState(() => _isHovered = true),
//         onExit: (_) => setState(() => _isHovered = false),
//         child: AnimatedScale(
//           scale: _isHovered ? 1.02 : 1.0,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeOut,
//           child: Container(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(
//                 minHeight: isMobile ? 150.h : 200.h, // Ensure minimum height for mobile
//                 maxHeight: double.infinity, // Allow expansion based on content
//               ),
//             ),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(24),
//               boxShadow: [
//                 BoxShadow(
//                   color: const Color(0xFF7090B0).withOpacity(0.1),
//                   offset: const Offset(0, 6),
//                   blurRadius: 64,
//                   spreadRadius: 0,
//                 ),
//               ],
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(24),
//               child: Stack(
//                 children: [
//                   // Yellow Accent Corner (Top Right)
//                   Positioned(
//                     top: -32,
//                     right: -32,
//                     child: TweenAnimationBuilder<double>(
//                       tween: Tween(begin: 0, end: 1),
//                       duration: const Duration(milliseconds: 500),
//                       curve: Curves.easeOut,
//                       builder: (context, value, child) {
//                         return Transform.scale(
//                           scale: value,
//                           child: Container(
//                             width: isMobile ? 96 : 128,
//                             height: isMobile ? 96 : 128,
//                             decoration: const BoxDecoration(
//                               color: Color(0xFFFDC435),
//                               borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(100),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
                  
//                   // Content
//                   Padding(
//                     padding: EdgeInsets.all(isMobile ? 32 : 48),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Icon
//                         TweenAnimationBuilder<double>(
//                           tween: Tween(begin: 0, end: 1),
//                           duration: const Duration(milliseconds: 400),
//                           curve: Curves.easeOut,
//                           builder: (context, value, child) {
//                             return Opacity(
//                               opacity: value,
//                               child: Icon(
//                                 Icons.language,
//                                 size: isMobile ? 40 : 48,
//                                 color: const Color(0xFFFDC435),
//                               ),
//                             );
//                           },
//                         ),
//                         SizedBox(height: isMobile ? 24 : 24),
                        
//                         // Title
//                         TweenAnimationBuilder<double>(
//                           tween: Tween(begin: 0, end: 1),
//                           duration: const Duration(milliseconds: 400),
//                           curve: Curves.easeOut,
//                           builder: (context, value, child) {
//                             return Opacity(
//                               opacity: value,
//                               child: Text(
//                                 'Languages',
//                                 style: TextStyle(
//                                   fontFamily: 'Playfair Display',
//                                   fontSize: isMobile ? 28 : 36,
//                                   fontWeight: FontWeight.w700, // Bold
//                                   color: const Color(0xFF25282B),
//                                   height: 1.2,
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                         SizedBox(height: isMobile ? 24 : 32),
                        
//                         // Language Pills
//                         Wrap(
//                           spacing: 12,
//                           runSpacing: 12,
//                           children: languages.asMap().entries.map((entry) {
//                             return _LanguagePill(
//                               text: entry.value,
//                               delay: 600 + (entry.key * 100),
//                             );
//                           }).toList(),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _LanguagePill extends StatefulWidget {
//   final String text;
//   final int delay;

//   const _LanguagePill({
//     required this.text,
//     required this.delay,
//   });

//   @override
//   State<_LanguagePill> createState() => _LanguagePillState();
// }

// class _LanguagePillState extends State<_LanguagePill> {
//   bool _isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     final isMobile = MediaQuery.of(context).size.width < 768;

//     return TweenAnimationBuilder<double>(
//       tween: Tween(begin: 0, end: 1),
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeOut,
//       builder: (context, value, child) {
//         return Transform.scale(
//           scale: 0.8 + (0.2 * value),
//           child: Opacity(
//             opacity: value,
//             child: MouseRegion(
//               onEnter: (_) => setState(() => _isHovered = true),
//               onExit: (_) => setState(() => _isHovered = false),
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 200),
//                 curve: Curves.easeOut,
//                 transform: Matrix4.identity()
//                   ..translate(0.0, _isHovered ? -4.0 : 0.0),
//                 padding: EdgeInsets.symmetric(
//                   horizontal: isMobile ? 20 : 24,
//                   vertical: isMobile ? 8 : 12,
//                 ),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFFDC435),
//                   borderRadius: BorderRadius.circular(100),
//                 ),
//                 child: Text(
//                   widget.text,
//                   style: TextStyle(
//                     fontFamily: 'Nunito',
//                     fontSize: isMobile ? 16 : 18,
//                     fontWeight: FontWeight.w700, // Bold
//                     color: const Color(0xFF25282B),
//                     height: 1.5,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class EducationCard extends StatefulWidget {
//   const EducationCard({Key? key}) : super(key: key);

//   @override
//   State<EducationCard> createState() => _EducationCardState();
// }

// class _EducationCardState extends State<EducationCard>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;
//   bool _isHovered = false;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _scaleAnimation = Tween<double>(begin: 0.95, end: 1).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeOut),
//     );
//     // Delay start for staggered effect
//     Future.delayed(const Duration(milliseconds: 150), () {
//       if (mounted) _controller.forward();
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isMobile = MediaQuery.of(context).size.width < 768;

//     return ScaleTransition(
//       scale: _scaleAnimation,
//       child: MouseRegion(
//         onEnter: (_) => setState(() => _isHovered = true),
//         onExit: (_) => setState(() => _isHovered = false),
//         child: AnimatedScale(
//           scale: _isHovered ? 1.02 : 1.0,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeOut,
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(24),
//               boxShadow: [
//                 BoxShadow(
//                   color: const Color(0xFF7090B0).withOpacity(0.1),
//                   offset: const Offset(0, 6),
//                   blurRadius: 64,
//                   spreadRadius: 0,
//                 ),
//               ],
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(24),
//               child: Stack(
//                 children: [
//                   // Yellow Accent Corner (Top Left)
//                   Positioned(
//                     top: -32,
//                     left: -32,
//                     child: TweenAnimationBuilder<double>(
//                       tween: Tween(begin: 0, end: 1),
//                       duration: const Duration(milliseconds: 500),
//                       curve: Curves.easeOut,
//                       builder: (context, value, child) {
//                         return Transform.scale(
//                           scale: value,
//                           child: Container(
//                             width: isMobile ? 96 : 128,
//                             height: isMobile ? 96 : 128,
//                             decoration: const BoxDecoration(
//                               color: Color(0xFFFDC435),
//                               borderRadius: BorderRadius.only(
//                                 bottomRight: Radius.circular(100),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
                  
//                   // Content
//                   Padding(
//                     padding: EdgeInsets.all(isMobile ? 32 : 48),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Icon
//                         TweenAnimationBuilder<double>(
//                           tween: Tween(begin: 0, end: 1),
//                           duration: const Duration(milliseconds: 400),
//                           curve: Curves.easeOut,
//                           builder: (context, value, child) {
//                             return Opacity(
//                               opacity: value,
//                               child: Icon(
//                                 Icons.school,
//                                 size: isMobile ? 40 : 48,
//                                 color: const Color(0xFFFDC435),
//                               ),
//                             );
//                           },
//                         ),
//                         SizedBox(height: isMobile ? 24 : 24),
                        
//                         // Title
//                         TweenAnimationBuilder<double>(
//                           tween: Tween(begin: 0, end: 1),
//                           duration: const Duration(milliseconds: 400),
//                           curve: Curves.easeOut,
//                           builder: (context, value, child) {
//                             return Opacity(
//                               opacity: value,
//                               child: Text(
//                                 'Education',
//                                 style: TextStyle(
//                                   fontFamily: 'Playfair Display',
//                                   fontSize: isMobile ? 28 : 36,
//                                   fontWeight: FontWeight.w700, // Bold
//                                   color: const Color(0xFF25282B),
//                                   height: 1.2,
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                         SizedBox(height: isMobile ? 12 : 16),
                        
//                         // Degree
//                         TweenAnimationBuilder<double>(
//                           tween: Tween(begin: 0, end: 1),
//                           duration: const Duration(milliseconds: 400),
//                           curve: Curves.easeOut,
//                           builder: (context, value, child) {
//                             return Opacity(
//                               opacity: value,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Bachelors in Computer Science',
//                                     style: TextStyle(
//                                       fontFamily: 'Nunito',
//                                       fontSize: isMobile ? 20 : 24,
//                                       fontWeight: FontWeight.w700, // Bold
//                                       color: const Color(0xFF25282B),
//                                       height: 1.5,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 8),
//                                   // Animated Gradient Line
//                                   TweenAnimationBuilder<double>(
//                                     tween: Tween(begin: 0, end: 1),
//                                     duration: const Duration(milliseconds: 600),
//                                     curve: Curves.easeOut,
//                                     builder: (context, lineValue, child) {
//                                       return Container(
//                                         height: 4,
//                                         width: double.infinity,
//                                         decoration: BoxDecoration(
//                                           gradient: LinearGradient(
//                                             colors: const [
//                                               Color(0xFFFDC435),
//                                               Colors.transparent,
//                                             ],
//                                             stops: [lineValue, lineValue],
//                                           ),
//                                           borderRadius: BorderRadius.circular(2),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     }
// }

// /// USAGE EXAMPLE:
// /// 
// /// ```dart
// /// class MyApp extends StatelessWidget {
// ///   @override
// ///   Widget build(BuildContext context) {
// ///     return MaterialApp(
// ///       home: Scaffold(
// ///         backgroundColor: const Color(0xFFF9FAFF),
// ///         body: SingleChildScrollView(
// ///           child: AboutMeSection(),
// ///         ),
// ///       ),
// ///     );
// ///   }
// /// }
// /// ```

// /// REQUIRED FONTS IN pubspec.yaml:
// /// 
// /// ```yaml
// /// flutter:
// ///   fonts:
// ///     - family: Playfair Display
// ///       fonts:
// ///         - asset: fonts/PlayfairDisplay-Bold.ttf
// ///           weight: 700
// ///     - family: Nunito
// ///       fonts:
// ///         - asset: fonts/Nunito-Bold.ttf
// ///           weight: 700
// /// ```

// /// DESIGN SPECIFICATIONS SUMMARY:
// /// 
// /// COLORS:
// /// - Primary Yellow: #FDC435 (Color(0xFFFDC435))
// /// - Dark Text: #25282B (Color(0xFF25282B))
// /// - Gray Text: #828282 (Color(0xFF828282))
// /// - Background: #F9FAFF (Color(0xFFF9FAFF))
// /// - Card Background: White (#FFFFFF)
// /// 
// /// TYPOGRAPHY:
// /// - Section Title: Playfair Display Bold, 48px (mobile: 36px)
// /// - Card Title: Playfair Display Bold, 36px (mobile: 28px)
// /// - Language Pills: Nunito Bold, 18px (mobile: 16px)
// /// - Degree Text: Nunito Bold, 24px (mobile: 20px)
// /// 
// /// SPACING:
// /// - Section Padding: 80px vertical (tablet: 60px, mobile: 48px), 16px horizontal
// /// - Card Padding: 48px (mobile: 32px)
// /// - Gap between cards: 24px (mobile: 20px)
// /// - Gap between title and underline: 4px
// /// - Icon to title gap: 24px
// /// - Title to content gap: 32px (mobile: 24px)
// /// - Language pills spacing: 12px
// /// - Degree to line gap: 8px
// /// 
// /// SIZING:
// /// - Max container width: 992px
// /// - Border radius (cards): 24px
// /// - Border radius (pills): 100px (fully rounded)
// /// - Border radius (accent corners): 100px
// /// - Title underline: 100px wide, 4px tall
// /// - Gradient line: 4px tall
// /// - Icon size: 48px (mobile: 40px)
// /// - Yellow corner: 128px (mobile: 96px)
// /// - Yellow corner offset: -32px
// /// 
// /// SHADOWS:
// /// - Card shadow: 0px 6px 64px rgba(112, 144, 176, 0.1)
// /// 
// /// ANIMATIONS:
// /// - Card entrance: Scale from 0.95 to 1.0, duration 500ms
// /// - Hover scale: 1.0 to 1.02, duration 300ms
// /// - Title underline: Width from 0 to 100, duration 800ms
// /// - Yellow corners: Scale from 0 to 1, duration 500ms
// /// - Language pills: Scale from 0.8 to 1.0, staggered 100ms delay
// /// - Pill hover: Translate Y by -4px, duration 200ms
// /// - Gradient line: Width from 0 to 100%, duration 600ms
// /// - Opacity fades: 0 to 1, duration 400ms
// /// 
// /// BREAKPOINTS:
// /// - Desktop: >= 1024px (2 columns)
// /// - Tablet: >= 768px (2 columns)
// /// - Mobile: < 768px (1 column, stacked)
