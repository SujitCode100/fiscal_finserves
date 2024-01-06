import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/app_asset.dart';
import '../../components/colors.dart';
import '../../components/ui.dart';
import 'course_pdf.dart';
import 'free_courses_quiz_screen.dart';

class video_option extends StatefulWidget {
  const video_option({Key? key}) : super(key: key);

  @override
  State<video_option> createState() => _video_optionState();
}

class _video_optionState extends State<video_option> {

  final List title = [
    "Quiz",
    "PDF"
  ];

  final List page = [
    FreeCourseQuizScreen(),
    CoursePDF()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: primaryWhite,
      appBar:
      UiInterface.CustomAppBar(titleShow: true, title: "Videos",isBack: true),
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => page[i],
                    ),
                  );
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
                          title[i],
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
