import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child:
          Text(
            "Profile",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          )

    );
  }
}
