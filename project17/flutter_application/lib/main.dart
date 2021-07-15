
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import 'home.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

    Widget getPlatformSpecificUi(){

      if(Platform.isIOS){
        return IosDialog();
      }
      else{
        return AndroidDialog();     
      }
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              FlatButton(
                color: Colors.pink,
                onPressed: (){
                    showDialog(
                      context: context,
                       builder: (BuildContext context){
                          return getPlatformSpecificUi();
                       },
                    );
                },
                 child: Text('show dialog',style: TextStyle(color: Colors.white),),
                 ),
          ],
        ),
      ),
      
    );
  }
}

class AndroidDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      title: Text('alert !',style: TextStyle(fontSize: 20,color: Colors.red),),
      content: Text('are you sure ?',style: TextStyle(fontSize: 18,color: Colors.blue),),
      actions: [
        FlatButton(onPressed: (){
            Navigator.of(context).pop();
        }, 
        child: Text('dismiss',style: TextStyle(fontSize: 18,color: Colors.yellow))
        ),
        FlatButton(
          onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        }, child: Text('go to next',style: TextStyle(fontSize: 18,color: Colors.green)),
        ),
      ],
    );
  }
}

class IosDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
  title: Text("Dialog Title"),
  content: Text("This is my content"),
  actions: <Widget>[
    CupertinoDialogAction(
      isDefaultAction: true,
      child: Text("Yes"),
    ),
    CupertinoDialogAction(
      child: Text("No"),
    )
  ],
);
  }
}
