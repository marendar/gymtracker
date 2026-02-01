import 'package:flutter/material.dart';
import 'package:gymtracker/components/training_tile.dart';
import 'package:gymtracker/data/database_helper.dart';
import '../components/button.dart';
import '../data/model/exercise.dart';

class CreatePlans extends StatefulWidget{
  const CreatePlans({super.key});

  @override
  State<CreatePlans> createState() => _CreatePlansState();
}

class _CreatePlansState extends State<CreatePlans> {
  List<Exercise> _exercises = [];

  @override
  void initState() {
    super.initState();
    _fetchExercises();
  }

  Future<void> _fetchExercises() async {
    final exerciseMaps = await DatabaseHelper.instance.queryAllExercises();
    setState(() {
      _exercises = exerciseMaps.map((userMap) => Exercise.fromMap(userMap)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    List trainingList = [
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

    List exerciseList = [
      TrainingTile(
          name: "Neue Übung",
          imagePath: "lib/assets/images/fitnessstudio.png",
          details: () => Navigator.pushNamed(context, '/create_exercise')
      ),
    ];

    _exercises.forEach((exercise) => exerciseList.add(TrainingTile(name: exercise.name, imagePath: exercise.iconPath, details: (){})));

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
                    itemBuilder: (context, index) => trainingList[index],
                    itemCount: trainingList.length,
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
                itemBuilder: (context, index) => exerciseList[index],
                itemCount: exerciseList.length,
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