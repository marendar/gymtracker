import 'package:flutter/material.dart';
import 'package:gymtracker/pages/choose_icon.dart';
import 'package:gymtracker/pages/create_plans.dart';
import 'package:gymtracker/pages/create_exercise.dart';
import 'package:gymtracker/pages/start_page_fuer_maks.dart';
import 'package:gymtracker/utility/asset_manager.dart';
import 'data/database_helper.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.initDb();
  AssetManager.getListOfImageAssets();
  runApp(const GymTracker() as Widget);
}

class GymTracker extends StatelessWidget{
  const GymTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPageFuerMaks(),
     routes: {
       '/start_page_fuer_maks': (context) => StartPageFuerMaks(),
       '/create_plans': (context) => CreatePlans(),
       '/create_exercise': (context) => CreateExercise(),
       '/choose_icon': (context) => ChooseIcon(),
     },
    );

  }

}