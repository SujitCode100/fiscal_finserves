import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Languages/Languages.dart';
import '../../components/colors.dart';
import '../../components/ui.dart';
import '../../main.dart';
import '../../model/PurchaseCourseModel.dart';
import '../../utils/DataBase.dart';

class billing_option extends StatefulWidget {
  const billing_option({Key? key}) : super(key: key);

  @override
  State<billing_option> createState() => _billing_optionState();
}

class _billing_optionState extends State<billing_option> {

  DataBase handler = new DataBase();

  List<PurchaseCourseModel> _courses = [];

  List<dynamic> courseName = [];

  @override
  void initState() {
    super.initState();
    _refreshcourses();
  }

  void _refreshcourses() async {
    final data = await handler.retrieveUserPurchaseCourse();
    setState(() {
      _courses = data;
      for (int i = 0; i < _courses.length; i++) {
        if (_courses[i].userId == dataStorage?.read("_id").toString()) {
          courseName.add(_courses[i].name);
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: primaryWhite,
          appBar: UiInterface.CustomAppBar(titleShow: true, title: Languages.of(context)!.billing),
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
                      onTap: () {},
                    ),
                  ],
                );
              }),
        ));
  }
}
