import 'dart:math';

import 'package:flutter/material.dart';


class Page2 extends StatefulWidget {

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> with SingleTickerProviderStateMixin{

  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
      );

      _controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller.view,
           builder: (context,child){
              return Transform.rotate(
                angle: _controller.value * 2 * pi,
                child: child,
                );
           },
           child: Container(
             width: 100,
             height: 100,
             color: Colors.green,
           ),
          ),
      ),    
    );
  }
}