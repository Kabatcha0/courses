import 'package:courses/components/components.dart';
import 'package:courses/layout/cubit/cubit.dart';
import 'package:courses/layout/cubit/states.dart';
import 'package:courses/modules/settings/settings.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Person extends StatelessWidget {
  const Person({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoursesCubit, CoursesStates>(
        builder: (context, state) {
          return SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: const [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          "https://imageio.forbes.com/specials-images/imageserve/6170e01f8d7639b95a7f2eeb/Sotheby-s-NFT-Natively-Digital-1-2-sale-Bored-Ape-Yacht-Club--8817-by-Yuga-Labs/0x0.png?format=png&width=960",
                        ),
                      ),
                      CircleAvatar(
                        radius: 17,
                        backgroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Color.fromARGB(255, 38, 49, 204),
                        child: Icon(
                          Icons.edit,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "dbestech",
                    style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      profile(iconData: Icons.camera, data: "My Camera"),
                      profile(iconData: Icons.sell, data: "Buy Courses"),
                      profile(iconData: Icons.star, data: "4.0"),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Expanded(
                    child: ListView(children: [
                      profileRow(
                          iconData: Icons.settings,
                          data: "Settings",
                          func: () {
                            navigator(
                                context: context, widget: const Settings());
                          }),
                      SizedBox(
                        height: 10.h,
                      ),
                      profileRow(
                          iconData: Icons.credit_card,
                          data: "Payment Details",
                          func: () {}),
                      SizedBox(
                        height: 10.h,
                      ),
                      profileRow(
                          iconData: Icons.local_attraction_rounded,
                          data: "Archievement",
                          func: () {}),
                      SizedBox(
                        height: 10.h,
                      ),
                      profileRow(
                          iconData: Icons.heart_broken,
                          data: "Love",
                          func: () {}),
                      SizedBox(
                        height: 10.h,
                      ),
                      profileRow(
                          iconData: Icons.grid_on,
                          data: "Learning Reminders",
                          func: () {}),
                      SizedBox(
                        height: 10.h,
                      ),
                    ]),
                  )
                ],
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
