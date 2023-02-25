import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Cubit/Cubit.dart';
import 'package:movies/Cubit/States.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              child: Stack(
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: ClipOval(
                      child: ConditionalBuilder(
                        condition: AppCubit.get(context).image == null,
                        builder: (context) =>
                            Image.asset('assets/Images/profile.jpg'),
                        fallback: (context) => Image.file(
                          fit: BoxFit.cover,
                          File(AppCubit.get(context).image!.path),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: ClipOval(
                      child: Container(
                        color: Colors.yellow[600],
                        child: IconButton(
                          onPressed: () {
                            AppCubit.get(context).getImageFromGallery();
                          },
                          icon: const Icon(
                            Icons.add_a_photo_outlined,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Dark mode",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                CupertinoSwitch(
                  activeColor: Colors.yellow[600],
                  value: AppCubit.get(context).switched,
                  onChanged: (bool value) => AppCubit.get(context).darkTheme() ,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
