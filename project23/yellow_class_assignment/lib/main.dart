import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:yellow_class_assignment/google_sign_in.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create:(context) => GoogleSignInProvider(),
      child: MaterialApp(
        home: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                      provider.googleLogIn();
                    }, 
                    child: Text('google')),
              //     GestureDetector(
              //       onTap: (){
                     
              //       },
              //   child: Container(
              //   width: 300,
              //   height: 60,
              //   child: Card(
              //   color: Colors.black,
              //   elevation: 8,
              //   shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(15),
              //   side: BorderSide(
              //     width: 1,
              //     color: Colors.grey,
              //   ),
              // ),
              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     SvgPicture.asset(
              //       'assets/google.svg',
              //       height: 25,
              //       width: 25,
              //     ),
              //     SizedBox(
              //       width: 15,
              //     ),
              //     Text(
              //       'Continue with Google',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 17,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
                ],
              ),
            ),
        ),
      ),
    );
  
}