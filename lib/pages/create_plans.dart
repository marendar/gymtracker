import 'package:gymtracker/components/button.dart';
import 'package:flutter/material.dart';


class CreatePlans extends StatelessWidget{ //change auf Stateful sobald nicht statische Elemente auf der UI benötigt werden
  const CreatePlans({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 70, 200, 170),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Text(
                "Have fun...Du Gaylord",
                style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold
                )
              ),
              SizedBox(height: 100),
              MyButton(buttonText: "Zurück",
                  event: () => Navigator.pushNamed(context, '/start_page_fuer_maks'))
            ],
          )
      ),
    );
  }
}