import 'package:courses/components/components.dart';
import 'package:courses/modules/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoarding extends StatelessWidget {
  PageController pageController = PageController();

  OnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200.h,
            width: 200.w,
            child: Image.asset(
              "assets/full course.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          SizedBox(
            height: 150.h,
            child: PageView(
              controller: pageController,
              physics: const BouncingScrollPhysics(),
              children: [
                column(
                    buttonText: "Next",
                    context: context,
                    index: 1,
                    title: "First See Learning",
                    pageController: pageController,
                    desc:
                        "Forget about a for of paper all knowledge in on learning"),
                column(
                    buttonText: "Next",
                    context: context,
                    index: 2,
                    title: "Connect with everyone",
                    pageController: pageController,
                    desc:
                        "Always keep in touch with your tutor & friend. let's get connected!"),
                column(
                    buttonText: "Get Started",
                    context: context,
                    index: 3,
                    title: "Always Fascinated Learning",
                    pageController: pageController,
                    desc:
                        "Anywhere , anytime. The time is at your discretion so study whenever you time"),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

Widget column(
    {required int index,
    required String title,
    required String desc,
    required String buttonText,
    required PageController pageController,
    required BuildContext context}) {
  return Column(
    children: [
      Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 24.sp,
              color: Colors.black,
              fontWeight: FontWeight.normal),
        ),
      ),
      SizedBox(
        height: 10.h,
      ),
      Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: Text(
          desc,
          style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black.withOpacity(0.5),
              fontWeight: FontWeight.normal),
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(
        height: 10.h,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Container(
          padding: const EdgeInsets.all(4),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    blurRadius: 0.8,
                    spreadRadius: 0.8,
                    offset: const Offset(0, 1))
              ],
              color: const Color.fromARGB(255, 38, 49, 204)),
          child: button(
              data: buttonText,
              fontSize: 20.sp,
              function: () {
                if (index == 3) {
                  navigator(context: context, widget: LogIn());
                }
                pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut);
              },
              colorOfStyle: Colors.white),
        ),
      )
    ],
  );
}
