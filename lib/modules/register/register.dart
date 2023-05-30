import 'package:courses/components/components.dart';

import 'package:courses/modules/login/login.dart';
import 'package:courses/modules/register/cubit/cubit.dart';
import 'package:courses/modules/register/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Register({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
        builder: (context, state) {
      var cubit = RegisterCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Sign Up",
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
                        height: 15.h,
                      ),
                      Text(
                        "Name",
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
                              Icons.person,
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
                                        return "Please enter your name";
                                      }
                                      return null;
                                    },
                                    textInputType: TextInputType.name,
                                    hint: "Name",
                                    textEditingController: name),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "Phone",
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
                              Icons.phone,
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
                                        return "Please enter your phone";
                                      }
                                      return null;
                                    },
                                    textInputType: TextInputType.number,
                                    hint: "phone",
                                    textEditingController: phone),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      if (state is RegisterLoadingState)
                        const LinearProgressIndicator(),
                      if (state is! RegisterLoadingState)
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromARGB(255, 38, 49, 204)),
                          child: button(
                              data: "Sign Up",
                              fontSize: 16.sp,
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.createUser(
                                    email: email.text.trim(),
                                    name: name.text.trim(),
                                    password: password.text.trim(),
                                    phone: phone.text.trim(),
                                  );
                                }
                              },
                              colorOfStyle: Colors.white),
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
      if (state is RegisterSuccessState) {
        navigatorAndReplacement(context: context, widget: LogIn());
      }
    });
  }
}
