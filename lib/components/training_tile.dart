import 'package:flutter/material.dart';

class TrainingTile extends StatelessWidget {
  final String name;
  final String imagePath;
  final void Function()? details;

  const TrainingTile({
    super.key,
    required this.name,
    required this.imagePath,
    required this.details
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.all(10),
      width: 200,
      height: 250,
      decoration: BoxDecoration(
        color: Color.fromARGB(255,200,70,100),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          GestureDetector(
              onTap: details,
              child: Image.asset(imagePath)),
          Center(
            child: Text(
                name,
                style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ]
      )
    );
  }

}

