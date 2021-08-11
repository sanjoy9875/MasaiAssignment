

class Movie{
  int? _id;
  String? _movie;
  String? _director;
  String? _date;
  String? _image;

  Movie(this._movie,this._director,this._date,this._image);

  Movie.withId(this._id,this._movie,this._director,this._date,this._image);

  int? get id => _id;
  String? get movie => _movie;
  String? get director => _director;
  String? get date => _date;
  String? get image => _image;

  set movie(String? newMovie){
      if(newMovie!.length<=255){
        this._movie = newMovie;
      }
  }

   set director(String? newDirector){
      if(newDirector!.length<=255){
        this._director = newDirector;
      }
  }

   set date(String? newDate){
      if(newDate!.length<=255){
        this._date = newDate;
      }
  }

  set image(String? newImage){
      if(newImage!=null){
        this._image = newImage;
      }
  }

//convert a Movie object into a Map object
  Map<String, dynamic> toMap(){
    var map = Map<String ,dynamic>();

    if(id!=null){
      map['id'] = _id;
    }
    map['movie'] = _movie;
    map['director'] = _director;
    map['image'] = _image;

    return map;
  }

//extract a Movie object from a Map object
  Movie.fromMapObject(Map<String,dynamic> map){
    this._id = map['id'];
    this._movie = map['movie'];
    this._director = map['director'];
    this._date = map['date'];
    this._image = map['image'];
  }

}