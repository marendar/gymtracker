import 'package:flutter/material.dart';
import 'package:gymtracker/components/training_tile.dart';

import '../components/button.dart';

/*
 GUI Fertig soweit
 TODO: Logik, anbindung an DB, Trennung von Trainings- und Übungselementen,
 Training = Komposition von Übungen.
 joa
 */

class CreatePlans extends StatelessWidget{ //change auf Stateful sobald nicht statische Elemente auf der UI benötigt werden
  const CreatePlans({super.key});

  @override
  Widget build(BuildContext context) {
    List TrainingList = [
      TrainingTile(
        name: "Neues Training",
        imagePath: "lib/assets/images/fitnessstudio.png",
        details: () {}
      ),
      TrainingTile(
          name: "Cardio",
          imagePath: "lib/assets/images/fitnessstudio.png",
          details: () {}
      ),
      TrainingTile(
          name: "Push-Split",
          imagePath: "lib/assets/images/fitnessstudio.png",
          details: () {}
      ),
    ];

    List ExerciseList = [
      TrainingTile(
          name: "Neue Übung",
          imagePath: "lib/assets/images/fitnessstudio.png",
          details: () {}
      ),
      TrainingTile(
          name: "Push-Ups",
          imagePath: "lib/assets/images/fitnessstudio.png",
          details: () {}
      ),
      TrainingTile(
          name: "Pull-Ups",
          imagePath: "lib/assets/images/fitnessstudio.png",
          details: () {}
      ),
      TrainingTile(
          name: "Sit-Ups",
          imagePath: "lib/assets/images/fitnessstudio.png",
          details: () {}
      ),
    ];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 70, 200, 170),
      appBar: AppBar(
        title: Text("Trainingspläne & Übungen"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(Icons.settings),
        )],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Suche Training",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2,
                  )
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2,
                    )
                )
              )
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
                "Trainingspläne",
                style: const TextStyle(
                  fontSize: 32,
                  color: Colors.white
                ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) => TrainingList[index],
                  itemCount: TrainingList.length,
                  scrollDirection: Axis.horizontal,
              ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              "Übungen",
              style: const TextStyle(
                  fontSize: 32,
                  color: Colors.white
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => ExerciseList[index],
              itemCount: ExerciseList.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(height: 25),
          MyButton(buttonText: "Training Beginnen",
              event: () {} )
        ],
      )
    );
  }
}