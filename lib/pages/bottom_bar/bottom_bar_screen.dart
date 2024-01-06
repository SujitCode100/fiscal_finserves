// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joyn/components/colors.dart';
import 'package:joyn/components/static_decoration.dart';
import 'package:joyn/pages/algo_option/algo_option_screen.dart';
import 'package:joyn/pages/dashboard/dashboard_screen.dart';
import 'package:joyn/pages/profile/profile_screen.dart';
import 'package:joyn/pages/settings/my_courses.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Languages/Languages.dart';
import '../../components/app_asset.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int currentTab = 0;

  final PageStorageBucket bucket = PageStorageBucket();


  Widget currentScreen = DashboardScreen();
  String phone = "+919725945915";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: SizedBox(
        height: 64.h,
        width: 64.w,
        child: FloatingActionButton(
          backgroundColor: buttonsColor,
          child: Image.asset(
            AppAsset.storeIcon,
            height: 24.h,
            width: 24.w,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => my_courses(),
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: primaryWhite,
        elevation: 0,
        child: Container(
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentTab = 0;
                    currentScreen = DashboardScreen();
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAsset.homeIcon,
                      height: 24.h,
                      width: 24.h,
                    ),
                    customHeight(2.h),
                    Text(
                      Languages.of(context)!.home,
                      style: TextStyle(
                          fontFamily: "Montserrat-SemiBold",
                          fontSize: 12.sp,
                          color: textBoldColor),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  var url =
                      'https://wa.me/$phone/?text=${Uri.parse("Hello,\n\nI am Full Name.\n\nI want to learn more about Fiscal Finserv...")}';
                  if (await canLaunch(url)) {
                    await launch(url, forceWebView: false);
                  } else {
                    throw 'Could not launch $url';
                  }
                  setState(() {
                    currentTab = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAsset.whatsappIcon,
                      height: 24.h,
                      width: 24.h,
                    ),
                    customHeight(2.h),
                    Text(
                        Languages.of(context)!.whatsapp,
                      style: TextStyle(
                          fontFamily: "Montserrat-SemiBold",
                          fontSize: 12.sp,
                          color: textBoldColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
                width: 24.h,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentTab = 2;
                    currentScreen = AlgoOptionScreen();
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAsset.services,
                      height: 24.h,
                      width: 24.h,
                    ),
                    customHeight(2.h),
                    Text(
                        Languages.of(context)!.services,
                      style: TextStyle(
                          fontFamily: "Montserrat-SemiBold",
                          fontSize: 12.sp,
                          color: textBoldColor),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentTab = 3;
                    currentScreen = ProfileScreen();
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAsset.profileIcon,
                      height: 24.h,
                      width: 24.h,
                    ),
                    customHeight(2.h),
                    Text(
                        Languages.of(context)!.profile,
                      style: TextStyle(
                          fontFamily: "Montserrat-SemiBold",
                          fontSize: 12.sp,
                          color: textBoldColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
