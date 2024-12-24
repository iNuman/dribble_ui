import 'package:flutter/material.dart';

class EmoticonWidget extends StatefulWidget {
 final String emoteFace;

  const EmoticonWidget({super.key, required this.emoteFace});

  @override
  State<EmoticonWidget> createState() => _EmoticonWidgetState();
}

class _EmoticonWidgetState extends State<EmoticonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.blue.shade600, borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Text(
          widget.emoteFace,
          style: const TextStyle(fontSize: 24),
        )));
  }
}
