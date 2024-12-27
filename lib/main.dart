import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:dribble_ui/bottom_nav.dart';
import 'package:dribble_ui/data/mock_data.dart';
import 'package:dribble_ui/pages/intro/splash_screen.dart';
import 'package:dribble_ui/themes/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: MockData.userData.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // primaryColor: Colors.blue.shade800,
              useMaterial3: true,
            ),
            home: const SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SplashScreen(),
              // child: Scaffold(
              //   bottomNavigationBar: BottomNavApp(),
              // ),
            )
        ),
      ),
    );

    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue.shade800,
          useMaterial3: true,
        ),
        home: const SafeArea(
          child: Scaffold(
            bottomNavigationBar: BottomNavApp(),
          ),
        )
    );
  }
}
