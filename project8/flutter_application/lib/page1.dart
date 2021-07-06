import 'package:flutter/material.dart';
import 'package:flutter_application/page2.dart';

class Page1 extends StatefulWidget {

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {

var c1 = Colors.white;
var c2 = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
      
        body: Column(
            children: <Widget>[

              Container(
                margin: EdgeInsets.all(20),
                  child: Text('1. Two numbers are such as that square of one is 224 less than 8 times the square of the other. If the numbers are in the ratio of 3 : 4, they are?',
                  style: TextStyle(color: Colors.white),),
              ),
              RaisedButton(
                
                child: Text('A. 12 , 16'),
                color: c1,
                onPressed: (){  
                  setState(() {
                    c1 = Colors.green;
                    c2 = Colors.white;
                  });               
              },
              ),
                  RaisedButton(
                child: Text('B. 6 , 8'),
                color: c2,
                onPressed: (){  
                  setState(() {
                     c2 = Colors.green;
                    c1 = Colors.white;  
                  });             
              },
              ),

               SizedBox(
                height: 50,
              ),

              RaisedButton(
                color: Colors.greenAccent,
                child: Text('next'),
                onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Page2()));
              },
              ),
            ],
        ),
      );   
  }
}