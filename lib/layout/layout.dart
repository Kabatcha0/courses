import 'package:courses/layout/cubit/cubit.dart';
import 'package:courses/layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoursesCubit, CoursesStates>(builder: (context, state) {
      var cubit = CoursesCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.table_rows_rounded,
                  color: Colors.black,
                  size: 28,
                )),
          ),
          backgroundColor: Colors.white,
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(
                  "https://imageio.forbes.com/specials-images/imageserve/6170e01f8d7639b95a7f2eeb/Sotheby-s-NFT-Natively-Digital-1-2-sale-Bored-Ape-Yacht-Club--8817-by-Yuga-Labs/0x0.png?format=png&width=960",
                ),
              ),
            )
          ],
        ),
        body: OfflineBuilder(
            connectivityBuilder: (
              BuildContext context,
              ConnectivityResult connectivity,
              Widget child,
            ) {
              bool check = connectivity != ConnectivityResult.none;
              return SafeArea(
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(3),
                    color:
                        check ? null : const Color.fromARGB(255, 38, 49, 204),
                    child: check
                        ? cubit.screens[cubit.currentIndex]
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Offline",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
              );
            },
            child: const Text("")),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: cubit.currentIndex,
            onTap: (v) {
              cubit.bottomNavigation(v);
            },
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color.fromARGB(255, 38, 49, 204),
            unselectedItemColor: Colors.grey.withOpacity(0.56),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedLabelStyle:
                const TextStyle(color: Colors.white, fontSize: 0.000000000001),
            unselectedLabelStyle:
                const TextStyle(color: Colors.white, fontSize: 0.000000000001),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 28,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    size: 28,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.play_arrow,
                    size: 28,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.chat_bubble,
                    size: 28,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    size: 28,
                  ),
                  label: ""),
            ]),
      );
    }, listener: (context, state) {
      // if (state is CoursesSignOutSuccessState) {
      //   navigatorAndReplacement(context: context, widget: LogIn());
      // }
    });
  }
}
