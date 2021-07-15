import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {


  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {

    double _width = 100;
    double _height = 100;
    Color color = Colors.amber;

    void _updateStae(){
      setState(() {
        _width = 200;
        _height = 200;
        color = Colors.green;
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            RaisedButton(
              onPressed: (){
                  _updateStae();
            },
            
            child: Text('animate'),
            ),

            AnimatedContainer(
              duration: Duration(milliseconds: 1000),
                height: _height,
                width: _width,
                color: color,
                child: Center(
                  child: Text(
                    'animation',
                    style: Theme.of(context).textTheme.headline5,
                    ),
                ),
            ),
          ],
        ),
      ),      
    );
  }
}