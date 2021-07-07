import 'package:flutter/material.dart';

class Preview extends StatelessWidget {

  String name;
  Preview({ Key? key , required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('$name',style: TextStyle(fontSize: 20)),
        ],),
      ),
      
    );
  }
}