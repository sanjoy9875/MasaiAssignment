import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool playing = false;
  late AudioPlayer player;
  late AudioCache cache;
  IconData playBtn = Icons.play_arrow;
  Color c = Colors.white;
  void playMusic(int number){
   
  }

  @override
  void initState(){
    super.initState();
    player = AudioPlayer();
    cache = AudioCache(fixedPlayer: player);
  }


Card cardItem(String songName,String singerName,int number){
  return  Card(
                  margin: EdgeInsets.all(5),
                color: c,
                  child: Center(
                    child: Row(
                  
                     children: [
                       Container(
                         
                          
                              padding: EdgeInsets.all(10),
                            ),
                       Column(
                          
                          children: [
                           
                            Text('$songName',style: TextStyle(fontSize: 20),),
                            Text('$singerName',style: TextStyle(fontSize: 15),),
                          ],
                
                       ),
                       FlatButton(
                         onPressed: (){
              
                         },
                         child: Container(
                      
                           color: Colors.grey,
                           height: 30,
                           width: 30,
                           margin: EdgeInsets.only(left: 50),
                           child: Icon(Icons.add),
                         ),
                       ),
                        FlatButton(
                         onPressed: (){
                            if(!playing){
                              cache.play('music$number.mp3');
                            
                            setState(() {
                              c = Colors.blueAccent;
                              playBtn = Icons.pause;
                              playing = true;

                            });
                            }
                            else{
                              player.pause();
                              
                              setState(() {
                                c = Colors.white;
                                playBtn = Icons.play_arrow;
                                playing = false;
                              });
                            }

                         },
                         child: Container(
                           color: Colors.grey,
                         height: 30,
                         width: 30,
                          
                           child: Icon(playBtn),
                         ),
                       ),
                     ],
                               ),
                  ),
                );
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(

          child: Column(
           children: [

             Row(
               children: [
                  
              

               ],
             ),

               cardItem('music1','artist1',1),
               cardItem('music2','artist2',2),
               cardItem('music3','artist3',3),
               cardItem('music4','artist4',4),
              
           ],
          ),

        ),
      ),
      
    );
  }
}