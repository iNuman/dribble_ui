import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade800,
        body: const SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Text("Hi Good Morning, ",
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
