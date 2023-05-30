import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses/models/register_model.dart';
import 'package:courses/modules/register/cubit/states.dart';
import 'package:courses/shared/local/local.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  void createUser({
    required String email,
    required String name,
    required String password,
    required String phone,
  }) {
    emit(RegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((v) {
      CacheHelper.setData(key: "uid", value: v.user!.uid);
      v.user!.sendEmailVerification().then((value) {
        storeRegister(
            email: email,
            name: name,
            password: password,
            phone: phone,
            uid: v.user!.uid);
        log("message");
      });
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
      emit(RegisterErrorState(e: e.toString()));
    });
  }

  void storeRegister(
      {required String email,
      required String name,
      required String password,
      required String phone,
      required String uid}) {
    RegisterModel registerModel = RegisterModel(
        email: email, name: name, password: password, phone: phone, uid: uid);
    FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .set(registerModel.toMap())
        .then((value) {
      emit(RegisterSuccessState());
    }).catchError((e) {
      log(e.toString());
      emit(CreateRegisterErrorState());
    });
  }
}
