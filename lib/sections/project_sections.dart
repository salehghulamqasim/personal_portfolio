//this is a project sections file WHICH is a collection of different project sections s
// its a reusable section to be used in hoemscreen page

import 'package:flutter/material.dart';
import 'package:personal_portfolio/components/project_card.dart';
import 'package:personal_portfolio/components/skeleton.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Play Baloot
        EasySkeleton(
          child: ProjectCard(
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
              'assets/project_images/playbaloot_images/homescreen.png',
              'assets/project_images/playbaloot_images/introscreen.png',
              'assets/project_images/playbaloot_images/joinscreen.png',
              'assets/project_images/playbaloot_images/LoGoBaloot.png',
              'assets/project_images/playbaloot_images/LogoDark.jpg',
              'assets/project_images/playbaloot_images/Screenshot_20250913-195857.png',
              'assets/project_images/playbaloot_images/Screenshot_20250913-195935.png',
              'assets/project_images/playbaloot_images/Screenshot_20250913-195950.png',
              'assets/project_images/playbaloot_images/Screenshot_20250913-200004.png',
              'assets/project_images/playbaloot_images/Screenshot_20250913-200102.png',
            ],
            mainImage: 'assets/project_images/mainImage/baloot.png',
            imageOnRight: false,
          ),
        ),

        // Beauty App
        EasySkeleton(
          child: ProjectCard(
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
              'assets/project_images/beauty/Screenshot From 2025-02-18 22-19-41.png',
              'assets/project_images/beauty/Screenshot From 2025-02-18 22-20-03.png',
              'assets/project_images/beauty/Screenshot From 2025-02-18 22-20-23.png',
              'assets/project_images/beauty/Screenshot From 2025-02-18 22-42-40.png',
              'assets/project_images/beauty/Screenshot From 2025-02-18 22-46-36.png',
            ],
            mainImage: 'assets/project_images/mainImage/beauty.png',
            imageOnRight: true,
          ),
        ),

        // Wavy Design
        EasySkeleton(
          child: ProjectCard(
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
              'assets/project_images/wavy/2.png',
              'assets/project_images/wavy/Screenshot From 2025-02-18 23-14-38.png',
              'assets/project_images/wavy/Screenshot From 2025-02-18 23-14-47.png',
              'assets/project_images/wavy/Screenshot From 2025-02-18 23-14-53.png',
              'assets/project_images/wavy/Screenshot From 2025-02-18 23-15-11.png',
            ],
            mainImage: 'assets/project_images/mainImage/wavvy.png',
            imageOnRight: false,
          ),
        ),

        // Green Project
        EasySkeleton(
          child: ProjectCard(
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
              'assets/project_images/greenproject/Screenshot From 2025-02-18 22-50-20.png',
              'assets/project_images/greenproject/Screenshot From 2025-02-18 22-50-20 (1).png',
              'assets/project_images/greenproject/Screenshot From 2025-02-18 22-50-20 (2).png',
              'assets/project_images/greenproject/Screenshot From 2025-02-18 22-50-36.png',
              'assets/project_images/greenproject/Screenshot From 2025-02-18 22-50-36 (1).png',
              'assets/project_images/greenproject/Screenshot From 2025-02-18 22-51-15.png',
              'assets/project_images/greenproject/Screenshot From 2025-02-18 22-51-51.png',
              'assets/project_images/greenproject/Screenshot From 2025-02-18 22-52-16.png',
            ],
            mainImage: 'assets/project_images/mainImage/green.png',
            imageOnRight: true,
          ),
        ),

        // Ashwat App
        EasySkeleton(
          child: ProjectCard(
            title: 'Ashwat App',
            description:
                //app counts ashwat of u when u r doing tawwaf in mecca
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
              'assets/project_images/Ashwate/5796241533882273040.jpg',
              'assets/project_images/Ashwate/5796241533882273041.jpg',
              'assets/project_images/Ashwate/5796241533882273043.jpg',
              'assets/project_images/Ashwate/5796241533882273044.jpg',
              'assets/project_images/Ashwate/5796241533882273041.jpg',
            ],
            mainImage: 'assets/project_images/mainImage/ashwat.png',
            imageOnRight: false,
          ),
        ),

        // Viva App
        EasySkeleton(
          child: ProjectCard(
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
              'assets/project_images/viva/Screenshot From 2025-02-18 21-36-12.png',
              'assets/project_images/viva/Screenshot From 2025-02-18 21-36-26.png',
              'assets/project_images/viva/Screenshot From 2025-02-18 21-36-43.png',
              'assets/project_images/viva/Screenshot From 2025-02-18 21-36-56.png',
              'assets/project_images/viva/Screenshot From 2025-02-18 21-39-04.png',
              'assets/project_images/viva/Screenshot From 2025-02-18 21-39-20.png',
              'assets/project_images/viva/Screenshot From 2025-02-18 21-39-20 (1).png',
              'assets/project_images/viva/Screenshot From 2025-02-18 21-39-35.png',
              'assets/project_images/viva/Screenshot From 2025-02-18 21-39-35 (1).png',
              'assets/project_images/viva/Screenshot From 2025-02-18 21-43-05.png',
            ],
            mainImage: 'assets/project_images/mainImage/viva.png',
            imageOnRight: true,
          ),
        ),
      ],
    );
  }
}
