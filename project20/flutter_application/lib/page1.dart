import 'package:flutter/material.dart';
import 'dart:async';

import 'home.dart';

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{

  AnimationController? controller;
  double value = 0.0;
  Color color = Colors.grey;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,duration: Duration(seconds: 5),upperBound: 100);

      var curve = CurvedAnimation(parent: controller!, curve: Curves.decelerate);

      controller?.forward();
      controller?.addListener(() { 
        setState(() {
          value = controller!.value;
          color = Colors.white;
        });     
      });
  }

  //   @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(
  //       Duration(seconds: 3),
  //       (){
  //           Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),
  //           )
  //           );
  //       },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: FlutterLogo(
            size:200,
        ),
      ),
    );
  }
}