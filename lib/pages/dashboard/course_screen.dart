// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:joyn/Languages/Languages.dart';
import 'package:joyn/components/static_decoration.dart';
import 'package:joyn/model/PurchaseCourseModel.dart';
import 'package:joyn/pages/course/free_course_screen.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../../components/app_asset.dart';
import '../../components/colors.dart';
import '../../components/ui.dart';
import '../../controller/course_controller.dart';
import '../../main.dart';
import '../../utils/DataBase.dart';

class CourseScreen extends StatefulWidget {
  final int? index;
  final String? name;
  final String? image;
  final String? price;
  final String? subTitle1;
  final String? subTitle2;
  final String? subTitle3;
  final String? subTitle4;
  final String? subTitle5;

  const CourseScreen(
      {Key? key,
      this.index,
      this.name,
      this.image,
      this.price,
      this.subTitle1,
      this.subTitle2,
      this.subTitle3,
      this.subTitle4,
      this.subTitle5})
      : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  List moduleList = [
    "Basic of overall market future & option contract.",
    "Basic of option index and option stocks.",
    "Basic to advance premium analysis.",
    "Best method to understand option Greeks.",
    "India Vix and implied volatility.",
    "Open interest and option chain deep analysis.",
    "How to set perfect entry, exit, and stop loss.",
  ];

  List moduleAdvanceList = [
    "What is hedge???",
    "Basic of option index and option stocks.How does a\nhedge offset your risk?",
    "Identify market direction.",
    "Best methodology for hedge position.",
    "30 advanced hedging strategies for both directional and\nnon-directional markets.",
    "Fully back-tested strategies for best risk and reward.",
  ];

  List indexList = [
    "1.",
    "2.",
    "3.",
    "4.",
    "5.",
    "6.",
    "7.",
  ];

  final courseController = Get.put(CourseController());

  Map<String, dynamic>? paymentIntent;

  DataBase handler = new DataBase();

  Future<void> launchYoutubeUrl(String url1) async {
    var url = url1;
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    _refreshcourses();
    courseController.getCoursesData(context);
  }

  List<PurchaseCourseModel> _courses = [];

  bool purchasecourse = false;

  void _refreshcourses() async {
    final data = await handler.retrieveUserPurchaseCourse();
    setState(() {
      _courses = data;
      print("videosno " + _courses.length.toString());
      for (int i = 0; i < _courses.length; i++) {
        if (_courses[i].userId == dataStorage?.read("_id").toString()) {
          if (_courses[i].name == widget.name) {
            purchasecourse = true;
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        appBar: UiInterface.CustomAppBar(
            titleShow: true, title: "${widget.name} Course"),
        body: ListView(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24).r,
          children: [
            Text(
              '${widget.name} Courses',
              style: TextStyle(
                  fontFamily: "Montserrat-Bold",
                  fontSize: 27.sp,
                  color: buttonsColor),
            ),
            customHeight(15.h),
            Container(
              // height: 195.h,
              height: height / 3.5,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: bordersColor,
                  borderRadius: BorderRadius.circular(24).r,
                  image: DecorationImage(
                      image: AssetImage(widget.image!))),
            ),
            customHeight(24.h),
            Text(
              'About This Course',
              style: TextStyle(
                  fontFamily: "Montserrat-SemiBold",
                  fontSize: 17.sp,
                  color: buttonsColor),
            ),
            customHeight(15.h),
            //
            (widget.name == 'Basic')
                ? Text(
                    'Fiscal Finserve Solution Pvt. Ltd, a leading stock market training provider with a track record of 15 years of success, proudly presents a comprehensive 10-session course for beginners. This course will equip you with essential knowledge and advanced strategies in options trading. With 24/7 expert support through a dedicated app, you\'ll have the guidance you need to navigate the world of stock market trading.',
                    style: TextStyle(
                        fontFamily: "Montserrat-Regular",
                        fontSize: 11.26.sp,
                        height: 1.4,
                        color: primaryBlack),
                  )
                : Text(
                    'Join us at Fiscal Finserve Solution Pvt. Ltd, a respected industry leader with 15 years of excellence, for an immersive course designed to elevate your stock market trading expertise. The Advanced Stock Market Hedging Strategies course is tailored for intermediate and advanced traders seeking to enhance their knowledge and protect their investments effectively.',
                    style: TextStyle(
                        fontFamily: "Montserrat-Regular",
                        fontSize: 11.26.sp,
                        height: 1.4,
                        color: primaryBlack),
                  ),
            customHeight(15.h),
            Row(
              children: [
                Text(
                  'Total Session: -',
                  style: TextStyle(
                      fontFamily: "Montserrat-Bold",
                      fontSize: 12.sp,
                      color: textBoldColor),
                ),
                customWidth(8.h),
                Text(
                  '10',
                  style: TextStyle(
                      fontFamily: "Montserrat-Medium",
                      fontSize: 12.sp,
                      color: primaryBlack),
                ),
              ],
            ),
            customHeight(15.h),
            Row(
              children: [
                Text(
                  '90-Day Validity: -',
                  style: TextStyle(
                      fontFamily: "Montserrat-Bold",
                      fontSize: 12.sp,
                      color: textBoldColor),
                ),
                customWidth(8.h),
                Text(
                  'You will get this course \n for 90 Full Days',
                  style: TextStyle(
                      fontFamily: "Montserrat-Medium",
                      fontSize: 12.sp,
                      color: primaryBlack),
                ),
              ],
            ),
            customHeight(15.h),
            Row(
              children: [
                Text(
                  'Minimum Required Capital: -',
                  style: TextStyle(
                      fontFamily: "Montserrat-Bold",
                      fontSize: 12.sp,
                      color: textBoldColor),
                ),
                customWidth(8.h),
                Text(
                  (widget.name == 'Basic') ? '10,000' : '50,000',
                  style: TextStyle(
                      fontFamily: "Montserrat-Medium",
                      fontSize: 12.sp,
                      color: primaryBlack),
                ),
              ],
            ),
            customHeight(15.h),
            Row(
              children: [
                Text(
                  'Return on Investment: -',
                  style: TextStyle(
                      fontFamily: "Montserrat-Bold",
                      fontSize: 12.sp,
                      color: textBoldColor),
                ),
                customWidth(8.h),
                Text(
                  '15%-20% (Per Month)',
                  style: TextStyle(
                      fontFamily: "Montserrat-Medium",
                      fontSize: 12.sp,
                      color: primaryBlack),
                ),
              ],
            ),
            customHeight(15.h),
            Text(
              'What you will learn (Module):-',
              style: TextStyle(
                  fontFamily: "Montserrat-Bold",
                  fontSize: 12.sp,
                  color: textBoldColor),
            ),
            customHeight(15.h),
            (widget.name == 'Basic')
                ? Wrap(
                    direction: Axis.vertical,
                    children: moduleList
                        .map(
                          (i) => Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                customWidth(10.w),
                                Text(
                                  '${indexList.first}',
                                  style: TextStyle(
                                      fontFamily: "Montserrat-Bold",
                                      fontSize: 12.sp,
                                      color: textBoldColor),
                                ),
                                customWidth(8.h),
                                Text(
                                  i,
                                  style: TextStyle(
                                      fontFamily: "Montserrat-Regular",
                                      fontSize: 12.sp,
                                      color: primaryBlack),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  )
                : Wrap(
                    direction: Axis.vertical,
                    children: moduleAdvanceList
                        .map(
                          (i) => Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                customWidth(10.w),
                                Text(
                                  '1.',
                                  style: TextStyle(
                                      fontFamily: "Montserrat-Bold",
                                      fontSize: 12.sp,
                                      color: textBoldColor),
                                ),
                                customWidth(8.h),
                                Text(
                                  i,
                                  style: TextStyle(
                                      fontFamily: "Montserrat-Regular",
                                      fontSize: 12.sp,
                                      color: primaryBlack),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
            customHeight(15.h),
            Text(
              (widget.name == 'Basic')
                  ? 'Additional Features:-'
                  : 'Course Benefits:-',
              style: TextStyle(
                  fontFamily: "Montserrat-Bold",
                  fontSize: 12.sp,
                  color: textBoldColor),
            ),
            customHeight(15.h),
            Row(
              children: [
                customWidth(10.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle,
                      color: primaryBlack,
                      size: 5,
                    ),
                  ],
                ),
                customWidth(8.h),
                Expanded(
                  child: Text(
                    (widget.name == 'Basic')
                        ? 'Benefit from Fiscal Finserve Solution Pvt. Ltd\'s 15 years of expertise in stock market training'
                        : 'Access to 30 exclusive risk-free strategies, enabling you to protect and grow your investments.',
                    style: TextStyle(
                        fontFamily: "Montserrat-Regular",
                        fontSize: 11.26.sp,
                        color: primaryBlack),
                  ),
                ),
              ],
            ),
            customHeight(10.h),
            Row(
              children: [
                customWidth(10.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle,
                      color: primaryBlack,
                      size: 5,
                    ),
                  ],
                ),
                customWidth(8.h),
                Expanded(
                  child: Text(
                    (widget.name == 'Basic')
                        ? 'Access to a dedicated app for 24/7 expert support and problem resolution'
                        : '24/7 Expert Support for personalized guidance and assistance.',
                    style: TextStyle(
                        fontFamily: "Montserrat-Regular",
                        fontSize: 11.26.sp,
                        color: primaryBlack),
                  ),
                ),
              ],
            ),
            customHeight(10.h),
            Row(
              children: [
                customWidth(10.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle,
                      color: primaryBlack,
                      size: 5,
                    ),
                  ],
                ),
                customWidth(8.h),
                Expanded(
                  child: Text(
                    (widget.name == 'Basic')
                        ? 'Hands-on exercises and real-world case studies'
                        : 'Join our dedicated Telegram Channel for ongoing support, discussions, and updates.',
                    style: TextStyle(
                        fontFamily: "Montserrat-Regular",
                        fontSize: 11.26.sp,
                        color: primaryBlack),
                  ),
                ),
              ],
            ),
            customHeight(10.h),
            Row(
              children: [
                customWidth(10.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle,
                      color: primaryBlack,
                      size: 5,
                    ),
                  ],
                ),
                customWidth(8.h),
                Expanded(
                  child: Text(
                    (widget.name == 'Basic')
                        ? 'Comprehensive course materials and resources for continuous learning'
                        : 'Practical insights and real-world examples',
                    style: TextStyle(
                        fontFamily: "Montserrat-Regular",
                        fontSize: 11.26.sp,
                        color: primaryBlack),
                  ),
                ),
              ],
            ),
            (widget.name == 'Basic') ? customHeight(10.h) : SizedBox(),
            (widget.name == 'Basic')
                ? Row(
                    children: [
                      customWidth(10.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.circle,
                            color: primaryBlack,
                            size: 5,
                          ),
                        ],
                      ),
                      customWidth(8.h),
                      Expanded(
                        child: Text(
                          'Telegram Channel Support ',
                          style: TextStyle(
                              fontFamily: "Montserrat-Regular",
                              fontSize: 11.26.sp,
                              color: primaryBlack),
                        ),
                      ),
                    ],
                  )
                : SizedBox(),
            (widget.name == 'Basic') ? customHeight(10.h) : SizedBox(),
            (widget.name == 'Basic')
                ? Row(
                    children: [
                      customWidth(10.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.circle,
                            color: primaryBlack,
                            size: 5,
                          ),
                        ],
                      ),
                      customWidth(8.h),
                      Expanded(
                        child: Text(
                          'After each session of completion, you will get comprehensive course materials learning.',
                          style: TextStyle(
                              fontFamily: "Montserrat-Regular",
                              fontSize: 11.26.sp,
                              color: primaryBlack),
                        ),
                      ),
                    ],
                  )
                : SizedBox(),
            (widget.name == 'Basic') ? SizedBox() : customHeight(15.h),
            (widget.name == 'Basic')
                ? SizedBox()
                : Text(
                    'Course Duration:-',
                    style: TextStyle(
                        fontFamily: "Montserrat-Bold",
                        fontSize: 12.sp,
                        color: textBoldColor),
                  ),
            (widget.name == 'Basic') ? SizedBox() : customHeight(15.h),
            (widget.name == 'Basic')
                ? SizedBox()
                : Text(
                    'Flexible, allowing you to pace you’re learning according to your convenience. You will get this course for 90 Full Days.',
                    style: TextStyle(
                        fontFamily: "Montserrat-Regular",
                        fontSize: 11.26.sp,
                        height: 1.4,
                        color: primaryBlack),
                  ),
            (widget.name == 'Basic') ? SizedBox() : customHeight(15.h),
            (widget.name == 'Basic')
                ? SizedBox()
                : Text(
                    'Who Should Attend?',
                    style: TextStyle(
                        fontFamily: "Montserrat-Bold",
                        fontSize: 12.sp,
                        color: textBoldColor),
                  ),
            (widget.name == 'Basic') ? SizedBox() : customHeight(15.h),
            (widget.name == 'Basic')
                ? SizedBox()
                : Row(
                    children: [
                      customWidth(10.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.circle,
                            color: primaryBlack,
                            size: 5,
                          ),
                        ],
                      ),
                      customWidth(8.h),
                      Expanded(
                        child: Text(
                          'Intermediate and advanced traders aiming to enhance their risk management skills.',
                          style: TextStyle(
                              fontFamily: "Montserrat-Regular",
                              fontSize: 11.26.sp,
                              color: primaryBlack),
                        ),
                      ),
                    ],
                  ),
            (widget.name == 'Basic') ? SizedBox() : customHeight(10.h),
            (widget.name == 'Basic')
                ? SizedBox()
                : Row(
                    children: [
                      customWidth(10.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.circle,
                            color: primaryBlack,
                            size: 5,
                          ),
                        ],
                      ),
                      customWidth(8.h),
                      Expanded(
                        child: Text(
                          'Investors are seeking advanced hedging techniques to maximize their portfolio\'s potential',
                          style: TextStyle(
                              fontFamily: "Montserrat-Regular",
                              fontSize: 11.26.sp,
                              color: primaryBlack),
                        ),
                      ),
                    ],
                  ),
            customHeight(15.h),
            Text(
              'Enroll Now:-',
              style: TextStyle(
                  fontFamily: "Montserrat-Bold",
                  fontSize: 12.sp,
                  color: textBoldColor),
            ),
            customHeight(15.h),
            Text(
              (widget.name == 'Basic')
                  ? 'Enroll now in our Options Trading Crash Course! After a successful payment, gain access to recorded sessions within 24 hours, allowing you to learn at your own pace. Our dedicated support team is here to connect with you and provide assistance throughout your learning journey. Join us for a successful venture into the world of options trading.'
                  : 'Enroll in our Advanced Stock Market Hedging Techniques course and elevate your trading strategies to new heights. After a successful payment, gain access to recorded sessions within 24 hours, allowing you to learn at your own pace. Our dedicated support team is here to connect with you and provide assistance throughout your learning journey',
              style: TextStyle(
                  fontFamily: "Montserrat-Regular",
                  fontSize: 11.26.sp,
                  height: 1.4,
                  color: primaryBlack),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 94.h,
          width: double.infinity,
          padding: EdgeInsets.only(left: 18, right: 18, top: 18, bottom: 18).r,
          color: buttonsColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () async {
                  if (widget.name != 'Basic') {
                    launchYoutubeUrl(
                        "https://www.youtube.com/watch?v=sVI9bLd3Wjs");
                  } else if (widget.name != 'Advance') {
                    launchYoutubeUrl(
                        "https://www.youtube.com/watch?v=ZuSinwQjf64");
                  }
                },
                child: Container(
                  padding:
                      EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 12)
                          .r
                          .r,
                  decoration: BoxDecoration(
                    color: primaryWhite,
                    borderRadius: BorderRadius.circular(15).r,
                  ),
                  child: Text(
                   Languages.of(context)!.demo_video,
                    style: TextStyle(
                        fontFamily: "Montserrat-Bold",
                        fontSize: 20.sp,
                        color: courseButtonColor),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (widget.name != 'Free') {
                    if (purchasecourse == true) {
                      Get.to(
                            () => FreeCourseScreen(
                          courseName: widget.name,
                        ),
                      );
                    } else {
                      await makePayment();
                    }
                  } else {
                    Get.to(
                      () => FreeCourseScreen(
                        courseName: widget.name,
                      ),
                    );
                  }
                },
                child: Container(
                  padding:
                      EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 12)
                          .r
                          .r,
                  decoration: BoxDecoration(
                    color: primaryWhite,
                    borderRadius: BorderRadius.circular(15).r,
                  ),
                  child: Text(
                    Languages.of(context)!.buy_now,
                    style: TextStyle(
                        fontFamily: "Montserrat-Bold",
                        fontSize: 20.sp,
                        color: courseButtonColor),
                  ),
                ),
              )
            ],
          ),
        ),
        // body: ListView(
        //   padding:
        //       const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24).r,
        //   children: [
        //     widget.index == 1 || widget.index == 0

        //         ? DashUiInterface.customCourse(
        //             onTap: () {
        //               Get.to(
        //                 () => FreeCourseScreen(),
        //               );
        //             },
        //           )
        //         : SizedBox(),
        //    widget.index == 1 || widget.index == 0
        //         ? customHeight(13.h) : SizedBox(),
        //     widget.index == 2 || widget.index == 0
        //         ? DashUiInterface.customCourse(
        //             onTap: showBottomSheet,
        //             title: 'Basic Courses',
        //             subTitle1: '2 Time watching availability',
        //             subTitle2: '12 Lecture pdf material for every session',
        //             subTitle3: 'No screenshot or download availability of pdf',
        //             subTitle4: 'No allowance for screenshot of video',
        //             chargeText: 'Enrolment Charge 12,980/-')
        //         : SizedBox(),
        //     customHeight(13.h),
        //     widget.index == 2 || widget.index == 0
        //         ? DashUiInterface.customCourse(
        //             onTap: showAdvanceBottomSheet,
        //             title: 'Advance Courses',
        //             subTitle1: '2 Time watching availability',
        //             subTitle2: '52 strategies',
        //             subTitle3: '1 pdf material for every session',
        //             subTitle4: 'No screenshot or download availability of pdf',
        //             fiveText: true,
        //             subTitle5: 'No allowance for screenshot of video',
        //             chargeText: 'Enrolment Charge 47,200/-')
        //         : SizedBox(),
        //   ],
        // ),
      ),
    );
  }

  Future<void> showBottomSheet() async {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: Colors.black26,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(24.0),
              topRight: const Radius.circular(24.0),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.10),
                  blurRadius: 4.0,
                  offset: Offset(0, -3)),
            ]),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 35, right: 35, top: 20).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Basic Courses',
                      style: TextStyle(
                          fontFamily: "Montserrat-Bold",
                          fontSize: 27.sp,
                          color: buttonsColor),
                    ),
                    customHeight(15.h),
                    Container(
                      height: 195.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: bordersColor,
                          borderRadius: BorderRadius.circular(24).r,
                          image: DecorationImage(
                              image: AssetImage(AppAsset.basicCourseBanner),
                              fit: BoxFit.cover)),
                    ),
                    customHeight(24.h),
                    Text(
                      'About This Course',
                      style: TextStyle(
                          fontFamily: "Montserrat-SemiBold",
                          fontSize: 17.sp,
                          color: buttonsColor),
                    ),
                    customHeight(4.h),
                    Text(
                      'This basic course offers flexible scheduling with 2-time slots for viewing, comprehensive learning through 12 lecture PDF materials per session, and emphasizes content security by not allowing screenshots or PDF downloads from the videos.',
                      style: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontSize: 11.26.sp,
                          color: primaryBlack),
                    ),
                    customHeight(8.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 10).r,
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: primaryBlack,
                            size: 5,
                          ),
                          customWidth(8.h),
                          Text(
                            '2 Time watching availability',
                            style: TextStyle(
                                fontFamily: "Montserrat-Regular",
                                fontSize: 11.26.sp,
                                color: primaryBlack),
                          ),
                        ],
                      ),
                    ),
                    customHeight(6.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 10).r,
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: primaryBlack,
                            size: 5,
                          ),
                          customWidth(8.h),
                          Text(
                            '12 Lecture pdf material for every session',
                            style: TextStyle(
                                fontFamily: "Montserrat-Regular",
                                fontSize: 11.26.sp,
                                color: primaryBlack),
                          ),
                        ],
                      ),
                    ),
                    customHeight(6.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 10).r,
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: primaryBlack,
                            size: 5,
                          ),
                          customWidth(8.h),
                          Text(
                            'No screenshot or download availability of pdf',
                            style: TextStyle(
                                fontFamily: "Montserrat-Regular",
                                fontSize: 11.26.sp,
                                color: primaryBlack),
                          ),
                        ],
                      ),
                    ),
                    customHeight(6.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 10).r,
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: primaryBlack,
                            size: 5,
                          ),
                          customWidth(8.h),
                          Text(
                            'There is no allowance for screenshots of video',
                            style: TextStyle(
                                fontFamily: "Montserrat-Regular",
                                fontSize: 11.26.sp,
                                color: primaryBlack),
                          ),
                        ],
                      ),
                    ),
                    customHeight(48.h),
                    Text(
                      '* Total amount depends on terms and conditions.',
                      style: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontSize: 10.sp,
                          color: primaryBlack),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 94.h,
              width: double.infinity,
              padding:
                  EdgeInsets.only(left: 18, right: 18, top: 18, bottom: 18).r,
              color: courseButtonColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AppAsset.rupeesIcon,
                            height: 20.h,
                          ),
                          customWidth(8.w),
                          Text(
                            widget.price![1],
                            style: TextStyle(
                                fontFamily: "Montserrat-Bold",
                                fontSize: 26.47.sp,
                                color: primaryWhite),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            AppAsset.rupeesIcon,
                            height: 11.h,
                          ),
                          customWidth(5.w),
                          Text(
                            '19,999',
                            style: TextStyle(
                                fontFamily: "Montserrat-Bold",
                                decoration: TextDecoration.lineThrough,
                                decorationColor: primaryWhite,
                                fontSize: 15.29.sp,
                                color: primaryWhite),
                          ),
                          customWidth(10.w),
                          Text(
                            '35%OFF',
                            style: TextStyle(
                                fontFamily: "Montserrat-SemiBold",
                                fontSize: 15.29.sp,
                                color: offColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                            left: 20, right: 20, top: 11, bottom: 11)
                        .r,
                    decoration: BoxDecoration(
                      color: primaryWhite,
                      borderRadius: BorderRadius.circular(20).r,
                    ),
                    child: Text(
                      'Buy now',
                      style: TextStyle(
                          fontFamily: "Montserrat-Bold",
                          fontSize: 26.47.sp,
                          color: courseButtonColor),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> showAdvanceBottomSheet() async {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: Colors.black26,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.77,
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(24.0),
              topRight: const Radius.circular(24.0),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.10),
                  blurRadius: 4.0,
                  offset: Offset(0, -3)),
            ]),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 35, right: 35, top: 20).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Advance Courses',
                      style: TextStyle(
                          fontFamily: "Montserrat-Bold",
                          fontSize: 27.sp,
                          color: buttonsColor),
                    ),
                    customHeight(15.h),
                    Container(
                      height: 195.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: bordersColor,
                          borderRadius: BorderRadius.circular(24).r,
                          image: DecorationImage(
                              image: AssetImage(AppAsset.advanceCourseBanner),
                              fit: BoxFit.cover)),
                    ),
                    customHeight(24.h),
                    Text(
                      'About This Course',
                      style: TextStyle(
                          fontFamily: "Montserrat-SemiBold",
                          fontSize: 17.sp,
                          color: buttonsColor),
                    ),
                    customHeight(4.h),
                    Text(
                      'This advanced course offers flexible scheduling with 2-time slots for viewing, comprehensive learning through 12 lecture PDF materials per session, and emphasizes content security by not allowing screenshots or PDF downloads from the videos.',
                      style: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontSize: 11.26.sp,
                          color: primaryBlack),
                    ),
                    customHeight(8.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 10).r,
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: primaryBlack,
                            size: 5,
                          ),
                          customWidth(8.h),
                          Text(
                            '2 Time watching availability',
                            style: TextStyle(
                                fontFamily: "Montserrat-Regular",
                                fontSize: 11.26.sp,
                                color: primaryBlack),
                          ),
                        ],
                      ),
                    ),
                    customHeight(6.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 10).r,
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: primaryBlack,
                            size: 5,
                          ),
                          customWidth(8.h),
                          Text(
                            '52 strategies',
                            style: TextStyle(
                                fontFamily: "Montserrat-Regular",
                                fontSize: 11.26.sp,
                                color: primaryBlack),
                          ),
                        ],
                      ),
                    ),
                    customHeight(6.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 10).r,
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: primaryBlack,
                            size: 5,
                          ),
                          customWidth(8.h),
                          Text(
                            '1 PDF material for every session',
                            style: TextStyle(
                                fontFamily: "Montserrat-Regular",
                                fontSize: 11.26.sp,
                                color: primaryBlack),
                          ),
                        ],
                      ),
                    ),
                    customHeight(6.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 10).r,
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: primaryBlack,
                            size: 5,
                          ),
                          customWidth(8.h),
                          Text(
                            'No screenshot or download availability of pdf',
                            style: TextStyle(
                                fontFamily: "Montserrat-Regular",
                                fontSize: 11.26.sp,
                                color: primaryBlack),
                          ),
                        ],
                      ),
                    ),
                    customHeight(6.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 10).r,
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: primaryBlack,
                            size: 5,
                          ),
                          customWidth(8.h),
                          Text(
                            'There is no allowance for screenshots of video',
                            style: TextStyle(
                                fontFamily: "Montserrat-Regular",
                                fontSize: 11.26.sp,
                                color: primaryBlack),
                          ),
                        ],
                      ),
                    ),
                    customHeight(48.h),
                    Text(
                      '* Total amount depends on terms and conditions.',
                      style: TextStyle(
                          fontFamily: "Montserrat-Regular",
                          fontSize: 10.sp,
                          color: primaryBlack),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 94.h,
              width: double.infinity,
              padding:
                  EdgeInsets.only(left: 18, right: 18, top: 18, bottom: 18).r,
              color: courseButtonColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AppAsset.rupeesIcon,
                            height: 20.h,
                          ),
                          customWidth(8.w),
                          Text(
                            '47,200',
                            style: TextStyle(
                                fontFamily: "Montserrat-Bold",
                                fontSize: 26.47.sp,
                                color: primaryWhite),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            AppAsset.rupeesIcon,
                            height: 11.h,
                          ),
                          customWidth(5.w),
                          Text(
                            '63,720',
                            style: TextStyle(
                                fontFamily: "Montserrat-Bold",
                                decoration: TextDecoration.lineThrough,
                                decorationColor: primaryWhite,
                                fontSize: 15.29.sp,
                                color: primaryWhite),
                          ),
                          customWidth(10.w),
                          Text(
                            '35%OFF',
                            style: TextStyle(
                                fontFamily: "Montserrat-SemiBold",
                                fontSize: 15.29.sp,
                                color: offColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                            left: 20, right: 20, top: 11, bottom: 11)
                        .r,
                    decoration: BoxDecoration(
                      color: primaryWhite,
                      borderRadius: BorderRadius.circular(20).r,
                    ),
                    child: Text(
                      'Buy now',
                      style: TextStyle(
                          fontFamily: "Montserrat-Bold",
                          fontSize: 26.47.sp,
                          color: courseButtonColor),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent('10000', 'INR');

      // var gpay = PaymentSheetGooglePay(merchantCountryCode: "GB",
      //     currencyCode: "GBP",
      //     testEnv: true);

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent![
                      'client_secret'], //Gotten from payment intent
                  style: ThemeMode.light,
                  merchantDisplayName: 'Abhi'))
          .then((value) {});

      //STEP 3: Display Payment sheet
      displayPaymentSheet();
    } catch (err) {
      print(err);
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        print("Payment Successfully");
        Get.to(
          () => FreeCourseScreen(
            courseName: widget.name,
          ),
        );
        PurchaseCourseModel videos = PurchaseCourseModel(
            name: widget.name.toString(),
            userId: dataStorage!.read("_id").toString(),
            id: 1);
        List<PurchaseCourseModel> planets = [videos];
        handler.insertUserPurchaseCourse(planets);
      });
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51OKEnxSIfGMQApXyLqWRmY2batbOwI6DZd00vYbKFxcNQOJIbMXDHrINTXV0kk18gD59FDgILTv14b7S48z0s1Xc00yYR51UkV',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception("error " + err.toString());
    }
  }
}
