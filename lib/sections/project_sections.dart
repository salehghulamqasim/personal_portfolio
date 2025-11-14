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
          title: 'PlayBaloot — Real-time Multiplayer Baloot Score Keeper',
          description:
              'A cross-platform Flutter app that creates and manages real-time Baloot game rooms with automated scoring and remote multiplayer support.',
          expandedDescription:
              'Built in Flutter with Bloc (Cubit) for state management, PlayBaloot uses Firebase Authentication for secure sign-in and Firebase (Firestore + Realtime Database) to store room state and synchronize scores live between players. Rooms can be created and joined via QR codes, the UI uses Lottie/Rive/Flare animations and localization for multi-language support, and push notifications are handled through OneSignal.',
          keyFeatures: [
            'Create and join game rooms',
            'Real-time score synchronization',
            'QR code room sharing',
            'Multi-language support',
            'Clean & intuitive UI',
            'iOS & Android support',
          ],
          technologies: ['Flutter', 'Dart', 'BloC/Cubit', 'Figma'],
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
          title: 'Beauty-Clinic Website',
          description:
              'A responsive website for showcasing beauty clinic services and engaging with clients.',
          expandedDescription:
              'The Beauty-Clinic website is a multi-page platform designed to highlight beauty clinic services, client testimonials, and appointment booking options. Built with HTML, CSS, and Bootstrap, the site features a responsive design optimized for both desktop and mobile users. It includes sections for service descriptions, pricing, and a contact form for inquiries, making it ideal for clinics looking to establish an online presence.',
          keyFeatures: [
            'Responsive multi-page design',
            'Service descriptions and pricing',
            'Client testimonials',
            'Contact form for inquiries',
            'Mobile-friendly layout',
          ],
          technologies: ['HTML', 'CSS', 'Bootstrap', 'JavaScript'],
          imagePaths: [
            'assets/project_images/beauty/Screenshot From 2025-02-18 22-19-41_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-beauty-.webp',
            'assets/project_images/beauty/Screenshot From 2025-02-18 22-20-03_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-beauty-.webp',
            'assets/project_images/beauty/Screenshot From 2025-02-18 22-20-23_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-beauty-.webp',
            'assets/project_images/beauty/Screenshot From 2025-02-18 22-42-40_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-beauty-.webp',
            'assets/project_images/beauty/Screenshot From 2025-02-18 22-46-36_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-beauty-.webp',
          ],
          mainImage: 'assets/project_images/mainImage/beauty.webp',
          imageOnRight: true,
        ),

        // Wavy Design
        ProjectCard(
          title: 'Wavy Salon Booking',
          description:
              'A comprehensive mobile platform connecting users with beauty salons for seamless booking and community engagement.',
          expandedDescription:
              'Wavy is a Flutter-based mobile application that enables users to discover, browse, and book beauty salons with an intuitive booking system. The app features user authentication, salon profiles with ratings and reviews, real-time community interactions, and a complete booking management system. Built with modern mobile development practices to ensure smooth navigation and engaging user experience across all screens.',
          keyFeatures: [
            'Salon discovery and booking system',
            'User authentication and secure login',
            'Community reviews and ratings',
            'Real-time appointment management',
            'Favorite salons and profiles',
            'Arabic language interface support',
          ],
          technologies: ['Flutter', 'Dart', 'Provider', 'Rive Animations'],
          imagePaths: [
            'assets/project_images/wavy/1_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-wavy-.webp',
            'assets/project_images/wavy/2_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-wavy-.webp',
            'assets/project_images/wavy/3_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-wavy-.webp',
            'assets/project_images/wavy/4_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-wavy-.webp',
          ],
          mainImage: 'assets/project_images/mainImage/wavvy.webp',
          imageOnRight: false,
        ),

        // Green Project
        ProjectCard(
          title: 'SolarEnergy Landing Page',
          description:
              'A focused marketing landing page that clearly communicates solar installation benefits and captures leads from interested customers.',
          expandedDescription:
              'This is a static, single-page site built with semantic HTML and a dedicated stylesheet (style.css) to provide a responsive, mobile-first layout without a frontend framework. Content is organized into hero, benefits, services, testimonial and newsletter sections, with prominent CTAs to request a quote or subscribe; media and icons are stored in an assets folder and the site is optimized for static hosting. The implementation favors simple, maintainable HTML/CSS so it can be quickly deployed (for example via GitHub Pages) and easily customized for different campaigns.',
          keyFeatures: [
            'Clear value and savings messaging',
            'Easy quote request call-to-action',
            'Trust-building customer testimonials',
            'Email newsletter lead capture',
          ],
          technologies: ['HTML', 'CSS', 'Figma'],
          imagePaths: [
            'assets/project_images/greenproject/Screenshot From 2025-02-18 22-50-20_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-greenproject-.webp',
            'assets/project_images/greenproject/Screenshot From 2025-02-18 22-50-36_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-greenproject-.webp',
            'assets/project_images/greenproject/Screenshot From 2025-02-18 22-51-15_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-greenproject-.webp',
            'assets/project_images/greenproject/Screenshot From 2025-02-18 22-51-51_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-greenproject-.webp',
          ],
          mainImage: 'assets/project_images/mainImage/green.webp',
          imageOnRight: true,
        ),

        // Ashwat App
        ProjectCard(
          title: 'Ashwat — Tawaf & Sa’i Automated Lap Counter',
          description:
              'A Flutter app that uses location and motion sensors to count Tawaf and Sa’i laps automatically.',
          expandedDescription:
              'Ashwat is an Android app built with Flutter/Dart to help pilgrims count ritual laps during Hajj and Umrah. It uses a geolocation zone to track laps when users exit and re-enter, so returning to the exact start point is not needed. Sessions are saved offline, and the app focuses on low power use and clear visual, audio, and haptic feedback. This project was Vibe coded by me to showcase my mobile development skills and problem-solving abilities in a real-world context with help of AI tools.',
          keyFeatures: [
            'Geofence-based lap counting (exit and re-enter to record).',
            'Clean real-time UI with lap count, time, and distance.',
            'Local session storage for offline review.',
            'Configurable visual, audio, and haptic alerts; battery-aware.',
          ],
          technologies: ['Flutter', "Dart", "GPS", "Geolocator"],
          imagePaths: [
            'assets/project_images/Ashwate/1_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-Ashwate-.webp',
            'assets/project_images/Ashwate/2_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-Ashwate-.webp',
            'assets/project_images/Ashwate/3_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-Ashwate-.webp',
            'assets/project_images/Ashwate/4_webP_-Users-saleh-development-projects-personal_portfolio-assets-project_images-Ashwate-.webp',
          ],
          mainImage: 'assets/project_images/mainImage/ashwat.webp',
          imageOnRight: false,
        ),

        // Viva App
        ProjectCard(
          title: 'VivaDecore Interior Design',
          description:
              'A responsive static website showcasing premium interior design services with client-focused conversion elements.',
          expandedDescription:
              'VivaDecore is a frontend-only static website built with HTML, CSS, and Bootstrap, featuring a complete multi-page layout without backend dependencies. The platform utilizes Bootstrap\'s responsive grid system with custom CSS styling for visual appeal. All conversion-optimized elements—including service showcases, client statistics, and call-to-action buttons—are implemented purely with frontend technologies, making it ideal for static hosting platforms like GitHub Pages.',
          keyFeatures: [
            'Multi-page service showcases and portfolios',
            'Structured project workflow visualization',
            'Client statistics and achievement metrics',
            'Conversion-focused call-to-action elements',
            'Fully responsive frontend design',
          ],
          technologies: ['HTML', 'CSS', 'Bootstrap', 'GitHub Pages'],
          imagePaths: [
            'assets/project_images/viva/1viva.webp',
            'assets/project_images/viva/2viva.webp',
            'assets/project_images/viva/3viva.webp',
            'assets/project_images/viva/4viva.webp',
          ],
          mainImage: 'assets/project_images/mainImage/viva.webp',
          imageOnRight: true,
        ),
      ],
    );
  }
}
