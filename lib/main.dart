import 'package:flutter/material.dart';
import 'package:gymtracker/pages/create_plans.dart';
import 'package:gymtracker/pages/start_page_fuer_maks.dart';


void main(){
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
     },
    );

  }

}