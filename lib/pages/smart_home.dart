import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:dribble_ui/widgets/smart_device_card_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar_widget.dart';

class SmartHome extends StatefulWidget {
  const SmartHome({super.key});

  @override
  State<SmartHome> createState() => _SmartHomeState();
}

class _SmartHomeState extends State<SmartHome> {
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  // list of smart devices
  List mySmartDevices = [
    // [ smartDeviceName, iconPath , powerStatus ]
    ["Smart Light", "lib/icons/light-bulb.png", true],
    ["Smart AC", "lib/icons/air-conditioner.png", false],
    ["Smart TV", "lib/icons/smart-tv.png", false],
    ["Smart Fan", "lib/icons/fan.png", false],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
        child: Builder(
            builder: (context) => Scaffold(
                  // backgroundColor: Colors.grey.shade200,
                  appBar: buildAppBar(context),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 42),
                      // welcome home
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome Home,",
                              style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                            ),
                            const Text(
                              'Noman Ali',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 25),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.0),
                        child: Divider(
                          thickness: 1,
                          color: Color.fromARGB(255, 204, 204, 204),
                        ),
                      ),

                      const SizedBox(height: 25),

                      Expanded(
                          child: GridView.builder(
                        itemCount: 4,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.2 / 1.4),
                        itemBuilder: (context, index) {
                          return SmartDeviceCardWidget(
                            smartDeviceName: mySmartDevices[index][0],
                            iconPath: mySmartDevices[index][1],
                            powerOn: mySmartDevices[index][2],
                            onChanged: (value) => powerSwitchChanged(value, index),
                          );
                        },
                      )),
                    ],
                  ),
                )));
  }
}
