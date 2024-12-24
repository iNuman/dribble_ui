import 'package:flutter/material.dart';

class SmartHome extends StatefulWidget {
  const SmartHome({super.key});

  @override
  State<SmartHome> createState() => _SmartHomeState();
}

class _SmartHomeState extends State<SmartHome> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blueAccent,
        child: const Center(child: Text("Smart Home")),

      ),
    );
  }
}
