import 'dart:ui';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yellow_class_assignment/database/database_helper.dart';
import '../google_sign_in.dart';
import '../model/movie.dart';
import 'movie_detail.dart';

class MovieList extends StatefulWidget {

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Movie>? movieList;
  int count = 0;

  @override
  Widget build(BuildContext context) {

    // ignore: unused_local_variable
    final user = FirebaseAuth.instance.currentUser;

      if(movieList==null){ 
        movieList = [];    
        updateListView();
      }
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        actions: <Widget>[
          TextButton(
            child: Text('LogOut',style: TextStyle(color: Colors.white,fontSize: 16),),
                  onPressed: () {
                     final provider = Provider.of<GoogleSignInProvider>(context,listen:false);
                     provider.logout();
               },
              ),
            ],
      ),
      body: getMovieList(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
           navigateToMovieDetail(Movie('', '', '',null),'Add Movie');
        },
        child: Icon(Icons.add),
      ),
      
    );
  }
  ListView getMovieList(){

    return ListView.builder(
      itemCount: count,
      itemBuilder:(BuildContext context, int position){
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            color: Colors.white,
            elevation: 2.0,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4,top: 4,bottom: 4),
                    child: CircleAvatar(
                    radius: 40.0,
                    backgroundImage: 
                   FileImage(File('${this.movieList![position].image!}')),
                  ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Text(
                          '${this.movieList![position].movie!}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                            ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text('${this.movieList![position].director!}'),
                      ),
                    ],
                  ),
                  GestureDetector(
                    child: Icon(Icons.edit),
                     onTap: (){
                          navigateToMovieDetail(this.movieList![position],'Edit Movie');
                        },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                      child: Icon(Icons.delete),
                       onTap: (){
                           _delete(context, movieList![position]);
                          },
                      ),
                    ),
              ],
            ),
          ),
        );
      } ,
    );

  }

  void _delete(BuildContext context,Movie movie)async{
      int result = await databaseHelper.deleteMovie(movie.id!);
      if (result != 0) {
			_showSnackBar(context, 'Note Deleted Successfully');
			 updateListView();
		}
  }

  void _showSnackBar(BuildContext context, String message) {

		final snackBar = SnackBar(content: Text(message));
		ScaffoldMessenger.of(context).showSnackBar(snackBar);
	}

  void updateListView() {

		final Future<Database> dbFuture = databaseHelper.initializeDatabase();
		dbFuture.then((database) {

			Future<List<Movie>> movieListFuture = databaseHelper.getMovieList();
			movieListFuture.then((movieList) {
				setState(() {
				  this.movieList = movieList;
				  this.count = movieList.length;
				});
			});
		});
  }

  void navigateToMovieDetail(Movie movie,String title)async{
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context){
        return MovieDetail(movie,title);
    }),);
    if(result == true){
      updateListView();
    }
  }

}