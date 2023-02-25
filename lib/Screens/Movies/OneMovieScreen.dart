import 'package:flutter/material.dart';
import 'package:movies/Componannt/componants.dart';
import '../../Cubit/Cubit.dart';

class OneMovieScreen extends StatelessWidget {
  final int index;
  const OneMovieScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: oneItemShown(
          AppCubit.get(context).theMovies,
          index,
          context,
        ),
      ),
    );
  }
}
