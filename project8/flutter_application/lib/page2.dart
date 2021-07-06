import 'package:flutter/material.dart';
import 'package:flutter_application/page3.dart';

class Page2 extends StatefulWidget {


  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {

var c1 = Colors.white;
var c2 = Colors.white;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('quiz app'),
          backgroundColor: Colors.black12,
        ),
        body: Column(
            children: <Widget>[

              Container(
                margin: EdgeInsets.all(20),
                  child: Text('2. What amounts (in litres) of 90% and 97% pure acid solutions are mixed to obtain 21 L of 95% pure acid solution?',
                  style: TextStyle(color: Colors.white),),
              ),
              RaisedButton(
                
                child: Text('A. 14 & 15L'),
                color: c1,
                onPressed: (){ 
                  setState(() {
                     c1 = Colors.green;
                    c2 = Colors.white;
                  });                
              },
              ),
                  RaisedButton(
                child: Text('B. 6 & 15L'),
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

              FlatButton(
                color: Colors.greenAccent,
                child: Text('next'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Page3()));
              },
              ),
            ],
        ),
      );    
  
  }
}