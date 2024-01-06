import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joyn/components/static_decoration.dart';
import 'package:joyn/pages/dashboard/dashboard_screen.dart';

import '../../components/buttons/text_button.dart';
import '../../components/colors.dart';
import '../../components/ui.dart';

class FreeCourseQuizScreen extends StatefulWidget {
  const FreeCourseQuizScreen({Key? key}) : super(key: key);

  @override
  State<FreeCourseQuizScreen> createState() => _FreeCourseQuizScreenState();
}

class _FreeCourseQuizScreenState extends State<FreeCourseQuizScreen> {
  int? group1Value;
  int? group2Value;
  int? group3Value;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        appBar: UiInterface.CustomAppBar(
            titleShow: true, title: "Free Courses Quiz"),
        body: ListView(
          padding: const EdgeInsets.only(
            top: 16,
            left: 24,
            right: 24,
          ).r,
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (c, i) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10).r,
                  child: Container(
                    padding: EdgeInsets.only(
                         right: 15, top: 16,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24).r,
                      border: Border.all(
                        width: 1.5,
                        color: bordersColor,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:11.0),
                          child: Text(
                            'What does ROI stand for in stock market terms?',
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: textBoldColor,
                                fontFamily: "Montserrat-Bold"),
                          ),
                        ),
                        customHeight(4.h),
                        Row(
                          children: [
                            Radio(
                              value: 0,
                              groupValue: group1Value,
                              activeColor: buttonsColor,
                              onChanged: (value) {
                                setState(() {
                                  group1Value = value as int?;
                                });
                              },
                            ),
                            Expanded(
                              child: Text("Rate of Inflation",
                                  style: TextStyle(
                                      fontFamily: "Montserrat-Regular",
                                      fontSize: 12.sp,
                                      color: greyTextColor),),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: group1Value,
                              activeColor: buttonsColor,
                              onChanged: (value) {
                                setState(() {
                                  group1Value = value as int?;
                                });
                              },
                            ),
                            Expanded(
                              child: Text("Return on Investment",
                                  style: TextStyle(
                                      fontFamily: "Montserrat-Regular",
                                      fontSize: 12.sp,
                                      color: greyTextColor),),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 2,
                              groupValue:group1Value,
                              activeColor: buttonsColor,
                              onChanged: (value) {
                                setState(() {
                                  group1Value = value as int?;
                                });
                              },
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Risk of Inactivity",
                                      style: TextStyle(
                                          fontFamily: "Montserrat-Regular",
                                          fontSize: 12.sp,
                                          color: greyTextColor),),
                                          Container(
                                            height: 2.h,
                                            width: 12.w,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5).r,
                                              color: buttonsColor
                                            ),
                                          )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (c, i) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10).r,
                  child: Container(
                    padding: EdgeInsets.only(
                      right: 15, top: 16,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24).r,
                      border: Border.all(
                        width: 1.5,
                        color: bordersColor,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:11.0),
                          child: Text(
                            '"What is the purpose of a stock exchange?',
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: textBoldColor,
                                fontFamily: "Montserrat-Bold"),
                          ),
                        ),
                        customHeight(4.h),
                        Row(
                          children: [
                            Radio(
                              value: 0,
                              groupValue: group2Value,
                              activeColor: buttonsColor,
                              onChanged: (value) {
                                setState(() {
                                  group2Value = value as int?;
                                });
                              },
                            ),
                            Expanded(
                              child: Text("To sell stocks directly to investor",
                                style: TextStyle(
                                    fontFamily: "Montserrat-Regular",
                                    fontSize: 12.sp,
                                    color: greyTextColor),),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: group2Value,
                              activeColor: buttonsColor,
                              onChanged: (value) {
                                setState(() {
                                  group2Value = value as int?;
                                });
                              },
                            ),
                            Expanded(
                              child: Text("To regulate the stock market",
                                style: TextStyle(
                                    fontFamily: "Montserrat-Regular",
                                    fontSize: 12.sp,
                                    color: greyTextColor),),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 2,
                              groupValue:group2Value,
                              activeColor: buttonsColor,
                              onChanged: (value) {
                                setState(() {
                                  group2Value = value as int?;
                                });
                              },
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("To facilitate the buying and selling of stocks",
                                    style: TextStyle(
                                        fontFamily: "Montserrat-Regular",
                                        fontSize: 12.sp,
                                        color: greyTextColor),),
                                  Container(
                                    height: 2.h,
                                    width: 12.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5).r,
                                        color: buttonsColor
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (c, i) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10).r,
                  child: Container(
                    padding: EdgeInsets.only(
                      right: 15, top: 16,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24).r,
                      border: Border.all(
                        width: 1.5,
                        color: bordersColor,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:11.0),
                          child: Text(
                            'What does ROI stand for in stock market terms?',
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: textBoldColor,
                                fontFamily: "Montserrat-Bold"),
                          ),
                        ),
                        customHeight(4.h),
                        Row(
                          children: [
                            Radio(
                              value: 0,
                              groupValue: group3Value,
                              activeColor: buttonsColor,
                              onChanged: (value) {
                                setState(() {
                                  group3Value = value as int?;
                                });
                              },
                            ),
                            Expanded(
                              child: Text("Rate of Inflation",
                                style: TextStyle(
                                    fontFamily: "Montserrat-Regular",
                                    fontSize: 12.sp,
                                    color: greyTextColor),),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: group3Value,
                              activeColor: buttonsColor,
                              onChanged: (value) {
                                setState(() {
                                  group3Value = value as int?;
                                });
                              },
                            ),
                            Expanded(
                              child: Text("Return on Investment",
                                style: TextStyle(
                                    fontFamily: "Montserrat-Regular",
                                    fontSize: 12.sp,
                                    color: greyTextColor),),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 2,
                              groupValue:group3Value,
                              activeColor: buttonsColor,
                              onChanged: (value) {
                                setState(() {
                                  group3Value = value as int?;
                                });
                              },
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Risk of Inactivity",
                                    style: TextStyle(
                                        fontFamily: "Montserrat-Regular",
                                        fontSize: 12.sp,
                                        color: greyTextColor),),
                                  Container(
                                    height: 2.h,
                                    width: 12.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5).r,
                                        color: buttonsColor
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            PrimaryTextButton(
              title: "Submit",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DashboardScreen(),
                  ),
                );
              },
            ),
            customHeight(27.h),
          ],
        ),
      ),
    );
  }
}
