import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {

  TextEditingController movieNameController = TextEditingController();
  TextEditingController directorNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Movies"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15,left: 10,right: 10),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15,bottom: 15),
              child: TextField(
                controller: movieNameController,
                onChanged: (value){

                },
                decoration: InputDecoration(
                  labelText: "movie name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                ),
              ),
              ),

               Padding(
              padding: EdgeInsets.only(top: 15,bottom: 15),
              child: TextField(
                controller: movieNameController,
                onChanged: (value){

                },
                decoration: InputDecoration(
                  labelText: "director name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                ),
              ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 15,bottom: 15),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){

                        },
                         child: Text("save"),
                         ),
                      ),
                      Container(width: 10.0,),
                      Expanded(
                      child: ElevatedButton(
                        onPressed: (){

                        },
                         child: Text("delete"),
                         ),
                      ),
                  ],
                ),
              )
          ],
        ),
        ),
    );
  }
}