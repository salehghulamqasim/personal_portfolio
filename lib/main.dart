import 'package:flutter/material.dart';
import 'pages/aboutMe_screen.dart';
import 'package:personal_portfolio/pages/contact_screen.dart';
import 'package:personal_portfolio/pages/experience_and_edu.dart';
import 'package:personal_portfolio/pages/homescreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_portfolio/themes/colors.dart';
import 'package:web_pointer/web_pointer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // helper to pick design baseline based on device width
  Size _baselineForWidth(double width) {
    if (width < 600) return const Size(375, 812); // mobile
    if (width < 1024) return const Size(834, 1194); // tablet
    return const Size(1440, 900); // desktop (use Figma width)
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // initial default; we will run the device which is being run
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        //builder is a function that returns a widget and underscore means we don't use the first parameter
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            // '/splash': (context) =>
            //     const SplashScreen(), //initial splash screen
            '/': (context) => const Homescreen(),
            '/about': (context) => AboutMePage(),
            '/projects': (context) => const Placeholder(),
            '/experience_education': (context) =>
                const ExperienceAndEducation(),
            '/contact': (context) => const ContactScreen(),
          },
          title: 'Flutter Portfolio',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            hoverColor: AppColors.primaryOrange.withValues(alpha: 0.1),
            primaryColor: AppColors.primaryOrange,
            // Use numeric multiplier (not 1.sp)
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.0),
          ),

          builder: (context, childWidget) {
            final mq = MediaQuery.of(context);
            final chosen = _baselineForWidth(mq.size.width);

            // Re-init ScreenUtil with the chosen baseline for this device width.
            // This makes .w/.h/.sp scale based on the most appropriate design size.
            ScreenUtil.init(
              context,
              designSize: chosen,
              minTextAdapt: true,
              splitScreenMode: true,
            );

            // Optionally clamp textScaleFactor so fonts don't explode on large screens.
            // Adjust the clamp range to taste (1.0 means use exactly the same size).
            final widthScale = mq.size.width / chosen.width;
            final clampedTextScale = widthScale.clamp(1.0, 1.4);
            final isMobile = mq.size.width < 768;

            return MouseRegion(
              //this should hide the mouse pointer on mobile devices
              cursor: isMobile
                  ? SystemMouseCursors
                        .basic //show normal cursor on mobile
                  : SystemMouseCursors.none, //hide cursor on desktop
              child: isMobile
                  ? MediaQuery(
                      // Mobile: No WebPointer, just the app
                      data: mq.copyWith(
                        textScaler: TextScaler.linear(clampedTextScale),
                      ),
                      child: childWidget!,
                    )
                  : WebPointer(
                      // Desktop: WebPointer with custom cursor
                      circleColor: Colors.black,
                      roundColor: AppColors.primaryOrange,
                      roundDuration: 10, //speed for inner dot
                      circleDuration: 200, //speed for outer circle
                      //bigger the duration slower the animation
                      child: MediaQuery(
                        data: mq.copyWith(
                          //mq is mediaquery current device data
                          textScaler: TextScaler.linear(
                            clampedTextScale,
                          ), //calculated value that is clamped . clamped means it won't go beyond certain limit
                        ),
                        child: childWidget!,
                      ),
                    ),
            );
          },
        );
      },
      child: const Homescreen(),
    );
  }
}
