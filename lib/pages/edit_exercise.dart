import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymtracker/data/database_helper.dart';
import 'package:gymtracker/utility/asset_manager.dart';
import '../components/button.dart';

class EditExercise extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 70, 200, 170),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              MyButton(buttonText: "Übung Löschen",
                  event: () {
                    Navigator.pushNamed(context, '/create_plans');
                    DatabaseHelper.instance.deleteExercise(AssetManager.exerciseId);
                  })
            ],
          )
      ),
    );
  }
}