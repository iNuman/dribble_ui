import 'package:dribble_ui/bottom_nav.dart';
import 'package:dribble_ui/widgets/emoticon_widget.dart';
import 'package:dribble_ui/widgets/exercise_row_widget.dart';
import 'package:flutter/material.dart';

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
        body: SafeArea(
          child: Column(
            children: <Widget>[
              // Greetings Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12,),
                            const Text("Hi Good Morning, ",
                                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 6),
                            Text("24, December 2024 ", style: TextStyle(color: Colors.blue.shade200)),
                          ],
                        ),

                        // Notification
                        Container(
                            decoration:
                                BoxDecoration(color: Colors.blue.shade600, borderRadius: BorderRadius.circular(12)),
                            padding: const EdgeInsets.all(12.0),
                            child: const Icon(
                              Icons.notifications,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),

                    // Search Container
                    Container(
                      decoration: BoxDecoration(color: Colors.blue.shade600, borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.all(12),
                      child: const Row(
                        children: [
                          Icon(Icons.search, color: Colors.white),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Search",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    // How do you feel
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("How do you feel? ",
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                        Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    // faces
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // bad
                        Column(
                          children: [
                            EmoticonWidget(
                              emoteFace: '😔',
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Bad",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),

                        // fine
                        Column(
                          children: [
                            EmoticonWidget(
                              emoteFace: '😊',
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Fine",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),

                        // well
                        Column(
                          children: [
                            EmoticonWidget(
                              emoteFace: '😀',
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Well",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),

                        // excellent
                        Column(
                          children: [
                            EmoticonWidget(
                              emoteFace: '😎',
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Excellent",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Expanded(
                          child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24),
                                ),
                              ),
                              child: Center(
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).hintColor,
                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                      ),
                                      height: 4,
                                      width: 40,
                                      margin: const EdgeInsets.symmetric(vertical: 10),
                                    ),
                                    // Exercise heading
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Exercise ",
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                        ),
                                        Icon(
                                          Icons.more_horiz,
                                          color: Colors.black,
                                        )
                                      ],
                                    ),

                                    const SizedBox(
                                      height: 20,
                                    ),

                                    // List of exercises
                                    Expanded(child: ListView(
                                      children: [
                                        ExerciseRowWidget(icon: Icons.favorite, exerciseName: "Speaking Skills", noOfExercises: 15, color: Colors.orange,),
                                        ExerciseRowWidget(icon: Icons.person, exerciseName: "Reading Skills", noOfExercises: 12, color: Colors.blueAccent),
                                        ExerciseRowWidget(icon: Icons.star, exerciseName: "Writing Skills", noOfExercises: 10, color: Colors.purple),
                                      ],
                                    )),

                                  ],
                                ),
                              )),
                        ), // Reusable GridView builder
                      ),
                    );
                  },
                  child: const Text("Open Smart Devices"),
                ),
              ),


            ],
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
