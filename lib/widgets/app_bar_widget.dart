import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:dribble_ui/data/mock_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes/themes.dart';

AppBar buildAppBar(BuildContext context) {
  var user = MockData.userData;
  final isDarkMode = user.isDarkMode;
  final icon = isDarkMode ? CupertinoIcons.sun_max : CupertinoIcons.moon_stars;

  return AppBar(
    // leading: BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      ThemeSwitcher(
        builder: (context) => IconButton(
          icon: Icon(icon),
          onPressed: () {
            final theme = isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme;

            final switcher = ThemeSwitcher.of(context);
            switcher.changeTheme(theme: theme);

            final newUser = user.copy(isDarkMode: !isDarkMode);
            MockData.setUser(newUser);
          },
        ),
      ),
    ],
  );
}
