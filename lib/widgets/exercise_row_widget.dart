import 'package:flutter/material.dart';

class ExerciseRowWidget extends StatelessWidget {
  final icon;
  final String exerciseName;
  final int noOfExercises;
  final color;


  ExerciseRowWidget({super.key, required this.icon, required this.exerciseName, required this.noOfExercises, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding:  EdgeInsets.all(12),
                    color: color,
                    child:  Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exerciseName,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$noOfExercises  Exercises",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const Icon(Icons.more_horiz),
          ])),
    );
  }
}
