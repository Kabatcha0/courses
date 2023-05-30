import 'dart:developer';

import 'package:courses/modules/chat/chat.dart';
import 'package:courses/modules/home/home.dart';
import 'package:courses/modules/person/person.dart';
import 'package:courses/modules/play/play.dart';
import 'package:courses/modules/search/search.dart';
import 'package:courses/shared/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:courses/layout/cubit/states.dart';

class CoursesCubit extends Cubit<CoursesStates> {
  CoursesCubit() : super(CoursesInitialState());
  static CoursesCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  void bottomNavigation(int index) {
    currentIndex = index;

    emit(CoursesBottomNavigationBarState());
  }

  List<Widget> screens = [
    Home(),
    const Search(),
    const Play(),
    const Chat(),
    const Person()
  ];
  List<String> appBar = ["Home", "Search", "Play", "Chat", "Person"];
  void signOutAndRemoveUid() {
    FirebaseAuth.instance.signOut().then((value) {
      uid = "";
      log("message");
      emit(CoursesSignOutSuccessState());
    }).catchError((e) {
      log(e.toString());
      emit(CoursesSignOutErrorState());
    });
  }
}
