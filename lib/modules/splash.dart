import 'dart:async';

import 'package:courses/components/components.dart';
import 'package:courses/layout/layout.dart';
import 'package:courses/modules/on_board.dart';
import 'package:courses/shared/const.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    if (uid == "") {
      Timer(const Duration(seconds: 3), () {
        navigatorAndReplacement(context: context, widget: OnBoarding());
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        navigatorAndReplacement(context: context, widget: Layout());
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 220,
                width: 220,
                child: Image.asset(
                  "assets/full course.png",
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
