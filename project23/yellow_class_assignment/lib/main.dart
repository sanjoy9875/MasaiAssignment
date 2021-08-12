import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yellow_class_assignment/authentication/google_sign_in.dart';
import 'package:yellow_class_assignment/screens/home_page.dart';

Future main()async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create:(context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,     
        home: HomePage(),   //first it will launch the HomePage widget 
      ),
    );
  
}

