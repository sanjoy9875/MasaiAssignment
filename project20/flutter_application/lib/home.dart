import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double sliderValue = 0.0;

    final List<Widget> list = [];

    String age = '0';
    List listItem = [
      'male','female','others'
    ];

    Widget customTextField(){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "enter your data",
            border: OutlineInputBorder(),
          ),
        ),
      );
    }

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
      backgroundColor: Colors.deepPurple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [        
            Stack(
             children: [
               Card(
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                 child: Container(
                   margin: EdgeInsets.all(8.0),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: FlatButton(
                           color: Colors.green,
                           onPressed: (){
                              setState(() {
                                list.add(customTextField());
                              });
                           },
                            child: Text('Add Extra Text Field')),
                       ),
                       Column(
                         children:list,
                       ),
                      //  DropdownButton(
                      //    hint: Text('chose your age'),
                      //    dropdownColor: Colors.grey[200],
                      //    value: age,
                      //    onChanged: (newValue){
                      //      setState(() {
                      //        age = '$newValue';
                      //      });
                      //    },
                      //    items: listItem.map((valueItem) {
                      //      return DropdownMenuItem(
                      //        value: valueItem,
                      //        child: Text(valueItem),
                      //        );
                      //    }).toList(),
                      //    ),

                        // Slider(
                        // min: 18,
                        // max: 50,
                        // divisions: 32,
                        // value: sliderValue,
                        // onChanged: (newValue){
                        //     setState(() {
                        //       sliderValue = newValue;
                        //     });
                        // },
                        // ),

                       FlatButton(
                         color: Colors.redAccent,
                        onPressed: (){
                              getPlatformSpecificUi();
                        },
                        child: Text('Submit')
                        ),
                     ],
                   ),
                   
                 ),
               ),
               
             ],
            ),
        ],
      ),
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

class AndroidDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      title: Text('your details',style: TextStyle(fontSize: 20,color: Colors.red),),
      content: Text('a',style: TextStyle(fontSize: 18,color: Colors.blue),),
      actions: [
        FlatButton(onPressed: (){
            Navigator.of(context).pop();
        }, 
        child: Text('dismiss',style: TextStyle(fontSize: 18,color: Colors.yellow))
        ),
      
      ],
    );
  }
}