import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
       home: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                      Row(
                        children: <Widget>[
                            Container(
                              height: 50.0,
                              width: 50.0,
                              margin: EdgeInsets.only(left: 20.0),
                             
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: NetworkImage('https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
                                      fit: BoxFit.fill
                                      
                                    ),
                                    shape: BoxShape.circle

                                ) ,

                            ),
                            Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text('Sanjoy Paul',style:TextStyle(color: Colors.white)),
                            ),     
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        
                        children: <Widget>[
                               Container(
                                 height: 200.0,
                                 width: 340.0,
                                margin: EdgeInsets.only(top:10,left: 10,right: 10),
                                decoration: BoxDecoration(
                                   color: Colors.black,
                                  image: DecorationImage(
                                    image: NetworkImage('https://image.freepik.com/free-vector/instagram-post-with-transparent-background_23-2147814649.jpg'),
                                    fit: BoxFit.fill
                                  ),
                                ),
                            ),
                        ],
                      ),
                      Row(
                        
                       children: <Widget>[
                         Container(
                         padding: EdgeInsets.all(5),
                           margin: EdgeInsets.only(left:20,right: 5.0),
                           child: Icon(
                             Icons.person,
                             size: 30,
                             color: Colors.white,
                             )
                           ),
                         Container(
                            padding: EdgeInsets.all(5),
                           margin: EdgeInsets.only(left:5.0,right: 5.0),
                           child: Icon(
                             Icons.chat,
                             size: 30.0,
                             color: Colors.white,
                             ),
                             ),
                         Container(
                            padding: EdgeInsets.all(5),
                           margin: EdgeInsets.only(left:5.0,right: 5.0),
                           child: Icon(Icons.send,
                           color: Colors.white,
                           size: 30,
                           ),
                           ),
                            Container(
                            padding: EdgeInsets.all(5),
                           margin: EdgeInsets.only(left:130.0,right: 5.0),
                           child: Icon(Icons.threed_rotation_rounded,
                           color: Colors.white,
                           size: 30,
                           ),
                           ),
                       ],
                      ),
                      Row(
                        children: <Widget>[

                          Container(
                            margin: EdgeInsets.only(left:25.0,top:10.0),
                              child: Text('140,040 views',style:TextStyle(color:Colors.white,fontSize:20,),),
                          ),
                           Container(
                            margin: EdgeInsets.only(left:5.0,top:10.0),
                              child: Text(' . liked by Rohit ... ',style:TextStyle(color:Colors.white,fontSize:15,),),
                          ),

                        ],
                      ),
                       Row(
                        children: <Widget>[      
                          Expanded(
                             child: Container(
                              margin: EdgeInsets.only(left:25.0,top:10.0),
                                child: Text('nikhil UPI has made digital payments hassle-free and is certainly a need of the hour...',style:TextStyle(color:Colors.white,fontSize:16,),),
                            ),
                          ),
                        ],
                      ),
                       Row(
                        children: <Widget>[      
                          Expanded(
                             child: Container(
                              margin: EdgeInsets.only(left:25.0,top:10.0),
                                child: Text('view all 1650 comments',style:TextStyle(color:Colors.grey,fontSize:16,),),
                            ),
                          ),
                        ],
                      ),
                  ],
              ),
          ) ,
        ),
    );
  }
}

