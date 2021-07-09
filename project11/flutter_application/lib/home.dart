import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application/result.dart';

class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


TextEditingController heightController = TextEditingController();
TextEditingController weightController = TextEditingController();


String calculateBmi(double height,double weight){

double res = weight / (height * height/10000);
String bmi = res.toStringAsFixed(2);
return bmi;

}
var mColor = Colors.grey;
var fColor = Colors.grey;
bool mIsSelected = false;
bool fIsSelected = false;

void maleBackGround(){

setState(() {
  if(!mIsSelected){
  mColor = Colors.blue;
  mIsSelected = true;
  }
 
});
}

void femaleBackGround(){
  
setState(() {
   if(!fIsSelected){
  fColor = Colors.pink;
  fIsSelected = true;
  }
  
});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed:(){},
           icon: Icon(Icons.notifications,color: Colors.white,),),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20,top: 20),
                    child: Text('BMI Calculator',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20,top: 30),
                    child: Text('Gender',style: TextStyle(color: Colors.white),)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(                  
                    child: Container(
                       margin: EdgeInsets.all(20),
                      height: 120,
                      width: 30,
                      child: FlatButton(
                        color: mColor,
                        onPressed: (){
                            maleBackGround();
                        }, 
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.male,color: Colors.white,),
                            Text('Male',style: TextStyle(color: Colors.white),),
                          ],
                        ),                  
                        ),
                    ),
                  ),
                      Expanded(
                    child: Container(
                      margin: EdgeInsets.all(20),
                      height: 120,
                      width: 30,
                      child: FlatButton(
                        color: fColor,
                        onPressed: (){
                          femaleBackGround();
                        }, 
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.female,color: Colors.white,),
                            Text('Female',style: TextStyle(color: Colors.white),),
                          ],
                        ),
                        ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text('Your weight in kg :',style: TextStyle(fontSize: 18,color: Colors.white),)),                   
                ],
              ),
              SizedBox(
                height: 20.0,
              ),             
                   Container(
                     margin: EdgeInsets.only(left: 10,right: 10),
                     child: TextField(    
                       controller: weightController,                
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'enter your weight',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                   ),
                     SizedBox(
                height: 20.0,
              ), 
               Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text('Your height in cm :',style: TextStyle(fontSize: 18,color: Colors.white),)),                   
                ],
              ),
                  SizedBox(
                height: 20.0,
              ),             
                   Container(
                     margin: EdgeInsets.only(left: 10,right: 10),
                     child: TextField(  
                       controller: heightController,                    
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'enter your height',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                   ),
                    SizedBox(
                height: 20.0,
              ), 
               Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text('Your age :',style: TextStyle(fontSize: 18,color: Colors.white),)),                 
                ],
              ),
                  SizedBox(
                height: 20.0,
              ),             
                   Container(
                     margin: EdgeInsets.only(left: 10,right: 10),
                     child: TextField(
                       
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'enter your age',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                   ),
                   SizedBox(
                     height: 40,
                   ),
                   Container(
                     width: double.infinity,                     
                     margin: EdgeInsets.only(left: 10,right: 10,bottom: 20),
                     height: 60.0,
                     child: FlatButton(                      
                       color: Colors.greenAccent,
                       onPressed: (){
                        double height = double.parse(heightController.text);
                        double weight = double.parse(weightController.text);
                        String data = calculateBmi(height, weight);

                         Navigator.push(context, MaterialPageRoute(
                           builder: (context) => Result(res: data),
                         ),
                         );
                     },
                      child: Text('Calculate',style: TextStyle(color: Colors.white),)),
                   )
              
            ],
          ),
        ),
      ),
    );
  }
}