import 'package:flutter/material.dart';
import 'package:gymtracker/components/training_tile.dart';
import 'package:gymtracker/utility/asset_manager.dart';
import '../components/button.dart';

class ChooseIcon extends StatelessWidget{
  const ChooseIcon({super.key});


  @override
  Widget build(BuildContext context) {
    List<TrainingTile> iconList = [];
    int iconCount = AssetManager.pathList.length;
    for(int i = 0; i < iconCount; i++){
      iconList.add(TrainingTile(
              name: AssetManager.pathList.elementAt(i).replaceAll('lib/assets/images/', ''),
              imagePath: AssetManager.pathList.elementAt(i),
              details: () => AssetManager.setIconPath(AssetManager.pathList.elementAt(i))
            )
        );
    }
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 70, 200, 170),
        appBar: AppBar(
          title: Text("Icon Auswählen"),
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
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Center(
                  child: Text(
                    "Icon Auswählen",
                    style: const TextStyle(
                        fontSize: 32,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 400,
                height: 480,
                child: Expanded(
                  child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      children:iconList
                  )
                ),
              ),
              MyButton(buttonText: 'Icon Wählen',
                  event: () => Navigator.pop(context)
              ),
              SizedBox(height: 20),
            ]
      )
    );
  }
}