import 'package:flutter/material.dart';
import 'package:gymtracker/components/training_tile.dart';
import 'package:gymtracker/data/database_helper.dart';
import 'package:gymtracker/data/model/training.dart';
import 'package:gymtracker/utility/asset_manager.dart';
import '../components/button.dart';
import '../data/model/exercise.dart';

class CreatePlans extends StatefulWidget{
  const CreatePlans({super.key});

  @override
  State<CreatePlans> createState() => _CreatePlansState();
}

class _CreatePlansState extends State<CreatePlans> {
  List<Exercise> _exercises = [];
  List<Training> _trainings = [];

  @override
  void initState() {
    super.initState();
    _fetchExercises();
    _fetchTrainings();
  }

  Future<void> _fetchExercises() async {
    final exerciseMaps = await DatabaseHelper.instance.queryAllExercises();
    setState(() {
      _exercises = exerciseMaps.map((userMap) => Exercise.fromMap(userMap)).toList();
    });
  }

  Future<void> _fetchTrainings() async {
    final trainingMaps = await DatabaseHelper.instance.queryAllTrainings();
    setState(() {
      _trainings = trainingMaps.map((userMap) => Training.fromMap(userMap)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<TrainingTile> trainingList = [
      TrainingTile(
          name: "Neues Training",
          imagePath: "lib/assets/images/fitnessstudio.png",
          details: () => Navigator.pushNamed(context, '/create_training')
      ),
    ];

    trainingList = _addEntriesFromDB(trainingList, true);

    List<TrainingTile> exerciseList = [
      TrainingTile(
          name: "Neue Übung",
          imagePath: "lib/assets/images/fitnessstudio.png",
          details: () => Navigator.pushNamed(context, '/create_exercise')
      ),
    ];

    exerciseList = _addEntriesFromDB(exerciseList, false);

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

  List<TrainingTile> _addEntriesFromDB(List<TrainingTile> list, bool isTraining) {
    if(isTraining){
      _trainings.forEach((training) {
        list.add(TrainingTile(
            name: training.name,
            imagePath: training.iconPath,
            details: () {
              AssetManager.setIdToBeDeleted(training.trainingId);
              Navigator.pushNamed(context, '/edit_exercise');
            }));
      });
    } else {
      _exercises.forEach((exercise){
        list.add(TrainingTile(
            name: exercise.name,
            imagePath: exercise.iconPath,
            details: () {
              AssetManager.setIdToBeDeleted(exercise.exerciseId);
              Navigator.pushNamed(context, '/edit_exercise');
            }));
      });
    }
    return list;
  }
}