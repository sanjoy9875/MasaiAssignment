import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../google_sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
          padding: const EdgeInsets.only(left: 32,right: 32,bottom: 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [           
              FlutterLogo(size: 120,),
              SizedBox(height: 100),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Hey There, \nWelcome Back',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
               Align(
                alignment: Alignment.centerLeft,
                child: Text('Login to your account to continue',
                style: TextStyle(fontSize: 16),
                ),
              ),
               SizedBox(height: 100),
              GestureDetector(
                onTap: (){
                  final provider = Provider.of<GoogleSignInProvider>(context,listen:false);
                  provider.googleLogIn();
                   },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                   child: Card(
                    color: Colors.black,
                    elevation: 8,
                     shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                       width: 1,
                       color: Colors.grey,
                     ),
                   ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/google.svg',
                      height: 25,
                      width: 25,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Continue with Google',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      
    );
  }
}