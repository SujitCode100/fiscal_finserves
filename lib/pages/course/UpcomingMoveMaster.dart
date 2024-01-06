import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/buttons/text_button.dart';
import '../../components/colors.dart';
import '../../components/static_decoration.dart';
import '../../components/ui.dart';

class UpcomingMoveMaster extends StatefulWidget {
  const UpcomingMoveMaster({Key? key}) : super(key: key);


  @override
  State<UpcomingMoveMaster> createState() => _UpcomingMoveMasterState();
}

class _UpcomingMoveMasterState extends State<UpcomingMoveMaster> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: primaryWhite,
          appBar:
          UiInterface.CustomAppBar(titleShow: true, title: "MoveMaster Intraday"),
          body: ListView(
            padding:
            const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24).r,
            children: [
              Text(
                'Description: -',
                style: TextStyle(
                    fontFamily: "Montserrat-Bold",
                    fontSize: 18.sp,
                    color: textBoldColor),
              ),
              customHeight(27.h),
              Text(
                'Embark on a journey of precision and profit with Move Master Intraday. Tailored for full-time traders, this strategy requires a capital of 1 lac-1.5 lac and promises unlimited returns within the 1-2% range, all while keeping risks limited. Dive into daily execution with confidence, guided by the strategic use of advanced technical indicators.',
                style: TextStyle(
                    height: 1.4,
                    fontFamily: "Montserrat-Regular",
                    fontSize: 12.sp,
                    color: greyTextColor),
              ),
              customHeight(27.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Investment',
                      style: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontSize: 13.26.sp,
                          color: textBoldColor),
                    ),
                  ),
                  customWidth(5.h),
                  Expanded(
                    child: Text(
                      '₹1-1.5 Lac',
                      style: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontSize: 11.26.sp,
                          color: greyTextColor),
                    ),
                  ),
                ],
              ),
              customHeight(10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Return',
                      style: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontSize: 13.26.sp,
                          color: textBoldColor),
                    ),
                  ),
                  customWidth(5.h),
                  Expanded(
                    child: Text(
                      'Unlimited (1-2% daily)',
                      style: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontSize: 11.26.sp,
                          color: greyTextColor),
                    ),
                  ),
                ],
              ),
              customHeight(10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Risk',
                      style: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontSize: 13.26.sp,
                          color: textBoldColor),
                    ),
                  ),
                  customWidth(5.h),
                  Expanded(
                    child: Text(
                      'Limited',
                      style: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontSize: 11.26.sp,
                          color: greyTextColor),
                    ),
                  ),
                ],
              ),
              customHeight(10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Course Fees',
                      style: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontSize: 13.26.sp,
                          color: textBoldColor),
                    ),
                  ),
                  customWidth(5.h),
                  Expanded(
                    child: Text(
                      '7500 (Including 18% GST)',
                      style: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontSize: 11.26.sp,
                          color: greyTextColor),
                    ),
                  ),
                ],
              ),
              customHeight(27.h),
              Text(
                'Key Features: -',
                style: TextStyle(
                    fontFamily: "Montserrat-Bold",
                    fontSize: 18.sp,
                    color: textBoldColor),
              ),
              customHeight(27.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customWidth(10.w),
                  Icon(
                    Icons.circle,
                    color: primaryBlack,
                    size: 5,
                  ),
                  customWidth(8.h),
                  Expanded(
                    child: Text(
                      'Strategic Precision: Leverage technical indicators for precise entry and exit points in intraday trades.',
                      style: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontSize: 11.26.sp,
                          color: greyTextColor),
                    ),
                  ),
                ],
              ),
              customHeight(10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customWidth(10.w),
                  Icon(
                    Icons.circle,
                    color: primaryBlack,
                    size: 5,
                  ),
                  customWidth(8.h),
                  Expanded(
                    child: Text(
                      'Optimized Capital: Manage your capital effectively, ensuring maximum returns within the specified risk limits.',
                      style: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontSize: 11.26.sp,
                          color: greyTextColor),
                    ),
                  ),
                ],
              ),
              customHeight(10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customWidth(10.w),
                  Icon(
                    Icons.circle,
                    color: primaryBlack,
                    size: 5,
                  ),
                  customWidth(8.h),
                  Expanded(
                    child: Text(
                      'Daily Execution Excellence: Ideal for full-time traders, execute trades confidently on a daily basis',
                      style: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontSize: 11.26.sp,
                          color: greyTextColor),
                    ),
                  ),
                ],
              ),
              customHeight(10.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customWidth(10.w),
                  Icon(
                    Icons.circle,
                    color: primaryBlack,
                    size: 5,
                  ),
                  customWidth(8.h),
                  Expanded(
                    child: Text(
                      'Risk Control: Keep risks in check with a limited risk approach, providing a secure foundation for your intraday activities',
                      style: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontSize: 11.26.sp,
                          color: greyTextColor),
                    ),
                  ),
                ],
              ),
              customHeight(27.h),
              Text(
                'Who Should Enroll: -',
                style: TextStyle(
                    fontFamily: "Montserrat-Bold",
                    fontSize: 18.sp,
                    color: textBoldColor),
              ),
              customHeight(27.h),
              Row(
                children: [
                  customWidth(10.w),
                  Icon(
                    Icons.circle,
                    color: primaryBlack,
                    size: 5,
                  ),
                  customWidth(8.h),
                  Expanded(
                    child: Text(
                      'Full-time traders looking to enhance their intraday trading skills.',
                      style: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontSize: 11.26.sp,
                          color: greyTextColor),
                    ),
                  ),
                ],
              ),
              customHeight(10.h),
              Row(
                children: [
                  customWidth(10.w),
                  Icon(
                    Icons.circle,
                    color: primaryBlack,
                    size: 5,
                  ),
                  customWidth(8.h),
                  Expanded(
                    child: Text(
                      'Individuals seeking a disciplined approach to daily execution.',
                      style: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontSize: 11.26.sp,
                          color: greyTextColor),
                    ),
                  ),
                ],
              ),
              customHeight(10.h),
              Row(
                children: [
                  customWidth(10.w),
                  Icon(
                    Icons.circle,
                    color: primaryBlack,
                    size: 5,
                  ),
                  customWidth(8.h),
                  Expanded(
                    child: Text(
                      'Those interested in leveraging advanced technical indicators for precision in intraday trades.',
                      style: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontSize: 11.26.sp,
                          color: greyTextColor),
                    ),
                  ),
                ],
              ),
              customHeight(27.h),
              Text(
                'Course Format:-',
                style: TextStyle(
                    fontFamily: "Montserrat-Bold",
                    fontSize: 18.sp,
                    color: textBoldColor),
              ),
              customHeight(27.h),
              Row(
                children: [
                  customWidth(10.w),
                  Icon(
                    Icons.circle,
                    color: primaryBlack,
                    size: 5,
                  ),
                  customWidth(8.h),
                  Expanded(
                    child: Text(
                      'Online modules accessible at your own pace, allowing flexibility for busy schedules.',
                      style: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontSize: 11.26.sp,
                          color: greyTextColor),
                    ),
                  ),
                ],
              ),
              customHeight(10.h),
              Row(
                children: [
                  customWidth(10.w),
                  Icon(
                    Icons.circle,
                    color: primaryBlack,
                    size: 5,
                  ),
                  customWidth(8.h),
                  Expanded(
                    child: Text(
                      'Practical demonstrations and real-world examples to enhance understanding.',
                      style: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontSize: 11.26.sp,
                          color: greyTextColor),
                    ),
                  ),
                ],
              ),
              customHeight(10.h),
              Row(
                children: [
                  customWidth(10.w),
                  Icon(
                    Icons.circle,
                    color: primaryBlack,
                    size: 5,
                  ),
                  customWidth(8.h),
                  Expanded(
                    child: Text(
                      'Q&A sessions for interactive learning and clarification of doubts.',
                      style: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontSize: 11.26.sp,
                          color: greyTextColor),
                    ),
                  ),
                ],
              ),
              customHeight(70.h),
              PrimaryTextButton(
                title: "This Course IS Coming Soon",
                onPressed: () {},
              ),
            ],
          ),
    ));
  }
}
