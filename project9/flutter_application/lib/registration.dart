import 'package:flutter/material.dart';
import 'package:flutter_application/preview.dart';


class Registration extends StatefulWidget {



  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {


 List<Widget> list = [];
 var name;
 final nameCon = new TextEditingController();

Widget add(){

  return Container(
    margin: EdgeInsets.all(20),
    child: TextField(
      controller: nameCon,
      decoration: InputDecoration(hintText: "enter your data"),
    ),

  );
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text('Registration'),
              ),
              body: Center(
                child: Column(

                    children: [
                                            
                       Column(
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                  Container(
                                    child: Text('Registartion Form ',style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),
                                  ),

                                  FloatingActionButton(
                                    backgroundColor: Colors.white,
                                    mini: true,
                                    child: Icon(Icons.add,color: Colors.red,size: 30,),
                                    onPressed:(){
                                      setState(() {
                                         list.add(add());
                                      });                                  
                                  },
                                  ),
                              ],
                            ),       
                          ],
                       ),
                         Column(
                            children:
                              list,                          
                        ),
                        Column(

                          children: [
                            RaisedButton(
                              child: Text('Go to Preview'),
                              onPressed: (){
                                  String data = nameCon.text;
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Preview(name: data)));

                            },
                            ),
                          ],
                        ),
                    ],

                ),
              ),
            );
    
  }
}