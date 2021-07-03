// ignore: import_of_legacy_library_into_null_safe
import 'package:audioplayers/audio_cache.dart';
// ignore: unused_import
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MusicPlayer(),
    );
  }
}

class MusicPlayer extends StatefulWidget {

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {

  FlatButton btn(String songName,String singerName,int image,int number){
    return  FlatButton(
            onPressed: (){
              playSound(number);
            },
            child: Card(
              elevation: 10,
              child: Row(
                    
                children: [
                      
                    Container(
                      margin: EdgeInsets.all(8),
                      height: 80,
                      width: 80,
                      child: Image.asset('assets/image$image.jpeg'),
                    ),
                      
                    Column(
                      
                      children: [
                        Text('$songName',style: TextStyle(fontSize: 20),),
                        Text('$singerName',style: TextStyle(fontSize: 20),),
                      ],
                      
                    ),                      
                ],
              ),
            ),
          );
  }


  void playSound(int fileNumber) {
    final player = AudioCache();
    player.play('music$fileNumber.mp3');

    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
      ),
      body: Column(
        children: [
         btn('A long cold', 'Riot',1, 1),
         btn('Baroque coffe house', 'Doug Maxwell',2, 2),
         btn('crystal', 'orbs',3, 3),
         btn('Sweet Release', 'MK2',4, 4),
        ],
        
      ),
    );
  }
}