import 'package:flutter/material.dart';
import 'package:personal_portfolio/pages/experience_and_edu.dart';
import 'package:personal_portfolio/pages/homescreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const Homescreen(),
            '/about': (context) => const Placeholder(),
            '/projects': (context) => const Placeholder(),
            '/experience_education': (context) =>
                const ExperienceAndEducation(),
            '/contact': (context) => const Placeholder(),
          },
          title: 'Flutter Portfolio',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
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

            return WebPointer(
              circleColor: Colors.black,
              roundColor: Colors.orange,
              roundDuration: 10,
              circleDuration: 200,
              child: MediaQuery(
                data: mq.copyWith(textScaleFactor: clampedTextScale),
                child: childWidget!,
              ),
            );
          },
        );
      },
      child: const Homescreen(),
    );
  }
}
