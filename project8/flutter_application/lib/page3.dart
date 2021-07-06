import 'dart:ui';

import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

body: Center(
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
    children: [
  
      Container(
  
        child: Text('Wright ans = 0',style: TextStyle(color: Colors.green,fontSize: 20),),
  
      ),
  
       Container(
  
        child: Text('Wrong ans = 0',style: TextStyle(color: Colors.red,fontSize: 20),),
  
      ),
  
    ],
  
  ),
),
      ),
      
    );
  }
}