import 'package:courses/components/components.dart';
import 'package:courses/layout/cubit/states.dart';
import 'package:courses/modules/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../layout/cubit/cubit.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoursesCubit, CoursesStates>(
      builder: (context, state) {
        var cubit = CoursesCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              "Settings",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: SafeArea(
              child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Expanded(
                    child: settings(
                        iconData: Icons.person,
                        data: "Account",
                        data2: "Edit Account",
                        data3: "Change your password",
                        data4: "Security & Privacy",
                        itemCount: 1),
                  ),
                  Expanded(
                    child: settings(
                        iconData: Icons.notifications,
                        data: "Notification",
                        data2: "Notification",
                        data3: "App notification",
                        itemCount: 1),
                  ),
                  Expanded(
                    child: settings(
                        iconData: Icons.list,
                        data: "More",
                        data2: "Language",
                        data3: "Country",
                        itemCount: 1),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      cubit.signOutAndRemoveUid();
                      navigatorAndReplacement(
                          context: context, widget: LogIn());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.logout,
                          size: 28,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Log out",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  )
                ],
              ),
            ),
          )),
        );
      },
      listener: (context, state) {},
    );
  }
}
