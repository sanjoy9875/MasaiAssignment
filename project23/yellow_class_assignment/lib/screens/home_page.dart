import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yellow_class_assignment/screens/movie_list.dart';
import 'package:yellow_class_assignment/screens/sign_up.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
        }
        else if(snapshot.hasError){
          return Center(child: Text('something went wrong'),);
        }
        else if(snapshot.hasData){
          return MovieList();
        }
        else{
          return SignUp();
        }
      },
    ),
  );
      
  
}