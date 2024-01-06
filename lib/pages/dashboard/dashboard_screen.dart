// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joyn/Languages/Languages.dart';
import 'package:joyn/components/app_asset.dart';
import 'package:joyn/components/colors.dart';
import 'package:joyn/components/static_decoration.dart';
import 'package:joyn/controller/course_controller.dart';
import 'package:joyn/pages/algo_option/algo_option_screen.dart';
import 'package:joyn/pages/course/allcourseslist.dart';
import 'package:joyn/pages/course/free_course_screen.dart';
import 'package:joyn/pages/course/upcoming_courses.dart';
import 'package:joyn/pages/dashboard/course_screen.dart';
import 'package:joyn/pages/dashboard/widget/dash_ui_interface.dart';
import 'package:joyn/pages/settings/contact_us.dart';
import 'package:joyn/pages/settings/my_courses.dart';
import 'package:joyn/pages/settings/my_documents.dart';
import 'package:joyn/pages/settings/refund_policy.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/buttons/text_button.dart';
import '../../controller/profile_controller.dart';
import '../../controller/sign_up_controller.dart';
import '../../utils/app_constants.dart';
import '../../utils/network_dio/network_dio.dart';
import '../algo_option/algo_segment_screen.dart';
import '../algo_option/ticket_size_screen.dart';
import '../course/UpcomingMoveMaster.dart';
import '../profile/edit_profile_screen.dart';
import '../settings/about_us.dart';
import '../settings/privacy_policy.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final GlobalKey _first = GlobalKey();


  final List<String> imgList = [
    AppAsset.sliderImage1,
    AppAsset.sliderImage2,
    AppAsset.sliderImage3,
  ];



  List page = [
    my_courses(),
    my_documents(),
    refund_policy(),
    privacy_policy(),
    about_us(),
    contact_us(),
    about_us(),
  ];

  List title = [
    "Free",
    "Basic",
    "Advance",
    "Money Midnight"
  ];

  List dis = [
    "Fiscal Finserve Solution Pvt. Ltd, a leading stock market training provider with a track record of 15 years of success, proudly presents a comprehensive 10-session course for beginners. This course will equip you with essential knowledge and advanced strategies in options trading. With 24/7 expert support through a dedicated app, you\'ll have the guidance you need to navigate the world of stock market trading.",
    "Fiscal Finserve Solution Pvt. Ltd, a leading stock market training provider with a track record of 15 years of success, proudly presents a comprehensive 10-session course for beginners. This course will equip you with essential knowledge and advanced strategies in options trading. With 24/7 expert support through a dedicated app, you\'ll have the guidance you need to navigate the world of stock market trading.",
    "Join us at Fiscal Finserve Solution Pvt. Ltd, a respected industry leader with 15 years of excellence, for an immersive course designed to elevate your stock market trading expertise. The Advanced Stock Market Hedging Strategies course is tailored for intermediate and advanced traders seeking to enhance their knowledge and protect their investments effectively.",
    "Money Midnight is a premium and exclusive option strategy master class offered by Fiscal Finserve, led by renowned stock market expert, Mr. Vijay Bhadiyadra. This course is specifically designed to equip clients with a unique set of option strategies that have the potential to generate substantial profits in the financial markets. Tailored for risk-takers and seasoned stock market players, Money Midnight covers eight comprehensive strategies that can significantly enhance your wealth and financial success."
  ];

  List price = [
    "Free",
    "12,980/-",
    "23,600 /-",
    "35,400/-",
  ];

  List priceDetails = [
    "",
    "(11000+18% GST)",
    "(20,000 + 18% GST)",
    "(30,000 + 18% GST)",
  ];

  List upcomingTitle = ["Strategic Trading", "MoveMaster Intraday"];

  List image = [
    AppAsset.freeCourseBanner,
    AppAsset.basicCourseBanner,
    AppAsset.advanceCourseBanner,
    AppAsset.advanceCourseBanner,
  ];


  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final signUpController = Get.put(SignUpController());
  final profileController = Get.put(ProfileController());
  final courseController = Get.put(CourseController());

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback(
    //         (_) => ShowCaseWidget.of(context)
    //         .startShowCase([_first]));
    NetworkDioHttp.setDynamicHeader(endPoint:ApiAppConstants.apiEndPoint);
    profileController.getProfiles(context);
    courseController.getCoursesData(context);
    print("sssss${courseController.coursesData}");


  }

  @override
  Widget build(BuildContext context) {

    List drawerText = [
      Languages.of(context)!.my_courses,
      Languages.of(context)!.my_documents,
      Languages.of(context)!.refund_policy,
      Languages.of(context)!.privacy_policy,
      Languages.of(context)!.about_us,
      Languages.of(context)!.contact_us,
      Languages.of(context)!.use_app,
    ];

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Obx(
        () => Scaffold(
          key: scaffoldKey,
          backgroundColor: primaryWhite,
          endDrawer: Padding(
            padding: const EdgeInsets.all(24),
            child: Drawer(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20).r),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => EditProfileScreen(),
                      );
                    },
                    child: Container(
                      height: 150.h,
                      width: double.infinity,
                      color: courseCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(AppAsset.profileAvatar),
                                  fit: BoxFit.contain),
                            ),
                          ),
                          height20,
                          Text(
                            '${Languages.of(context)!.hi}, ${profileController.profileData['fullName']}!',
                            style: TextStyle(
                                fontFamily: "Montserrat-Bold",
                                fontSize: 18.sp,
                                color: textBoldColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: drawerText.length,
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
                          margin:
                              EdgeInsets.only(top: 15, left: 15, right: 15).r,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10).r,
                            color: courseCardColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  drawerText[i],
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
            ),
          ),
          appBar: DashUiInterface.CustomAppBar(
            name: '${Languages.of(context)!.hi}, ${profileController.profileData['fullName']}!',
            onTap: () {
              scaffoldKey.currentState!.openEndDrawer();
            },
          ),
          body: ListView(
            padding: EdgeInsets.only(top: 12).r,
            children: [
              Showcase(
                key: _first,
                title: 'Slider',
                description: '',
                child: CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    autoPlay: true,
                  ),
                  items: imgList
                      .map((item) => GestureDetector(
                            onTap: () {
                              switch (imgList.indexOf(item)) {
                                case 0:
                                  launchYoutubeUrl();
                                  break;
                                case 1:
                                  launchTelegramUrl();
                                  break;
                                case 2:
                                  Get.to(() => AlgoOptionScreen());
                                  break;
                                default:
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 24),
                              child: Center(
                                  child: ClipRRect(
                                borderRadius: BorderRadius.circular(24).w,
                                child: Image.asset(
                                  item,
                                  fit: BoxFit.cover,
                                  height: height,
                                ),
                              )),
                            ),
                          ))
                      .toList(),
                ),
              ),
              customHeight(24.h),
              Padding(
                padding:
                    const EdgeInsets.only(left: 24, right: 24, bottom: 16).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Languages.of(context)!.tending_in_zone,
                      style: TextStyle(
                          fontFamily: "Montserrat-Bold",
                          fontSize: 18.sp,
                          color: textBoldColor),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: 166.h,
                    width: double.infinity,
                    padding: EdgeInsets.all(20).w,
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24).r,
                        border: Border.all(width: 2, color: courseCardColor),
                        color: cardColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'FREE',
                              style: TextStyle(
                                  fontFamily: "Montserrat-Bold",
                                  fontSize: 21.sp,
                                  color: buttonsColor),
                            ),
                            Text(
                              ' COURSES',
                              style: TextStyle(
                                  fontFamily: "Montserrat-Bold",
                                  fontSize: 21.sp,
                                  color: cardTextColor),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 65,
                              child: Stack(
                                children: [
                                  Container(
                                    height: 24.h,
                                    width: 24.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              AppAsset.profileAvatar),
                                          fit: BoxFit.contain),
                                    ),
                                  ),
                                  Positioned(
                                    left: 10,
                                    child: Container(
                                      height: 24.h,
                                      width: 24.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                AppAsset.profileAvatar),
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 20,
                                    child: Container(
                                      height: 24.h,
                                      width: 24.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                AppAsset.profileAvatar),
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 30,
                                    child: Container(
                                      height: 24.h,
                                      width: 24.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                AppAsset.profileAvatar),
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Trusted By 1L +Users',
                              style: TextStyle(
                                  fontFamily: "Montserrat-SemiBold",
                                  fontSize: 12.sp,
                                  color: textBoldColor),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            courseController.getCoursesData(context);
                            // Get.to(
                            //   () => FreeCourseScreen(),
                            // );

                            Get.to(
                              () => CourseScreen(
                                name: title[0],
                                image: image[0],
                                price: price[0],
                              ),
                            );
                          },
                          child: Container(
                            height: 40.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 11),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40).r,
                                color: buttonsColor),
                            child: Text(
                                Languages.of(context)!.get_started,
                              style: TextStyle(
                                  fontFamily: "Montserrat-SemiBold",
                                  fontSize: 14.sp,
                                  color: primaryWhite),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 20.w,
                      child: Image.asset(
                        AppAsset.courseTreding,
                        height: 150.h,
                      ))
                ],
              ),
              customHeight(16.h),
              Padding(
                padding:
                    const EdgeInsets.only(left: 24, right: 24, bottom: 16).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                    Languages.of(context)!.feature_courses,
                      style: TextStyle(
                          fontFamily: "Montserrat-Bold",
                          fontSize: 18.sp,
                          color: textBoldColor),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          () => allcourseslist(),
                        );
                      },
                      child: Text(
                          Languages.of(context)!.view_all,
                        style: TextStyle(
                            fontFamily: "Montserrat-Bold",
                            fontSize: 14.sp,
                            color: viewTextColor),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / 1.40,
                width: double.infinity,
                child: ListView.builder(
                  // itemCount: 3,
                  itemCount: courseController.coursesData.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: width / 1.12,
                      margin: EdgeInsets.only(
                        left: 24,
                        right: 24,
                      ).r,
                      padding: EdgeInsets.all(20).r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24).r,
                        color: courseCardColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(24).r,
                                  child: Image.asset(image[index])),
                              customHeight(20.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '${title[index]}'.toUpperCase(),
                                    style: TextStyle(
                                        fontFamily: "Montserrat-Bold",
                                        fontSize: 20.sp,
                                        color: buttonsColor),
                                  ),
                                  Text(
                                    ' COURSE',
                                    style: TextStyle(
                                        fontFamily: "Montserrat-Bold",
                                        fontSize: 20.sp,
                                        color: cardTextColor),
                                  ),
                                ],
                              ),
                              customHeight(10.h),
                              Text(
                                '${courseController.coursesData[index]['description']}',
                                style: TextStyle(
                                    fontFamily: "Montserrat-SemiBold",
                                    fontSize: 10.sp,
                                    height: 1.8,
                                    color: courseTextColor),
                              ),
                              customHeight(15.h),
                              Row(
                                children: [
                                  Text(
                                    'Price :-',
                                    style: TextStyle(
                                        fontFamily: "Montserrat-Bold",
                                        fontSize: 16.sp,
                                        color: textBoldColor),
                                  ),
                                  customWidth(8.h),
                                  Text(
                                    '${price[index]+" "+priceDetails[index]}',
                                    style: TextStyle(
                                        fontFamily: "Montserrat-SemiBold",
                                        fontSize: 14.sp,
                                        color: textBoldColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          PrimaryTextButton(
                            title: Languages.of(context)!.get_this_course,
                            onPressed: () {
                              Get.to(
                                () => CourseScreen(
                                  name: title[index],
                                  image: image[index],
                                  price: price[index],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              customHeight(24.h),
              Padding(
                padding:
                    const EdgeInsets.only(left: 24, right: 24, bottom: 16).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                    Languages.of(context)!.upcoming_course,
                      style: TextStyle(
                          fontFamily: "Montserrat-Bold",
                          fontSize: 18.sp,
                          color: textBoldColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                  // itemCount: 3,
                  itemCount: 2,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: width,
                      child: Stack(
                        children: [
                          Container(
                            height: 166.h,
                            width: double.infinity,
                            padding: EdgeInsets.all(20).w,
                            margin: EdgeInsets.symmetric(horizontal: 24),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24).r,
                                border: Border.all(
                                    width: 2, color: courseCardColor),
                                color: cardColor),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      upcomingTitle[index],
                                      style: TextStyle(
                                          fontFamily: "Montserrat-Bold",
                                          fontSize: 21.sp,
                                          color: buttonsColor),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 65,
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 24.h,
                                            width: 24.w,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      AppAsset.profileAvatar),
                                                  fit: BoxFit.contain),
                                            ),
                                          ),
                                          Positioned(
                                            left: 10,
                                            child: Container(
                                              height: 24.h,
                                              width: 24.w,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        AppAsset.profileAvatar),
                                                    fit: BoxFit.contain),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 20,
                                            child: Container(
                                              height: 24.h,
                                              width: 24.w,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        AppAsset.profileAvatar),
                                                    fit: BoxFit.contain),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 30,
                                            child: Container(
                                              height: 24.h,
                                              width: 24.w,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        AppAsset.profileAvatar),
                                                    fit: BoxFit.contain),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      'Trusted By 1L +Users',
                                      style: TextStyle(
                                          fontFamily: "Montserrat-SemiBold",
                                          fontSize: 12.sp,
                                          color: textBoldColor),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    upcomingTitle[index] == "Strategic Trading"
                                        ? Get.to(() => upcomigCourses())
                                        : Get.to(() => UpcomingMoveMaster());
                                  },
                                  child: Container(
                                    height: 40.h,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 11),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(40).r,
                                        color: buttonsColor),
                                    child: Text(
                                        Languages.of(context)!.get_started,
                                      style: TextStyle(
                                          fontFamily: "Montserrat-SemiBold",
                                          fontSize: 14.sp,
                                          color: primaryWhite),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 20.w,
                              child: Image.asset(
                                AppAsset.courseTreding,
                                height: 150.h,
                              ))
                        ],
                      ),
                    );
                  },
                ),
              ),
              customHeight(27.h),
              Padding(
                padding:
                const EdgeInsets.only(left: 24, right: 24, bottom: 16).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                    Languages.of(context)!.connect_with_us,
                      style: TextStyle(
                          fontFamily: "Montserrat-Bold",
                          fontSize: 18.sp,
                          color: textBoldColor),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 24, right: 24, bottom: 16).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        launchUrl("https://www.instagram.com/fiscalfinserveofficial/");
                      },
                      child: Image.asset(
                        'assets/images/png/instagram.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        launchUrl("https://www.facebook.com/fiscalfinserveofficial/");
                      },
                      child: Image.asset(
                        'assets/images/png/facebook.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        launchTelegramUrl();
                      },
                      child: Image.asset(
                        'assets/images/png/telegram.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        launchYoutubeUrl();
                      },
                      child: Image.asset(
                        'assets/images/png/youtube.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        launchUrl("https://twitter.com/fiscalfinserve");
                      },
                      child: Image.asset(
                        'assets/images/png/twitter.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        launchUrl("https://www.linkedin.com/company/fiscalfinserve/");
                      },
                      child: Image.asset(
                        'assets/images/png/linkedin.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ],
                ),
              ),
              customHeight(20.h),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> launchYoutubeUrl() async {
    const url = 'https://www.youtube.com/@FiscalFinserve';
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> launchUrl(String url1) async {
    var url = url1;
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> launchTelegramUrl() async {
    const url = 'https://t.me/indexoptionhedge';
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}
