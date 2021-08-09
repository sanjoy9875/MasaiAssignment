import 'package:flutter/material.dart';

class MovieList extends StatefulWidget {

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: getMovieList(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.add),
      ),
      
    );
  }
  ListView getMovieList(){

    return ListView.builder(
      itemCount: count,
      itemBuilder:(BuildContext context, int position){
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              child: Image.asset(""),
            ),
            title: Text("Avengers"),
            subtitle: Text("Joss Whedon"),
            trailing: Icon(Icons.delete),
            
          ),
        );
      } ,
    );

  }
}