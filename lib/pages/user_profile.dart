import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:dribble_ui/data/mock_data.dart';
import 'package:dribble_ui/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/budget_widget.dart';
import 'edit_profile.dart';

class UserProfile extends StatelessWidget {
  final user = MockData.userData;

  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
               ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                  // setState(() {});
                },
              ),
              SizedBox(height: 24),
              buildName(MockData.userData)],
          ),
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade To PRO',
        onClicked: () {},
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
