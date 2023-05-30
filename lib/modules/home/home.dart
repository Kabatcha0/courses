import 'package:courses/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatelessWidget {
  TextEditingController search = TextEditingController();
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Text(
              "Hello,",
              style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600]),
            ),
            SizedBox(
              height: 1.h,
            ),
            const Text(
              "dbestech",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(start: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black,
                        )),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey[600],
                          size: 24.sp,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Expanded(
                          child: Container(
                            child: textFromField(
                                func: (s) {
                                  return null;
                                },
                                textInputType: TextInputType.emailAddress,
                                hint: "Search your course",
                                textEditingController: search),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 38, 49, 204),
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    Icons.drag_indicator_outlined,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            SizedBox(
              height: 195.h,
              child: PageView(
                physics: const BouncingScrollPhysics(),
                controller: pageController,
                children: [
                  Container(
                    width: double.infinity,
                    height: 190.h,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(14)),
                    child: Image.network(
                      "https://cdn.dribbble.com/users/383277/screenshots/18055765/media/e5fc935b60035305099554810357012a.png?compress=1&resize=400x300",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 190.h,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(14)),
                    child: Image.network(
                      "https://cloudfront-us-east-2.images.arcpublishing.com/reuters/43YAWLITTZJLZIQTCP2JSS4KSM.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 190.h,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(14)),
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1F_9vEZt_WKNQNDYaF28G7dNjazLK-0pHsw&usqp=CAU",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: SlideEffect(
                    spacing: 5.0,
                    radius: 3.0,
                    dotWidth: 18.0,
                    dotHeight: 8.0,
                    paintStyle: PaintingStyle.stroke,
                    strokeWidth: 0,
                    dotColor: Colors.grey.withOpacity(0.6),
                    activeDotColor: const Color.fromARGB(255, 38, 49, 204),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Choice Your Course",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600]),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                container(
                    color: const Color.fromARGB(255, 38, 49, 204),
                    colorOfText: Colors.white,
                    text: "All"),
                SizedBox(
                  width: 10.w,
                ),
                container(
                    color: Colors.white,
                    colorOfText: Colors.grey.withOpacity(0.6),
                    text: "Popular"),
                SizedBox(
                  width: 10.w,
                ),
                container(
                    color: Colors.white,
                    colorOfText: Colors.grey.withOpacity(0.6),
                    text: "Newest"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 9 / 9.5,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                gridView(
                    src:
                        "https://www.hollywoodreporter.com/wp-content/uploads/2021/10/Mutant-Demon-Ape-Credit-0xb1-copy-H-2021.jpg?w=1296",
                    data: "Best Courses For IT",
                    data2: "Flutter best courses"),
                gridView(
                    src:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRdBondAUvWLbdrMiGCoEz6dElRmeLWh0enQ&usqp=CAU",
                    data: "Best Courses For IT",
                    data2: "Flutter best courses"),
                gridView(
                    src:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxsORHutfcL-Y8h56R8_1Lu3ViO7zSOIAIAw&usqp=CAU",
                    data: "Best Courses For IT",
                    data2: "Flutter best courses"),
                gridView(
                    src:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSsk8fLIkkjLwK2cDaAmEv_ZC0nyPfRxyV-A&usqp=CAU",
                    data: "Best Courses For IT",
                    data2: "Flutter best courses"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
