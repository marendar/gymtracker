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
    return GestureDetector(
        onTap: details,
        behavior: HitTestBehavior.translucent,
        child: InkWell(
          onTap: details,
          highlightColor: Color.fromARGB(255, 105, 70, 200),
          splashColor: Color.fromARGB(255, 105, 70, 200),
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.all(15),
            width: 200,
            height: 250,
            decoration: BoxDecoration(
            color: Color.fromARGB(0, 0, 0, 0),
            borderRadius: BorderRadius.circular(20),
          ),
            child: Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: 200,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255,200,70,100),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.contain,
                    )
                  ),
                  child: Align(
                    alignment: AlignmentGeometry.bottomCenter,
                    child: Text(
                      name,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
        ),
      );
  }

}

