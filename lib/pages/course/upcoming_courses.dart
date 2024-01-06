import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/buttons/text_button.dart';
import '../../components/colors.dart';
import '../../components/static_decoration.dart';
import '../../components/ui.dart';

class upcomigCourses extends StatefulWidget {
  const upcomigCourses({Key? key}) : super(key: key);

  @override
  State<upcomigCourses> createState() => _upcomigCoursesState();
}

class _upcomigCoursesState extends State<upcomigCourses> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        appBar:
        UiInterface.CustomAppBar(titleShow: true, title: "Strategic Trading"),
        body: ListView(
          padding:
          const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24).r,
          children: [
            Text(
              'Open Interest Mastery with Hedge (Only Strategy)',
              style: TextStyle(
                  fontFamily: "Montserrat-Bold",
                  fontSize: 15.sp,
                  color: textBoldColor),
            ),
            customHeight(10.h),
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
                    'Investment Requirement: ₹3,00,000',
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
                    'Fund Utilization in Strategy: ₹1,00,000',
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
                    'Strategy Type: Pure Open Interest Base',
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
                    'Risk Profile: Limited',
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
                    'Return Expectation: Approximately 18% monthly',
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
                    'Hedging: Integrated hedge for risk management',
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
                    'Positional Strategy: Emphasizing a longer-term perspective',
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
              'Course Fees: - 15000 (Including 18% GST)',
              style: TextStyle(
                  fontFamily: "Montserrat-Bold",
                  fontSize: 18.sp,
                  color: textBoldColor),
            ),
            customHeight(27.h),
            Text(
              'Additional Information: -',
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
                    'Traders will gain insights into leveraging open interest and employing hedges for a balanced risk-reward ratio.',
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
                    'Practical examples and real-world applications will be integral to the learning experience',
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
                    'Engage in discussions, Q&A sessions, and case studies to enhance your learning experience.',
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
              'Eligibility:-',
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
                    'Basic understanding of options trading.',
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
                    'Familiarity with risk management principles.',
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
                    'Willingness to actively participate in live trading exercises.',
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
              'Outcome:',
              style: TextStyle(
                  fontFamily: "Montserrat-Bold",
                  fontSize: 18.sp,
                  color: textBoldColor),
            ),
            customHeight(27.h),
            Text(
              'Upon completion of this course, you\'ll have the knowledge and skills to implement a pure open interest strategy with a hedge, enabling you to navigate the options market with confidence and potentially achieve impressive returns while managing risk effectively.',
              style: TextStyle(
                  height: 1.4,
                  fontFamily: "Montserrat-Regular",
                  fontSize: 12.sp,
                  color: greyTextColor),
            ),
            customHeight(70.h),
            PrimaryTextButton(
              title: "This Course IS Coming Soon",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
