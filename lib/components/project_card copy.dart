// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:personal_portfolio/components/tech_skills.dart';

// class ProjectCard extends StatefulWidget {
//   const ProjectCard({super.key});

//   @override
//   State<ProjectCard> createState() => _ProjectCardState();
// }

// class _ProjectCardState extends State<ProjectCard> {
//   bool isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => isHovered = true),
//       onExit: (_) => setState(() => isHovered = false),
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
//         elevation: isHovered ? 12 : 4,
//         child: ExpansionTile(
//           title: Text(
//             'E-Commerce Platform',
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           subtitle: Text(
//             isHovered ? '' : 'A personal project using Figma UI design',
//           ),
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'A fully responsive e-commerce platform with modern UI/UX design principles...',
//                   ),
//                   SizedBox(height: 12),
//                   TechSkills(
//                     skills: [
//                       'React',
//                       'TypeScript',
//                       'Tailwind CSS',
//                       'Node.js',
//                       'MongoDB',
//                       'Stripe API',
//                     ],
//                   ),
//                   SizedBox(height: 12),
//                   CarouselSlider(
//                     options: CarouselOptions(height: 180),
//                     items: ['assets/image1.jpg', 'assets/image2.jpg']
//                         .map(
//                           (path) => ClipRRect(
//                             borderRadius: BorderRadius.circular(20),
//                             child: Image.asset(path, fit: BoxFit.cover),
//                           ),
//                         )
//                         .toList(),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
