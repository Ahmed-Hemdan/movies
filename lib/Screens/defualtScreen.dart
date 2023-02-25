import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Cubit/Cubit.dart';
import 'package:movies/Cubit/States.dart';

class DefualtScreen extends StatelessWidget {
  const DefualtScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: IconButton(
                onPressed: () {
                  AppCubit.get(context).changeAppTheme();
                },
                icon: const Icon(
                  Icons.brightness_4_outlined,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
          title: Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Container(
                width: 70,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.yellow[600],
                    borderRadius: BorderRadius.circular(5)),
                child: const Center(
                  child: Text(
                    'IMDb',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: AppCubit.get(context).screenItems,
          currentIndex: AppCubit.get(context).currentIndex,
          onTap: (index) {
            AppCubit.get(context).changeIndex(index);
          },
        ),
        body: AppCubit.get(context).screens[AppCubit.get(context).currentIndex],
      ),
    );
  }
}
