import 'package:courses/layout/cubit/cubit.dart';
import 'package:courses/modules/login/cubit/cubit.dart';
import 'package:courses/modules/register/cubit/cubit.dart';
import 'package:courses/modules/splash.dart';
import 'package:courses/shared/const.dart';
import 'package:courses/shared/local/local.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await CacheHelper.init();
  uid = CacheHelper.getData(key: "uid") ?? "";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => CoursesCubit()),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          debugShowCheckedModeBanner: false,
          title: "Courses",
          home: const Splash(),
        ),
      ),
    );
  }
}
