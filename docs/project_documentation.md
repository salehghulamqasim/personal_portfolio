# Project Documentation: Personal Portfolio

## Overview
The **Personal Portfolio** project is a Flutter-based web application designed to showcase your skills, projects, and achievements. It is built with a focus on responsiveness, interactivity, and modern design principles.

---

## Project Structure

### Root Directory
- **`pubspec.yaml`**: Defines project dependencies, assets, and metadata.
- **`README.md`**: Provides a brief overview of the project.
- **`analysis_options.yaml`**: Contains linting rules for code quality.
- **`cloudflare-build.sh`**: A script to build the project for deployment.
- **`_redirects`**: Handles URL redirection for the web app.

### `lib/`
The main directory for application code.

#### `components/`
Reusable widgets and UI components:
- **`about_card.dart`**: Displays information about the user.
- **`aboutMe.dart`**: Manages the "About Me" section, including certificates and sliders.
- **`app_bar.dart`**: Custom app bar for navigation.
- **`education_cards.dart`**: Displays education details.
- **`experience_cards.dart`**: Displays professional experience.
- **`hover_widget.dart`**: Adds hover effects to widgets.
- **`language_chips.dart`**: Displays programming languages as chips.
- **`mobilebar.dart`**: Navigation bar for mobile devices.
- **`project_card.dart`**: Displays project details.
- **`scrollable_page.dart`**: Implements a scrollable layout.
- **`section_title.dart`**: Displays section titles with styling.
- **`sidebar.dart`**: Sidebar navigation for desktop.
- **`skeleton.dart`**: Placeholder skeletons for loading states.
- **`tech_skills.dart`**: Displays technical skills.
- **`timeline.dart`**: Timeline widget for experience and education.

#### `pages/`
Screens of the application:
- **`about_screen.dart`**: Displays the "About Me" section.
- **`contact_screen.dart`**: Contact form and details.
- **`homescreen.dart`**: The main landing page.
- **`splash_screen.dart`**: Splash screen displayed on app launch.

#### `sections/`
Organized sections of the portfolio:
- **`about_section.dart`**: Contains the "About Me" section.
- **`contact_me.dart`**: Contact section with form.
- **`education_section.dart`**: Education details.
- **`experience_section.dart`**: Professional experience.
- **`footer_wave.dart`**: Footer with wave animation.
- **`hero_section.dart`**: Hero banner at the top of the page.
- **`project_sections.dart`**: Displays all projects.
- **`socials_footer.dart`**: Footer with social media links.

#### `themes/`
Styling and theme-related files:
- **`colors.dart`**: Defines color constants.
- **`font_weights_helper.dart`**: Helper for font weights.
- **`styles.dart`**: General styling constants.
- **`text_styles.dart`**: Text style definitions.

#### `utils/`
Utility functions:
- **`preload_assets.dart`**: Preloads assets (currently unused).

### `assets/`
Contains all static assets:
- **`Certificates/`**: Certificates for achievements.
- **`icons/`**: Icons used in the app.
- **`images/`**: General images.
- **`project_images/`**: Images for projects.
- **`splash_screen/`**: Splash screen assets.

### `web/`
Web-specific files:
- **`index.html`**: Entry point for the web app.
- **`manifest.json`**: Web app manifest.
- **`splash.json`**: Splash screen configuration.
- **`icons/`**: Web app icons.

### `docs/`
Documentation files:
- **`animation_changes_log.md`**: Logs animation updates.
- **`project_documentation.md`**: This file.

---

## Key Features

### Responsive Design
The app is optimized for both desktop and mobile devices using `flutter_screenutil`.

### Interactive Animations
Smooth transitions and engaging effects are implemented using `flutter_animate`.

### Project Showcase
Projects are displayed with images, descriptions, and interactive sliders.

### Certificates Display
Achievements are showcased with a dedicated section for certificates.

### Custom Splash Screen
A unique splash screen creates a professional first impression.

---

## Deployment
The project can be built for the web using the `cloudflare-build.sh` script. The output is located in the `build/web` directory.

---

## How to Use

### Prerequisites
- Install Flutter: [Flutter Installation Guide](https://docs.flutter.dev/get-started/install)
- Ensure Dart SDK is installed.

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/salehghulamqasim/personal_portfolio.git
   ```
2. Navigate to the project directory:
   ```bash
   cd personal_portfolio
   ```
3. Fetch dependencies:
   ```bash
   flutter pub get
   ```

### Running the App
- For Web:
  ```bash
  flutter run -d chrome
  ```
- For Mobile:
  ```bash
  flutter run
  ```

---

## Acknowledgments
- Flutter Community
- Open-source packages used in this project

---

## Contact
For any inquiries, feel free to reach out via the contact section in the portfolio.