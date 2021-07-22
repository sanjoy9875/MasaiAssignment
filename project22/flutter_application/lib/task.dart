import 'package:flutter/material.dart';

class Task extends StatefulWidget {
   
  @override
  _TaskState createState() => _TaskState();
 
}

class _TaskState extends State<Task> {


  final texteditingcontroller = TextEditingController();
  bool validated = true;
  String errtext = "";
  List<String> myitems = [];
 

  void showAlertDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: Text(
                "My Task",
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: texteditingcontroller,
                    autofocus: true,  
                    decoration: InputDecoration(
                      errorText: validated ? null : errtext,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            if (texteditingcontroller.text.isEmpty) {
                              setState(() {
                                errtext = "Can't Be Empty";
                                validated = false;
                              });
                            } else if (texteditingcontroller.text.length >
                                500) {
                              setState(() {
                                errtext = "Too many Chanracters";
                                validated = false;
                              });
                            } else {
                             setState((){
                               String text = texteditingcontroller.text.toString();
                                myitems.add('$text');
                                validated = true;                                
                             });                             
                            }                            
                          },
                          color: Colors.blue,
                          child: Text("Save",
                              style: TextStyle(
                                fontSize: 18.0,
                              )),
                            
                        ),
                        RaisedButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          child: Text('Dismiss',
                          style: TextStyle(
                                fontSize: 18.0,
                            )
                          ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    if (myitems.length == 0) {
    return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: showAlertDialog,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.blue,
              ),
              appBar: AppBar(
                backgroundColor: Colors.black,
                centerTitle: true,
                title: Text(
                  "My Tasks",
                ),
              ),
              backgroundColor: Colors.black,
              body: Center(
                child: Text(
                  "No Task Avaliable",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            );
          }
          else{
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: showAlertDialog,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.blue,
              ),
              appBar: AppBar(
                backgroundColor: Colors.black,
                centerTitle: true,
                title: Text(
                  "My Tasks",
                ),
              ),
              backgroundColor: Colors.black,
              body: ListView.builder(
                itemCount: myitems.length,
                itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Card(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text('${myitems[index]}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                                ),
                              ),
                            ],
                          ),
                      ),
                    );
                },
                ),
            );
          }
        }
      }
 

