import 'dart:developer';

import 'package:courses/modules/login/cubit/states.dart';
import 'package:courses/shared/const.dart';
import 'package:courses/shared/local/local.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  void login({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      uid = value.user!.uid;
      CacheHelper.setData(key: "uid", value: uid);
      emit(LoginSuccessState());
    }).catchError((e) {
      if (e is FirebaseAuthException) {
        Fluttertoast.showToast(
            msg: e.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 14.0);
      }
      log(e.toString());
      emit(LoginErrorState(e: e.toString()));
    });
  }
}
