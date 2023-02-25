import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Cubit/BlocObserver.dart';
import 'package:movies/Cubit/Cubit.dart';
import 'package:movies/Cubit/States.dart';
import 'package:movies/Screens/SplashScreen.dart';
import 'package:movies/Shared/SharedPreferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Cachhelper.init();
  bool? isDark = Cachhelper.getDarkData(key: "isDark");
  runApp(MyApp(isDark: isDark!,));
}

class MyApp extends StatelessWidget {
  bool isDark;
  MyApp({
    Key? key,
    required this.isDark
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..changeAppTheme(
        fromShared: isDark
      ),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movie',
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.white,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                selectedItemColor: Colors.yellow[600],
                unselectedItemColor: Colors.grey,
                elevation: 30,
              ),
              scaffoldBackgroundColor: Colors.white,
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                bodyText2: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
              primaryColor: Colors.yellow[600],
              primarySwatch: Colors.yellow),
          darkTheme: ThemeData(
              appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.black,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light,
                  statusBarColor: Colors.black,
                ),
              ),
              primaryColor: Colors.yellow[600],
              scaffoldBackgroundColor: Colors.black,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.black,
                selectedItemColor: Colors.yellow[600],
                unselectedItemColor: Colors.grey,
                elevation: 30,
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                bodyText2: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
              primarySwatch: Colors.yellow),
          themeMode: AppCubit.get(context).isDark == true
              ? ThemeMode.dark
              : ThemeMode.light,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
