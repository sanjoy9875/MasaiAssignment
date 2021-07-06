import 'package:flutter/material.dart';
import 'package:flutter_application/page1.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('quiz app'),
          centerTitle: true,
          backgroundColor: Colors.black12,
        ),
        body: Page1(),
      ),      
    );
  }
}
