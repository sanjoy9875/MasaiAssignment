import 'package:flutter/material.dart';


class Page3 extends StatefulWidget {


  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3>  with SingleTickerProviderStateMixin{

  AnimationController? controller;
  double value = 0.0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,duration: Duration(seconds: 1),upperBound: 100);

      var curve = CurvedAnimation(parent: controller!, curve: Curves.decelerate);

      controller?.repeat();
      controller?.addListener(() { 
        setState(() {
          value = controller!.value;
        });     
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            
            Hero(
                tag: 'image',
                child: Container(
                  margin: EdgeInsets.all(8),
                  height: value,
                  width: 30,
                  color: Colors.red,
                  
                ),
             
            ),
            
             Hero(
                tag: 'image',
                child: Container(
                    margin: EdgeInsets.all(8),
                  height: value,
                  width: 30,
                  color: Colors.blue,             
                ),
             
            ),
            
             Hero(
                tag: 'image',
                child: Container(
                  margin: EdgeInsets.all(8),
                  height: value,
                  width: 30,
                  color: Colors.green,
                  
                ),       
            ),
                ],
                ),             
              ),
            ],
            ),
            SizedBox(
              height: 40,
            ),
            Text('listening'),
          ],
        ),
        
      ),
    );
  }
}