import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/app_asset.dart';
import '../../components/colors.dart';
import '../../components/ui.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        appBar: UiInterface.CustomAppBar(titleShow: true, title: "Settings"),
        body: ListView(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 24).r,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 20).r,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10).r,
                  // border: Border.all(width: 2, color: courseCardColor),
                  color: cardColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Contact US',
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
                      color: textGreyColor,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 20).r,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10).r,
                  // border: Border.all(width: 2, color: courseCardColor),
                  color: cardColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'About US',
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
                      color: textGreyColor,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 20).r,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10).r,
                  // border: Border.all(width: 2, color: courseCardColor),
                  color: cardColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Rate US',
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
                      color: textGreyColor,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 20).r,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10).r,
                  // border: Border.all(width: 2, color: courseCardColor),
                  color: cardColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Privacy & Refund Policy',
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
                      color: textGreyColor,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 20).r,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10).r,
                  // border: Border.all(width: 2, color: courseCardColor),
                  color: cardColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Terms & Condition',
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
                      color: textGreyColor,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
