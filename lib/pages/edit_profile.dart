
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:dribble_ui/data/mock_data.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/budget_widget.dart';
import '../widgets/profile_widget.dart';
import '../widgets/text_field_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late User user;

  @override
  void initState() {
    super.initState();

    user = MockData.userData;
  }

  @override
  Widget build(BuildContext context) => ThemeSwitchingArea(
    child: Builder(
      builder: (context) => Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {
                // final image = await ImagePicker()
                //     .getImage(source: ImageSource.gallery);
                //
                // if (image == null) return;
                //
                // final directory = await getApplicationDocumentsDirectory();
                // final name = basename(image.path);
                // final imageFile = File('${directory.path}/$name');
                // final newImage =
                // await File(image.path).copy(imageFile.path);
                //
                // setState(() => user = user.copy(imagePath: newImage.path));
              },
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              text: user.name,
              onChanged: (name) => user = user.copy(name: name),
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              text: user.email,
              onChanged: (email) => user = user.copy(email: email),
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'About',
              text: user.about,
              maxLines: 5,
              onChanged: (about) => user = user.copy(about: about),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Save',
              onClicked: () {
                // UserPreferences.setUser(user);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    ),
  );
}