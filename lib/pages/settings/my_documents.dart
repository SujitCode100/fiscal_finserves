import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Languages/Languages.dart';
import '../../components/colors.dart';
import '../../components/ui.dart';
import '../../main.dart';
import '../../model/UserCourseModel.dart';
import '../../utils/DataBase.dart';
import '../course/course_pdf.dart';

class my_documents extends StatefulWidget {
  const my_documents({Key? key}) : super(key: key);

  @override
  State<my_documents> createState() => _my_documentsState();
}

class _my_documentsState extends State<my_documents> {


  List<dynamic> quizcourseno =[];

  List<dynamic> coursename =[];

  DataBase handler = new DataBase();

  List<UserCourseModel> _courses = [];


  @override
  void initState() {
    super.initState();
    _refreshcourses();
  }

  void _refreshcourses() async {
    final data = await handler.retrieveUserCourseModel();
    setState(() {
      _courses = data;
      print("videosno "+ _courses.length.toString());
      for (int i = 0; i < _courses.length; i++) {

        if (_courses[i].userId == dataStorage?.read("_id").toString()) {
          quizcourseno.add(_courses[i].videono);
          coursename.add(_courses[i].name);
        }
      }
      print("quiz"+quizcourseno.toString());

    });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: primaryWhite,
      appBar: UiInterface.CustomAppBar(titleShow: true, title: Languages.of(context)!.my_documents),
      body: ListView.builder(
          itemCount: coursename.length,
          itemBuilder: (context, index) {
            final itemData = coursename[index];
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
                              itemData + " Course / Video No. "+quizcourseno[index].toString(),
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
                        builder: (context) => CoursePDF(),
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
