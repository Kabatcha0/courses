import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget button(
    {required String data,
    required double fontSize,
    required Function() function,
    required Color colorOfStyle}) {
  return MaterialButton(
    onPressed: function,
    child: Text(
      data,
      style: TextStyle(
          color: colorOfStyle, fontSize: fontSize, fontWeight: FontWeight.bold),
    ),
  );
}

void navigator({required BuildContext context, required Widget widget}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigatorAndReplacement(
    {required BuildContext context, required Widget widget}) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}

Widget thirdLogInParty({
  required String image1,
  required String image2,
}) {
  return SizedBox(
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 26,
          backgroundImage: AssetImage("assets/$image1.png"),
        ),
        const SizedBox(
          width: 10,
        ),
        CircleAvatar(
          radius: 26,
          backgroundImage: AssetImage("assets/$image2.png"),
        ),
      ],
    ),
  );
}

Widget textFromField(
    {required TextInputType textInputType,
    required String hint,
    required TextEditingController textEditingController,
    required String? Function(String?)? func,
    bool obscure = false}) {
  return TextFormField(
    validator: func,
    keyboardType: textInputType,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.8),
          fontSize: 14,
          fontWeight: FontWeight.normal),
      border: InputBorder.none,
    ),
    obscureText: obscure,
    controller: textEditingController,
  );
}

Widget container(
    {required Color color, required Color colorOfText, required String text}) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(8), color: color),
    child: Text(
      text,
      style: TextStyle(
          color: colorOfText, fontSize: 16, fontWeight: FontWeight.normal),
    ),
  );
}

Widget gridView({
  required String src,
  required String data,
  required String data2,
}) {
  return Container(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    child: Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.network(
            src,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  data,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 14),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  data2,
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.9),
                      fontWeight: FontWeight.normal,
                      fontSize: 14),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget profile({required IconData iconData, required String data}) {
  return Container(
    width: 120,
    height: 100,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 38, 49, 204)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 25.sp,
          color: Colors.white,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          data,
          style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}

Widget profileRow(
    {required IconData iconData,
    required String data,
    required Function() func}) {
  return InkWell(
    onTap: func,
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromARGB(255, 38, 49, 204)),
          child: Icon(
            iconData,
            size: 25.sp,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
        Expanded(
            child: Text(
          data,
          style: TextStyle(
              color: Colors.black,
              fontSize: 17.sp,
              fontWeight: FontWeight.normal),
        ))
      ],
    ),
  );
}

Widget settings({
  required IconData iconData,
  required String data,
  required String data2,
  required String data3,
  String? data4,
  required int itemCount,
}) {
  return Column(
    children: [
      Row(
        children: [
          Icon(
            iconData,
            color: Colors.black,
            size: 28,
          ),
          const SizedBox(
            width: 1,
          ),
          Text(
            data,
            style: const TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
          )
        ],
      ),
      SizedBox(
        height: 150,
        width: double.infinity,
        child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data2,
                          style: TextStyle(
                            color: Colors.grey.withOpacity(0.7),
                            fontSize: 14,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey.withOpacity(0.7),
                              size: 24,
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data3,
                          style: TextStyle(
                            color: Colors.grey.withOpacity(0.7),
                            fontSize: 14,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey.withOpacity(0.7),
                              size: 24,
                            ))
                      ],
                    ),
                    if (data4 != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data4,
                            style: TextStyle(
                              color: Colors.grey.withOpacity(0.7),
                              fontSize: 14,
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.grey.withOpacity(0.7),
                                size: 24,
                              ))
                        ],
                      ),
                  ],
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 1,
                ),
            itemCount: itemCount),
      )
    ],
  );
}
