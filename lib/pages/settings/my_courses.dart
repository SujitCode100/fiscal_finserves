import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joyn/model/PurchaseCourseModel.dart';

import '../../Languages/Languages.dart';
import '../../components/colors.dart';
import '../../components/ui.dart';
import '../../main.dart';
import '../../utils/DataBase.dart';
import '../course/free_course_screen.dart';

class my_courses extends StatefulWidget {
  const my_courses({Key? key}) : super(key: key);

  @override
  State<my_courses> createState() => _my_coursesState();
}

class _my_coursesState extends State<my_courses> {
  DataBase handler = new DataBase();

  List<PurchaseCourseModel> _courses = [];

  List<dynamic> courseName = [];

  @override
  void initState() {
    super.initState();
    courseName.add("Free");
    _refreshcourses();
  }

  void _refreshcourses() async {
    final data = await handler.retrieveUserPurchaseCourse();
    setState(() {
      _courses = data;
      print("videosno " + _courses.length.toString());
      for (int i = 0; i < _courses.length; i++) {
        print("videosno " +_courses[i].userId.toString());
        if (_courses[i].userId == dataStorage?.read("_id").toString()) {
          courseName.add(_courses[i].name);
        }
      }
      
      print(courseName.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: primaryWhite,
      appBar: UiInterface.CustomAppBar(titleShow: true, title: Languages.of(context)!.my_courses,),
      body: ListView.builder(
          itemCount: courseName.length,
          itemBuilder: (context, index) {
            final itemData = courseName[index];
            return Column(
              children: [
                InkWell(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 5),
                        child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20).r,
                              color: courseCardColor,
                            ),
                            child: Text(
                          itemData + " Courses",
                              style: TextStyle(
                                  fontFamily: "Montserrat-Bold",
                                  fontSize: 15.sp,
                                  color: textBoldColor),
                        )),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FreeCourseScreen(
                          courseName:itemData,
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }),
    ));
  }
}
