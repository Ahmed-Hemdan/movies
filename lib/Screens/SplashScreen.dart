import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:movies/Cubit/Cubit.dart';
import 'package:movies/Screens/defualtScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        backgroundColor: AppCubit.get(context).isDark == false
            ? Colors.white
            : AppCubit.get(context).isDark == true
                ? Colors.black
                : Colors.white,
        duration: 500,
        splashTransition: SplashTransition.fadeTransition,
        splash: const Icon(
          Icons.movie_filter_outlined,
          color: Colors.yellow,
          size: 130,
        ),
        nextScreen: const DefualtScreen(),
      ),
    );
  }
}
