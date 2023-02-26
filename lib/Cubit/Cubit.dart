import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Cubit/States.dart';
import 'package:movies/Models/MoviesModel.dart';
import 'package:movies/Models/SeriesModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/Screens/Movies/MoviesScreen.dart';
import 'package:movies/Screens/Profile/ProfileScreen.dart';
import 'package:movies/Screens/series/SeriesScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movies/Shared/SharedPreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());

  static AppCubit get(context) => BlocProvider.of(context);
  List<String> titles = ['Movies', 'Series', 'Profile'];
  List<Widget> screens = const [
    MoviesScreen(),
    SeriesScreen(),
    ProfileScreen()
  ];
  List<BottomNavigationBarItem> screenItems = const [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.movie_creation_outlined,
        ),
        label: 'Movies'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.theaters_outlined,
        ),
        label: 'Series'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.display_settings_outlined,
        ),
        label: 'Personalize'),
  ];
  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    if (theMovies.isEmpty) {
      fetchMovies();
    } else if (theSeries.isEmpty) {
      fethchSeries();
    }
    emit(ChangeScreenIndex());
  }

  List<Movie> theMovies = [];

  Future<List<Movie>?> fetchMovies() async {
    String url = 'https://imdb-api.com/en/API/Top250Movies/k_rnl670jw';
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        Items items = Items.fromJson(jsonData);
        theMovies = items.moviesList!.map((e) => Movie.fromJson(e)).toList();
      } else {
        print('Status code = ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }

    emit(GetMoviesApi());
    return null;
  }

  List<Series> theSeries = [];
  Future<List<Series>?> fethchSeries() async {
    try {
      http.Response response = await http
          .get(Uri.parse('https://imdb-api.com/en/API/Top250TVs/k_rnl670jw'));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        ItemsSeries itemsSeries = ItemsSeries.fromJson(jsonData);
        theSeries =
            itemsSeries.seriesList!.map((e) => Series.fromJson(e)).toList();
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
    emit(GetSeriesApi());
    return null;
  }

  XFile? image;

  getImageFromGallery() async {
    image = await ImagePicker().pickImage(source: ImageSource.gallery);
    emit(GetImageFromGallery());
  }

  getImageFromCamera() async {
    image = await ImagePicker().pickImage(source: ImageSource.camera);
    emit(GetImageFromCamera());
  }

  bool isDark = false;
  void changeAppTheme({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(SwitchDarkTheme());
    } else {
      isDark = !isDark;
      Cachhelper.putDarkData(key: "isDark", value: isDark).then(
        (value) => emit(
          SwitchDarkTheme(),
        ),
      );
    }
  }

  void callTwo(value) {
    fetchMovies();
    changeAppTheme(fromShared: value);
  }
}
