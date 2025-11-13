//this is a project sections file WHICH is a collection of different project sections s
// its a reusable section to be used in hoemscreen page

import 'package:flutter/material.dart';
import 'package:personal_portfolio/components/project_card.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Play Baloot
        ProjectCard(
          title: 'Play Baloot',
          description:
              'A traditional card game application with modern UI design and multiplayer functionality.',
          expandedDescription:
              'Play Baloot is a digital recreation of the popular Middle Eastern card game Baloot. The application features an intuitive user interface, smooth gameplay mechanics, and engaging visual design. With multiple screens for game setup, gameplay, and scoring, this project demonstrates expertise in game development, UI/UX design, and mobile app architecture. The app includes features like player management, game statistics, and an immersive gaming experience.',
          keyFeatures: [
            'Traditional Baloot card game mechanics',
            'Multiplayer functionality and room creation',
            'Player management and game statistics',
            'Intuitive game interface and controls',
            'Score tracking and match history',
            'Engaging visual design and animations',
          ],
          technologies: [
            'Flutter',
            'Dart',
            'Firebase',
            'UI/UX Design',
            'Figma',
          ],
          imagePaths: [
            'assets/project_images/playbaloot_images/10.webp',
            'assets/project_images/playbaloot_images/20.webp',
            'assets/project_images/playbaloot_images/30.webp',
            'assets/project_images/playbaloot_images/40.webp',
            'assets/project_images/playbaloot_images/50.webp',
            'assets/project_images/playbaloot_images/60.webp',
            'assets/project_images/playbaloot_images/70.webp',
            'assets/project_images/playbaloot_images/80.webp',
          ],
          mainImage: 'assets/project_images/mainImage/playbaloot.webp',
          imageOnRight: false,
        ),

        // Beauty App
        ProjectCard(
          title: 'Beauty App',
          description:
              'A comprehensive beauty and skincare application with elegant UI design and smooth user experience.',
          expandedDescription:
              'Beauty App is a modern mobile application designed for beauty enthusiasts and skincare lovers. The app features a clean, intuitive interface with carefully crafted screens for product browsing, skincare routines, and beauty tips. Built with Flutter, it showcases responsive design principles and smooth animations to enhance user engagement.',
          keyFeatures: [
            'Elegant UI design with a focus on user experience',
            'Multiple screens for product browsing and skincare routines',
            'Smooth animations and transitions',
            'Responsive layout for various device sizes',
          ],
          technologies: [
            'HTML',
            'CSS',
            'JavaScript',
            'PHP',
            'SQL',
            'PhpMyAdmin',
          ],
          imagePaths: [
            'assets/project_images/beauty/Screenshot From 2025-02-18 22-19-41_webP.webp',
            'assets/project_images/beauty/Screenshot From 2025-02-18 22-20-03_webP.webp',
            'assets/project_images/beauty/Screenshot From 2025-02-18 22-20-23_webP.webp',
            'assets/project_images/beauty/Screenshot From 2025-02-18 22-42-40_webP.webp',
            'assets/project_images/beauty/Screenshot From 2025-02-18 22-46-36_webP.webp',
          ],
          mainImage: 'assets/project_images/mainImage/beauty.webp',
          imageOnRight: true,
        ),

        // Wavy Design
        ProjectCard(
          title: 'Wavy Design',
          description:
              'A creative design project featuring fluid wave patterns and modern visual aesthetics.',
          expandedDescription:
              'Wavy Design is an innovative project that explores fluid design patterns and modern visual aesthetics. This project showcases expertise in creating dynamic, wave-inspired user interfaces that provide a unique and engaging user experience. The design emphasizes smooth curves, flowing animations, and contemporary styling principles to create visually appealing and functionally effective interfaces.',
          keyFeatures: [
            'Fluid wave patterns and dynamic designs',
            'Modern visual aesthetics and styling',
            'Smooth curves and flowing animations',
            'Contemporary design principles',
            'Unique and engaging user experience',
            'Creative interface exploration',
          ],
          technologies: ['Flutter', 'Figma', 'Rive', 'Dart'],
          imagePaths: [
            'assets/project_images/wavy/1_webP.webp',
            'assets/project_images/wavy/2_webP.webp',
            'assets/project_images/wavy/3_webP.webp',
            'assets/project_images/wavy/4_webP.webp',
          ],
          mainImage: 'assets/project_images/mainImage/wavvy.webp',
          imageOnRight: false,
        ),

        // Green Project
        ProjectCard(
          title: 'Green Project',
          description:
              'An eco-friendly application focused on sustainability and environmental awareness.',
          expandedDescription:
              'Green Project is an innovative mobile application dedicated to promoting environmental consciousness and sustainable living. The app features multiple screens showcasing eco-friendly practices, green initiatives, and environmental tracking tools. With its clean design and intuitive navigation, users can easily access resources for reducing their carbon footprint and contributing to a greener planet.',
          keyFeatures: [
            'Environmental impact tracking and monitoring',
            'Green initiatives and eco-friendly tips',
            'Carbon footprint calculator',
            'Sustainable living resources and guides',
            'Clean and intuitive user interface',
          ],
          technologies: ['HTML', 'CSS', 'BootStrap'],
          imagePaths: [
            'assets/project_images/greenproject/Screenshot From 2025-02-18 22-50-20_webP.webp',
            'assets/project_images/greenproject/Screenshot From 2025-02-18 22-50-36_webP.webp',
            'assets/project_images/greenproject/Screenshot From 2025-02-18 22-51-15_webP.webp',
            'assets/project_images/greenproject/Screenshot From 2025-02-18 22-51-51_webP.webp',
          ],
          mainImage: 'assets/project_images/mainImage/green.webp',
          imageOnRight: true,
        ),

        // Ashwat App
        ProjectCard(
          title: 'Ashwat App',
          description:
              'Ashwat app to count tawaf counts for you while you perform tawwaf in Mecca.',
          expandedDescription:
              'Ashwat App is a comprehensive lifestyle application designed to enhance daily life through smart features and intuitive design. The app showcases modern mobile development techniques with multiple interconnected screens, smooth transitions, and user-friendly navigation. Built with attention to detail, Ashwat demonstrates expertise in creating engaging mobile experiences that prioritize both functionality and aesthetic appeal.',
          keyFeatures: [
            'Comprehensive lifestyle management tools',
            'Modern mobile development techniques',
            'Multiple interconnected screens',
            'Smooth transitions and animations',
            'User-friendly navigation system',
            'Dynamic features for daily life enhancement',
          ],
          technologies: ['Flutter', 'Dart', 'Vibe Coding'],
          imagePaths: [
            'assets/project_images/Ashwate/1_webP.webp',
            'assets/project_images/Ashwate/2_webP.webp',
            'assets/project_images/Ashwate/3_webP.webp',
            'assets/project_images/Ashwate/4_webP.webp',
          ],
          mainImage: 'assets/project_images/mainImage/ashwat.webp',
          imageOnRight: false,
        ),

        // Viva App
        ProjectCard(
          title: 'Viva App',
          description:
              'A vibrant lifestyle application with dynamic features and engaging user interface.',
          expandedDescription:
              'Viva App is a comprehensive lifestyle application designed to enhance daily life through smart features and intuitive design. The app showcases modern mobile development techniques with multiple interconnected screens, smooth transitions, and user-friendly navigation. Built with attention to detail, Viva demonstrates expertise in creating engaging mobile experiences that prioritize both functionality and aesthetic appeal.',
          keyFeatures: [
            'Comprehensive lifestyle management tools',
            'Modern mobile development techniques',
            'Multiple interconnected screens',
            'Smooth transitions and animations',
            'User-friendly navigation system',
            'Dynamic features for daily life enhancement',
          ],
          technologies: ['HTML', 'CSS', 'BootStrap'],
          imagePaths: [
            'assets/project_images/viva/Screenshot From 2025-02-18 21-36-12_webP.webp',
            'assets/project_images/viva/Screenshot From 2025-02-18 21-36-26_webP.webp',
            'assets/project_images/viva/Screenshot From 2025-02-18 21-36-43_webP.webp',
            'assets/project_images/viva/Screenshot From 2025-02-18 21-36-56_webP.webp',
          ],
          mainImage: 'assets/project_images/mainImage/viva.webp',
          imageOnRight: true,
        ),
      ],
    );
  }
}
