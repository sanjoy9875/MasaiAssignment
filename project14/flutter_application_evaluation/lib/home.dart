

import 'package:flutter/material.dart';
import 'package:flutter_application_evaluation/httpService.dart';

import 'states.dart';

class Home extends StatelessWidget {
 
 final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: Container(
        child: Card(
          child: FutureBuilder(
          future: httpService.getStates(),
          builder: (BuildContext context,AsyncSnapshot<List<States>> snapshot){

              if(snapshot.hasData){
                List<States>? states = snapshot.data;

                return ListView(
                      children:states!.map((States states) => ListTile(title: Text(states.name),
                      ),
                      )
                      .toList(),
                );
              }

           return Center(child: CircularProgressIndicator());
          },
          
          ),
        ),
      )
    );
  }
}