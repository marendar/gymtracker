import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{

  final String buttonText;
  final void Function()? event;

  const MyButton({
    super.key,
    required this.buttonText,
    required this.event,
  });

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: event,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
            buttonText,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],)
      ),
    );
  }
}