
import 'dart:ui';

import 'package:flutter/material.dart';

class Result extends StatelessWidget {

 final String res;
  Result({ Key? key , required this.res}) : super(key: key);
  
var color = Colors.black;

String calculate(){

double result = double.parse(res);

  if(result<=18.49){
    color = Colors.yellow;
    return 'underweight';
  }
  else if(result>=18.5 && result<=24.99){
    color = Colors.green;
    return 'normal weight';
  }
  else if(result>=25 && result<=29.99){
    color = Colors.orange;
    return 'over weight';
  }
  else{
    color = Colors.red;
    return 'obese';
  }

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Text(calculate(),style: TextStyle(fontSize: 20,color: color,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),

    );
  }
}