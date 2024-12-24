import 'package:dribble_ui/bottom_nav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue.shade800,
          useMaterial3: true,
        ),
        home: const SafeArea(
          child: Scaffold(
            bottomNavigationBar: BottomNavApp(),
          ),
        ));
  }
}
