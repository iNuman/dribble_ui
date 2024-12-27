import '../models/user.dart';

class MockData {
  static User userData = const User(
    imagePath:
    'https://images.unsplash.com/photo-1734378377292-212b58560ff8?q=80&w=2599&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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

