import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yellow_class_assignment/database/database_helper.dart';
import 'package:yellow_class_assignment/model/movie.dart';
import 'package:image_picker/image_picker.dart';

class MovieDetail extends StatefulWidget {

  final String appBarTitle;
  final Movie movie;
  MovieDetail(this.movie,this.appBarTitle);

  @override
  _MovieDetailState createState() => _MovieDetailState(this.movie,appBarTitle);
}

class _MovieDetailState extends State<MovieDetail> {

  PickedFile? _imageFile;
  String? imageString;
  final ImagePicker _picker = ImagePicker();

   late String appBarTitle;
   Movie movie;
  _MovieDetailState(this.movie,this.appBarTitle);

  DatabaseHelper helper = DatabaseHelper();

  TextEditingController movieNameController = TextEditingController();
  TextEditingController directorNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    movieNameController.text = movie.movie! ;
    directorNameController.text = movie.director!;
    if(imageString==null){
       imageString = movie.image;
    }

    return  Scaffold(
        appBar: AppBar(
          title: Text("$appBarTitle"),
          leading: IconButton(
            onPressed: (){
            moveToLastScreen();
          },
           icon: Icon(Icons.arrow_back)),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15,left: 10,right: 10),
          child: ListView(
            children: <Widget>[
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 80.0,
                    backgroundImage: imageString==null?
                    AssetImage('assets/bill_gates.png'):
                   FileImage(File(imageString!)) as ImageProvider,
                   
                  ),                 
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: InkWell(
                      onTap: (){
                          getPhoto(ImageSource.gallery);                                                                           
                      },
                      child: Icon(Icons.add_circle,size: 50,color: Colors.white38),
                      ),
                    ),
                ],
              ),
            ),

              Padding(
                padding: EdgeInsets.only(top: 15,bottom: 15),
                child: TextField(
                  controller: movieNameController,
                  onChanged: (value){
                      updateMovieName();
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
                  controller: directorNameController,
                  onChanged: (value){
                    updateDirectorName();
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
                            setState(() {
                              _save();
                              print('saved');
                            });                           
                          },
                           child: Text("save"),
                           ),
                        ),
                        Container(width: 10.0,),
                        Expanded(
                        child: ElevatedButton(
                          onPressed: (){
                            setState(() {
                              _delete();
                            });

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

  void getPhoto(ImageSource source)async{
    // ignore: deprecated_member_use
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile!;  
      imageString = _imageFile!.path;
    
    });
  }

 void moveToLastScreen() {
		Navigator.pop(context,true);
   
  }

  void updateMovieName(){
    movie.movie = movieNameController.text;
  }

  void updateDirectorName(){
    movie.director = directorNameController.text;
  }

  void _save()async{

      moveToLastScreen();
      movie.date = DateFormat.yMMMd().format(DateTime.now());
      movie.image = imageString;
      print('image from gallery ${movie.image}');
      int result ;

      if(movie.id != null){
         result =  await helper.updateMovie(movie);
      }
      else{
          result = await helper.insertMovie(movie);
      }
      if (result != 0) {  // Success
			_showAlertDialog('Status', 'Movie Saved Successfully');
		} else {  // Failure
			_showAlertDialog('Status', 'Problem Saving Movie');
		}
  }

  void _delete() async {

		moveToLastScreen();

		// Case 1: If user is trying to delete the NEW NOTE i.e. he has come to
		// the detail page by pressing the FAB of NoteList page.
		if (movie.id == null) {
			_showAlertDialog('Status', 'No Movie was deleted');
			return;
		}

		// Case 2: User is trying to delete the old note that already has a valid ID.
		int result = await helper.deleteMovie(movie.id!);
		if (result != 0) {
			_showAlertDialog('Status', 'Movie Deleted Successfully');
		} else {
			_showAlertDialog('Status', 'Error Occured while Deleting Note');
		}
	}

  void _showAlertDialog(String title, String message) {

		AlertDialog alertDialog = AlertDialog(
			title: Text(title),
			content: Text(message),
		);
		showDialog(
				context: context,
				builder: (_) => alertDialog
		);
	}

}