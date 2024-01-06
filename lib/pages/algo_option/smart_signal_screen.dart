import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joyn/components/static_decoration.dart';

import '../../components/app_asset.dart';
import '../../components/buttons/text_button.dart';
import '../../components/colors.dart';
import '../../components/ui.dart';

class SmartSignalScreen extends StatefulWidget {
  const SmartSignalScreen({Key? key}) : super(key: key);

  @override
  State<SmartSignalScreen> createState() => _SmartSignalScreenState();
}

class _SmartSignalScreenState extends State<SmartSignalScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        appBar: UiInterface.CustomAppBar(
          titleShow: true,
          title: "Fiscal Smart Signal",
        ),
        body: ListView(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24).r,
          children: [
            Text(
              'We created the Smart tool with expertise solutions for excellent trading that help you for perfect for Buying & Selling. Experience the right & trusted way of trading with us.',
              style: TextStyle(
                  height: 1.4,
                  fontFamily: "Montserrat-Regular",
                  fontSize: 12.sp,
                  color: greyTextColor),
            ),
            customHeight(8.h),
            Text(
              'Automatically give alerts for buy & sell so you can fly high! This tool gives you perfect signal for all trading view profiles. Enhance your market with smart decision making tool.',
              style: TextStyle(
                  height: 1.4,
                  fontFamily: "Montserrat-Regular",
                  fontSize: 12.sp,
                  color: greyTextColor),
            ),
            customHeight(50.h),
              Image.asset(AppAsset.smartSignalImage,width: double.infinity,),
              customHeight(100.h),
              PrimaryTextButton(
                title: "Book Your Appointment Now",
                onPressed: () {},
              ),
          ],
        ),
      ),
    );
  }
}
