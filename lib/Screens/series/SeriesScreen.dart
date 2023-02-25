import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Componannt/componants.dart';
import 'package:movies/Cubit/Cubit.dart';
import 'package:movies/Cubit/States.dart';
import 'package:movies/Screens/series/OneSerieScreen.dart';

class SeriesScreen extends StatelessWidget {
  const SeriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) => StreamBuilder(
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (AppCubit.get(context).theSeries.isEmpty) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else {
              return Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 220,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Container(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      itemBuilder: (context, index) => horizentalItem(
                        AppCubit.get(context).theSeries,
                        context,
                        index,
                        OneSerieScreen(index: index),
                      ),
                      itemCount: 10,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => virticalItem(
                                AppCubit.get(context).theSeries,
                                context,
                                index,
                                OneSerieScreen(index: index),
                              ),
                          separatorBuilder: (context, index) => const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                              ),
                          itemCount: AppCubit.get(context).theSeries.length),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
