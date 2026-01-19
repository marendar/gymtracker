import 'package:flutter/material.dart';
import '../components/button.dart';

class StartPageFuerMaks extends StatelessWidget {
  const StartPageFuerMaks({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 70, 200, 170),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            MyButton(buttonText: "Trainingspläne anlegen/bearbeiten",
                event: () => Navigator.pushNamed(context, '/create_plans'))
          ],
        )
      ),
    );
  }
}