import 'package:flutter/material.dart';
import 'package:gymtracker/components/button.dart';
import 'package:gymtracker/components/training_tile.dart';
import 'package:gymtracker/data/model/exercise.dart';
import 'package:gymtracker/utility/asset_manager.dart';

import '../data/database_helper.dart';

class CreateExercise extends StatefulWidget{
  const CreateExercise({super.key});

  @override
  State<StatefulWidget> createState() => _CreateExerciseState();
}

class _CreateExerciseState extends State<CreateExercise>{
  final textEditingControllerName = TextEditingController();
  final textEditingControllerNotes = TextEditingController();
  String iconPath = AssetManager.iconPath;
  int idCounter = 0;

  @override
  void initState() {
    super.initState();
    _fetchNumberOfExercises();
  }

  Future<void> _fetchNumberOfExercises() async {
    final exerciseMaps = await DatabaseHelper.instance.queryAllExercises();
    setState(() {
      idCounter = exerciseMaps.map((userMap) => Exercise.fromMap(userMap)).toList().length+1;
    });
  }

  @override
  void dispose() {
    textEditingControllerName.dispose();
    textEditingControllerNotes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 70, 200, 170),
        appBar: AppBar(
          title: Text("Übung anlegen"),
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
              TextFormField(
                  controller: textEditingControllerName,
                  decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Name der Übung',
                ),
              ),
              TextFormField(
                  controller: textEditingControllerNotes,
                  decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Notizen zur Übung',
                ),
              ),
              if(!(iconPath == ''))
                Center(
                  child: TrainingTile(
                    name:'',
                    imagePath: iconPath,
                    details:() {}
                  ),
                ),
              MyButton(buttonText: 'Icon Auswählen',
                  event: () => Navigator.pushNamed(context, '/choose_icon')),
              MyButton(buttonText: 'Übung Erstellen',
                  event: () {
                    DatabaseHelper.instance.insertExercise
                      (Exercise(
                        exerciseId: idCounter,
                        name: textEditingControllerName.value.text,
                        notes: textEditingControllerNotes.value.text,
                        iconPath: iconPath));
                    Navigator.pushNamed(context,'/create_plans');
                  }
              )]
        ));
  }
  
}