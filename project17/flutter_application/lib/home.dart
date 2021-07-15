import 'package:flutter/material.dart';
import 'package:flutter_application/page1.dart';
import 'package:flutter_application/page2.dart';
import 'package:flutter_application/page3.dart';


class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Page1()));
            },
            child: Text('go to page 1'),
            ),
            RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Page2()));
            },
            child: Text('go to page 2'),
            ),
             RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Page3()));
            },
            child: Text('go to page 2'),
            ),
          ],
        ),
      ),
    );
  }
}