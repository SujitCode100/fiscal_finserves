import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joyn/components/colors.dart';
import 'package:joyn/pages/bottom_bar/bottom_bar_screen.dart';
import 'package:joyn/pages/onboarding/onboarding_screen.dart';
import 'package:showcaseview/showcaseview.dart';

import '../components/app_asset.dart';
import '../main.dart';
import 'auth/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// String uid = dataStorages.read('userid');

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), navigationPage);
    // startTime();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   getLocation();
    // });
  }

  startTime() {
    return Timer(
      const Duration(seconds: 15),
      () {
        Get.offAll(
          () => const AuthScreen(),
        );
      },
    );
  }

  void navigationPage() async {
    Get.offAll(() => dataStorage!.read('token') != null
        ? ShowCaseWidget(
            builder: Builder(
              builder: (context) => const BottomBarScreen(),
            ),
          )
        : OnboardingScreen());
  }

  // void navigationPage() async {
  //   bool? status = dataStorage.read("isLoggedIn");
  //   String? token = dataStorage.read('token');
  //   if (token == null) {
  //     // Get.offAll(MainHomeScreen(
  //     //   initialPageIndex: 0,
  //     // ));
  //   } else if (token.isNotEmpty && status == true) {
  //     // Get.offAll(MainHomeScreen(
  //     //   initialPageIndex: 0,
  //     // ));

  //   } else {
  //     // Get.to(LoginScreen());
  //   }
  // }

  // getLocation() async {
  //   NetworkDioHttp.setDynamicHeader(endPoint: ApiAppConstants.apiEndPoint);
  // if (dataStorage.read('latitude') == null &&
  //     dataStorage.read('longitude') == null) {
  //   final Position position = await CommonRepository.getCurrentLocation();

  //   dataStorage.write('latitude', position.latitude);
  //   dataStorage.write('longitude', position.longitude);
  // }
  // debugPrint(
  //     '\x1b[97m Lat-Lng = ${dataStorage.read('latitude')}-${dataStorage.read('longitude')}');
  // startTime();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/png/Only Logo_1.gif',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
