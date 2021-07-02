import 'package:flutter/material.dart';

void main() {

  runApp(Calculator());

}

class Calculator extends StatefulWidget {

  @override
  _CalculatorState createState() => _CalculatorState();

}

class _CalculatorState extends State<Calculator> {

int firstNum=0;
int secondNum=0;
String res='';
String display='';
String operation='';

void btnClicked(String valBtn){

if(valBtn=='AC'){

firstNum=0;
secondNum=0;
res='';
display='';
operation='';

}
else if(valBtn=='+' || valBtn=='-' || valBtn=='*' || valBtn=='/'){

firstNum = int.parse(display);
res = '';
operation = valBtn;
}

else if(valBtn=='='){

secondNum = int.parse(display);

  if(operation=='+'){
    res = (firstNum + secondNum).toString();
  }
   if(operation=='-'){
    res = (firstNum - secondNum).toString();
  }
   if(operation=='*'){
    res = (firstNum * secondNum).toString();
  }
   if(operation=='/'){
    res = (firstNum ~/ secondNum).toString();
  }

}
else{
  res = int.parse(display + valBtn).toString();
}

setState(() {
  display = res;
});

}

Widget btnBackground(String valBtn){

return Container(
                margin: EdgeInsets.only(bottom:5),
                child: SizedBox(
                  height: 70,
                  width: 70,
                 child: FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10),),),
                      child: Text(valBtn,style: TextStyle(color: Colors.white,fontSize: 25),),
                   onPressed: ()=>btnClicked(valBtn),
                 color: Colors.blueGrey, 
                  ),
                ),
              );

}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Calculator'),
        backgroundColor: Colors.blueGrey,
        elevation: 10.0,
      ),
    body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
           Container(
            width: 400,
            height: 150,           
            color: Colors.grey,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 15,right: 15,bottom: 20),
            alignment: Alignment.center,
            child: Text('$display',style: TextStyle(fontSize: 30,color: Colors.white),),
          ),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                             
               btnBackground('AC'),
               btnBackground('C'),
               btnBackground('^'),
               btnBackground('+'),
              
            ],
          ),
             Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             
                
              btnBackground('1'),
              btnBackground('2'),
              btnBackground('3'),
              btnBackground('-'),         
              
            ],
          ),
             Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             
                
              btnBackground('4'),
              btnBackground('5'),
              btnBackground('6'),
              btnBackground('*'),              
              
            ],
          ),
             Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             
              btnBackground('7'),
              btnBackground('8'),
              btnBackground('9'),
              btnBackground('/'),
                                     
            ],
          ),
             Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
         
         btnBackground('+/-'),
         btnBackground('0'),
         btnBackground('.'),
         btnBackground('='),
              
            ],
          ),
        ],
      ),
    ),
    ),
  );
  }
}