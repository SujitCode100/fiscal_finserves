import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../components/app_asset.dart';
import '../../components/colors.dart';
import '../../components/ui.dart';
import '../algo_option/algo_segment_screen.dart';
import '../algo_option/ticket_size_screen.dart';
import '../dashboard/course_screen.dart';

class allcourseslist extends StatefulWidget {
  const allcourseslist({Key? key}) : super(key: key);
  @override
  State<allcourseslist> createState() => _allcourseslistState();
}

class _allcourseslistState extends State<allcourseslist> {

  final List title = [
    "Free",
    "Basic",
    "Advance"
  ];

  List image = [
    AppAsset.freeCourseBanner,
    AppAsset.basicCourseBanner,
    AppAsset.advanceCourseBanner,
  ];

  List price = [
    "Free",
    "12,980/-",
    "47,200/-",
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      backgroundColor: primaryWhite,
      appBar:
      UiInterface.CustomAppBar(titleShow: true, title: "Features Courses",isBack: true),
      body: ListView(
        padding:
        const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24).r,
        children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: title.length,
            itemBuilder: (c, i) {
              return GestureDetector(
                onTap: () {
                  Get.to(
                          () => CourseScreen(
                        name: title[i],
                        image: image[i],
                        price: price[i],
                      ));
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 24),
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20).r,
                    color: courseCardColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          title[i]+" Course",
                          style: TextStyle(
                              fontFamily: "Montserrat-Bold",
                              fontSize: 15.sp,
                              color: textBoldColor),
                        ),
                      ),
                      Image.asset(
                        AppAsset.rightArrow,
                        height: 16.h,
                        width: 16.w,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ));
  }
}
