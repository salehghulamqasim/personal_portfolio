//this is a project sections file WHICH is a collection of different project sections s
// its a reusable section to be used in hoemscreen page

import 'package:flutter/material.dart';
import 'package:personal_portfolio/components/project_card.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
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
            githubUrl: 'https://github.com/salehghulamqasim/Play-Baloot.git',
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
              'assets/project_images/beauty/Screenshot From 2025-02-18 22-19-41_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-beauty-.webp',
              'assets/project_images/beauty/Screenshot From 2025-02-18 22-20-03_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-beauty-.webp',
              'assets/project_images/beauty/Screenshot From 2025-02-18 22-20-23_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-beauty-.webp',
              'assets/project_images/beauty/Screenshot From 2025-02-18 22-42-40_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-beauty-.webp',
              'assets/project_images/beauty/Screenshot From 2025-02-18 22-46-36_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-beauty-.webp',
            ],
            mainImage: 'assets/project_images/mainImage/beauty.webp',
            imageOnRight: true,
            githubUrl: "https://github.com/salehghulamqasim/myhealthhub.git",
            liveUrl:
                "https://drive.google.com/file/d/1JoloGVjKC78pHSCnYLhHop44ib0vguCr/view",
            liveButtonText: "Video",
          ),

          // Wavy Design
          ProjectCard(
            title: 'Wavy - Salon Booking App',
            description:
                'A comprehensive Flutter mobile application for salon bookings and beauty services with Arabic language support.',
            expandedDescription:
                'Wavy is a full-featured Flutter application designed for salon bookings and beauty services. The app features a complete user journey from onboarding to booking confirmation, with special attention to the Middle Eastern market through Arabic language localization. The application includes user authentication, salon discovery, community features for reviews and ratings, and a seamless booking system. Built with Flutter and Dart, it demonstrates modern mobile app development practices with clean architecture and responsive design.',
            keyFeatures: [
              'Arabic language localization and RTL support',
              'User authentication with OTP verification',
              'Salon discovery and booking system',
              'Community features with reviews and ratings',
              'Real-time notifications and messaging',
              'Clean architecture with Flutter Bloc pattern',
              'Responsive UI for all mobile devices',
              "PHP backend with MySQL database",
              "Admin panel for salon management",
            ],
            technologies: ['Flutter', 'Figma', 'Rive', 'Dart'],
            imagePaths: [
              'assets/project_images/wavy/1_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-wavy-.webp',
              'assets/project_images/wavy/2_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-wavy-.webp',
              'assets/project_images/wavy/3_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-wavy-.webp',
              'assets/project_images/wavy/4_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-wavy-.webp',
            ],
            mainImage: 'assets/project_images/mainImage/wavvy.webp',
            imageOnRight: false,
            githubUrl: "https://github.com/salehghulamqasim/Wavvy.git",
          ),
          // Viva App
          ProjectCard(
            title: 'VivaDecor - Luxury Interior Design Website',
            description:
                'An elegant and modern website for a luxury interior design company showcasing premium design services.',
            expandedDescription:
                'VivaDecor is a sophisticated website for a high-end interior design company, featuring a clean and luxurious design that reflects their premium brand identity. The website effectively showcases their interior design services, client testimonials, and company portfolio with a focus on user experience and visual appeal. Built with modern web technologies, it demonstrates professional presentation of design services with clear call-to-actions and engaging content layout.',
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
              'assets/project_images/viva/1viva.webp',
              'assets/project_images/viva/2viva.webp',
              'assets/project_images/viva/3viva.webp',
              'assets/project_images/viva/4viva.webp',
              'assets/project_images/viva/5viva.webp',
            ],
            mainImage: 'assets/project_images/mainImage/viva.webp',
            imageOnRight: true,
            githubUrl:
                "https://github.com/salehghulamqasim/VivaDecore--LandingPage.git",
            liveUrl:
                "https://salehghulamqasim.github.io/VivaDecore--LandingPage/",
          ),
          // Green
          ProjectCard(
            title: 'Solar Project Landing Page',
            description:
                'A visually appealing landing page showcasing modern UI design principles with an eco-friendly solar energy theme.',
            expandedDescription:
                'This project demonstrates my front-end development skills through a beautifully designed solar energy landing page. Built with pure HTML and CSS, it features a clean, modern interface with eco-friendly aesthetics. The design includes responsive layouts, intuitive navigation, and visually engaging sections that effectively communicate the solar energy concept. This project highlights my ability to create professional-looking websites with attention to typography, color schemes, and user experience.',
            keyFeatures: [
              'Modern and clean UI design with eco-friendly aesthetics',
              'Fully responsive layout for all screen sizes',
              'Professional typography and color scheme',
              'Interactive navigation and call-to-action elements',
              'Well-structured content sections with visual hierarchy',
              'Optimized images and efficient CSS styling',
            ],
            technologies: ['HTML', 'CSS', 'BootStrap'],
            imagePaths: [
              'assets/project_images/greenproject/1green.webp',
              'assets/project_images/greenproject/2green.webp',
              'assets/project_images/greenproject/3green.webp',
              'assets/project_images/greenproject/4green.webp',
              'assets/project_images/greenproject/5green.webp',
              'assets/project_images/greenproject/6green.webp',
            ],
            mainImage: 'assets/project_images/mainImage/green.webp',
            imageOnRight: true,
            githubUrl:
                "https://github.com/salehghulamqasim/Task1-SolarEnergyLandingPage.git",
            liveUrl:
                "https://salehghulamqasim.github.io/SolarEnergyLandingPage/",
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
              'assets/project_images/Ashwate/1ashwat.webp',
              'assets/project_images/Ashwate/2ashwat.webp',
              'assets/project_images/Ashwate/3ashwat.webp',
              'assets/project_images/Ashwate/4ashwat.webp',
            ],
            mainImage: 'assets/project_images/mainImage/ashwat.webp',
            imageOnRight: false,
            githubUrl: 'https://github.com/salehghulamqasim/Ashwat4Android.git',
          ),

          // CleanJeddah Volunteer Hub
          ProjectCard(
            title: 'PlasticLess Planet App',
            description:
                'A community-driven environmental app that organizes volunteer efforts to clean plastic waste across Jeddah city.',
            expandedDescription:
                'CleanJeddah is a UI/UX prototype designed for a smart city hackathon, focusing on environmental sustainability and community engagement. The app enables citizens to report plastic waste locations, organize volunteer cleanups, and track environmental impact through data visualization. Designed with map integration and social features, the prototype demonstrates user flows for waste reporting, volunteer coordination, and community impact tracking through an intuitive mobile interface created in Figma.',
            keyFeatures: [
              'Plastic waste location reporting',
              'Volunteer coordination and mapping',
              'Environmental impact analytics',
              'Community profile and contributions',
              'District-based cleanup organization',
              'Real-time waste reporting system',
            ],
            technologies: ['Figma', 'UI/UX Design', 'Prototyping'],
            imagePaths: [
              'assets/project_images/Plasticless/11.webp',
              'assets/project_images/Plasticless/21.webp',
              'assets/project_images/Plasticless/31.webp',
              'assets/project_images/Plasticless/41.webp',
              'assets/project_images/Plasticless/51.webp',
              'assets/project_images/Plasticless/61.webp',
            ],
            mainImage: 'assets/project_images/mainImage/plasticless.webp',
            imageOnRight: false,

            liveUrl:
                "https://www.figma.com/design/pxyeDjaGBFqqUMjb7rpLZA/PlasticlessPlanet-UI%2FUX-design-of-the-prototype?node-id=7-485&t=IXFwo7EmSylV04Qy-1",
            liveButtonText: "Figma Link",
          ),

          // Jidni Library Navigator
          ProjectCard(
            title: 'Jidni Library Navigator',
            description:
                'An indoor navigation app prototype that helps users locate books and navigate library spaces efficiently using augmented reality.',
            expandedDescription:
                'Jidni Library Navigator is a UI/UX prototype designed for a hackathon, featuring indoor navigation technology for library environments. The app helps users find specific books using shelf locations, provides walking directions within the library, and includes book discovery features. Designed with Arabic language interface, the prototype demonstrates user flows for book searching, indoor navigation, and library space utilization through an intuitive mobile interface created in Figma.',
            keyFeatures: [
              'Book location and shelf finding',
              'Indoor navigation with walking directions',
              'Augmented reality for library spaces',
              'Book discovery and search features',
              'Arabic language interface',
              'Intuitive mobile interface design',
            ],
            technologies: ['Figma', 'UI/UX Design', 'Prototyping'],
            imagePaths: [
              'assets/project_images/Jidni/jidni1.webp',
              'assets/project_images/Jidni/jidni2.webp',
              'assets/project_images/Jidni/jidni3.webp',
              'assets/project_images/Jidni/jidni4.webp',
              'assets/project_images/Jidni/jidni5.webp',
              'assets/project_images/Jidni/jidni6.webp',
            ],
            mainImage: 'assets/project_images/mainImage/jidni.webp',
            imageOnRight: true,
            liveButtonText: "Figma Link",
            liveUrl:
                "https://www.figma.com/design/8gSlid4qysv4GEbEtQB31E/Untitled?node-id=0-1&t=ayRlYUjvnQhWhFE5-1",
          ),
        ],
      ),
    );
  }
}
