import 'dart:developer';
import 'package:courses/components/components.dart';
import 'package:courses/layout/layout.dart';
import 'package:courses/modules/login/cubit/cubit.dart';
import 'package:courses/modules/login/cubit/states.dart';
import 'package:courses/modules/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LogIn extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(builder: (context, state) {
      var cubit = LoginCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Log In",
            style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontSize: 18.sp,
            ),
          ),
          // bottom: PreferredSize(
          //     preferredSize: const Size.fromHeight(1.0),
          //     child: Container(
          //       color: Colors.grey.withOpacity(0.5),
          //       height: 1,
          //     )),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      thirdLogInParty(image1: "google", image2: "facebook"),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Or use your email account to login",
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.7),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "Email",
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.7),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Container(
                        padding: const EdgeInsetsDirectional.only(start: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.black,
                            )),
                        child: Row(
                          children: [
                            Icon(
                              Icons.mail,
                              color: Colors.black,
                              size: 24.sp,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Expanded(
                              child: Container(
                                child: textFromField(
                                    func: (s) {
                                      if (s!.isEmpty) {
                                        return "Please enter your Email";
                                      }
                                      return null;
                                    },
                                    textInputType: TextInputType.emailAddress,
                                    hint: "Email",
                                    textEditingController: email),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.7),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Container(
                        padding: const EdgeInsetsDirectional.only(start: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.black,
                            )),
                        child: Row(
                          children: [
                            Icon(
                              Icons.lock,
                              color: Colors.black,
                              size: 24.sp,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Expanded(
                              child: Container(
                                child: textFromField(
                                    func: (s) {
                                      if (s!.isEmpty) {
                                        return "Please enter your pass";
                                      }
                                      return null;
                                    },
                                    textInputType: TextInputType.number,
                                    obscure: true,
                                    hint: "Password",
                                    textEditingController: password),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      forgetPasswrod(forget: "Forget Password"),
                      SizedBox(
                        height: 20.h,
                      ),
                      if (state is LoginLoadingState)
                        const LinearProgressIndicator(),
                      if (state is! LoginLoadingState)
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromARGB(255, 38, 49, 204)),
                          child: button(
                              data: "LOG IN",
                              fontSize: 16.sp,
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.login(
                                      email: email.text.trim(),
                                      password: password.text.trim());
                                }
                              },
                              colorOfStyle: Colors.white),
                        ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            border: Border.all(color: Colors.black)),
                        child: button(
                            data: "REGITER",
                            fontSize: 16.sp,
                            function: () {
                              navigator(context: context, widget: Register());
                            },
                            colorOfStyle: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }, listener: (context, state) {
      if (state is LoginSuccessState) {
        navigatorAndReplacement(context: context, widget: Layout());
      }
      if (state is LoginErrorState) {
        log("===================================");
        Fluttertoast.showToast(
            msg: state.e.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        log(state.e.toString());
        log("===================================");
      }
    });
  }
}

Widget forgetPasswrod({required String forget}) {
  return Text(
    forget,
    style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.underline),
  );
}
