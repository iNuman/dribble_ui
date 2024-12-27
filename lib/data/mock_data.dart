import 'dart:convert';

import '../models/user.dart';

class MockData {
  static User userData = const User(
    imagePath:
    'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
    name: 'Noman Ali',
    email: 'nomaaen.ali@gmail.com',
    about:
    'Skilled Android and Application Developer with years of experience designing and building user-friendly, high-performance mobile apps tailored to meet individual client needs and deliver seamless digital solutions.',    isDarkMode: false,
  );

  static void setUser(User newUser) {
    userData = newUser;
  }

  // static void toggleDarkMode() {
  //   userData = userData.copyWith(isDarkMode: !userData.isDarkMode);
  // }
}

