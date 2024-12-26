import 'package:dribble_ui/home_page.dart';
import 'package:dribble_ui/pages/user_profile.dart';
import 'package:flutter/material.dart';

import 'pages/smart_home.dart';

class BottomNavApp extends StatefulWidget {
  const BottomNavApp({super.key});

  @override
  _BottomNavAppState createState() => _BottomNavAppState();
}

class _BottomNavAppState extends State<BottomNavApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      body: Navigator(
        initialRoute: "Home",
        key: _navigatorKey,
        onGenerateRoute: _generateRoute,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade200,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Smart Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _currentTabIndex,
        onTap: _onTap,
      ),
    );
  }

  // Handle navigation and tab index updates
  void _onTap(int index) {
    String routeName;
    switch (index) {
      case 0:
        routeName = "Home";
        break;
      case 1:
        routeName = "SmartHome";
        break;
      case 2:
        routeName = "Profile";
        break;
      default:
        routeName = "Home";
    }

    _navigatorKey.currentState?.pushReplacementNamed(routeName);

    setState(() {
      _currentTabIndex = index;
    });
  }

  Route<dynamic> _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "SmartHome":
        return MaterialPageRoute(
          builder: (context) => const SmartHome()
        );
      case "Profile":
        return MaterialPageRoute(
          builder: (context) => const UserProfile(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
    }
  }
}
