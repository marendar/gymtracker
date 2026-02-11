import 'package:flutter/material.dart';
import 'package:gymtracker/components/button.dart';
import 'package:gymtracker/components/training_tile.dart';
import 'package:gymtracker/utility/asset_manager.dart';
import '../data/database_helper.dart';
import '../data/model/training.dart';

class CreateTraining extends StatefulWidget{
  const CreateTraining({super.key});

  @override
  State<StatefulWidget> createState() => _CreateTrainingState();
}

class _CreateTrainingState extends State<CreateTraining>{
  final textEditingControllerName = TextEditingController();
  final textEditingControllerNotes = TextEditingController();
  String iconPath = AssetManager.iconPath;
  int idCounter = 0;

  @override
  void initState() {
    super.initState();
    _fetchNumberOfTrainings();
  }

  Future<void> _fetchNumberOfTrainings() async {
    final trainingMaps = await DatabaseHelper.instance.queryAllTrainings();
    setState(() {
      idCounter = trainingMaps.map((userMap) => Training.fromMap(userMap)).toList().length+1;
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
          title: Text("Training anlegen"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          actions: [Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.settings),
          )],
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  controller: textEditingControllerName,
                  onChanged: (text) => setState(() {}),
                  decoration: InputDecoration(
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
                    ),
                    labelText: 'Name des Trainings',
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  controller: textEditingControllerNotes,
                  decoration: InputDecoration(
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
                    ),
                    labelText: 'Notizen zum Training',
                  ),
                ),
              ),
              SizedBox(height:20),
              if(!(iconPath == ''))
                Center(
                  child: TrainingTile(
                      name:textEditingControllerName.value.text,
                      imagePath: iconPath,
                      details:() {}
                  ),
                ),
              MyButton(buttonText: 'Icon Auswählen',
                  event: () => Navigator.pushNamed(context, '/choose_icon').then((text) => setState(() {}))),
              MyButton(buttonText: 'Training Erstellen',
                  event: () {
                    DatabaseHelper.instance.insertTraining
                      (Training(
                        trainingId: idCounter,
                        name: textEditingControllerName.value.text,
                        notes: textEditingControllerNotes.value.text,
                        iconPath: iconPath));
                    Navigator.pushNamed(context,'/create_plans');
                  }
              )]
        ));
  }

}