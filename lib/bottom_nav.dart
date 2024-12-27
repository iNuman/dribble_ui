import 'package:animated_theme_switcher/animated_theme_switcher.dart';
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
    return WillPopScope(
      onWillPop: () async {
        if (_currentTabIndex != 0) {
          // Move to Home tab if not already on it
          setState(() {
            _currentTabIndex = 0;
          });
          _navigatorKey.currentState?.pushReplacementNamed("Home");
          return false; // Prevent default back behavior
        }
        // Exit the app if already on Home tab
        return true;
      },
      child: ThemeSwitchingArea(
        child: Builder(
          builder: (context) => Scaffold(
            backgroundColor: Colors.white,
            body: Navigator(
              initialRoute: "Home",
              key: _navigatorKey,
              onGenerateRoute: _generateRoute,
            ),
            bottomNavigationBar: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue.shade800,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                  IconButton(
                    enableFeedback: true,
                    onPressed: () {
                      setState(() {
                        _currentTabIndex = 0;
                        _onTap(_currentTabIndex);
                      });
                    },
                    icon: _currentTabIndex == 0
                        ? const Icon(
                            Icons.home_filled,
                            color: Colors.white,
                            size: 35,
                          )
                        : const Icon(
                            Icons.home_outlined,
                            color: Colors.white,
                            size: 35,
                          ),
                  ),
                  IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      setState(() {
                        _currentTabIndex = 1;
                        _onTap(_currentTabIndex);
                      });
                    },
                    icon: _currentTabIndex == 1
                        ? const Icon(
                            Icons.work_rounded,
                            color: Colors.white,
                            size: 35,
                          )
                        : const Icon(
                            Icons.work_outline_outlined,
                            color: Colors.white,
                            size: 35,
                          ),
                  ),
                  IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      setState(() {
                        _currentTabIndex = 2;
                        _onTap(_currentTabIndex);
                      });
                    },
                    icon: _currentTabIndex == 2
                        ? const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 35,
                    )
                        : const Icon(
                      Icons.person_outline,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  // IconButton(
                  //   enableFeedback: false,
                  //   onPressed: () {
                  //     setState(() {
                  //       _currentTabIndex = 3;
                  //       _onTap(_currentTabIndex);
                  //     });
                  //   },
                  //   icon: _currentTabIndex == 3
                  //       ? const Icon(
                  //           Icons.widgets_rounded,
                  //           color: Colors.white,
                  //           size: 35,
                  //         )
                  //       : const Icon(
                  //           Icons.widgets_outlined,
                  //           color: Colors.white,
                  //           size: 35,
                  //         ),
                  // ),

                ])),
            // bottomNavigationBar: BottomNavigationBar(
            //   items: const [
            //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            //     BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Smart Home'),
            //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            //   ],
            //   currentIndex: _currentTabIndex,
            //   onTap: _onTap,
            // ),
          ),
        ),
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
        return MaterialPageRoute(builder: (context) => const SmartHome());
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
