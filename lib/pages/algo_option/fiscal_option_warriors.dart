import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/buttons/text_button.dart';
import '../../components/colors.dart';
import '../../components/static_decoration.dart';
import '../../components/ui.dart';

class fiscal_option_warriors extends StatefulWidget {
  const fiscal_option_warriors({Key? key}) : super(key: key);

  @override
  State<fiscal_option_warriors> createState() => _fiscal_option_warriorsState();
}

class _fiscal_option_warriorsState extends State<fiscal_option_warriors> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: primaryWhite,
      appBar:
      UiInterface.CustomAppBar(titleShow: true, title: "Fiscal Options Warriors"),
      body: ListView(
        padding:
        const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24).r,
        children: [
          Text(
            'What is Fiscal Option Warriors – Indicator?',
            style: TextStyle(
                fontFamily: "Montserrat-Bold",
                fontSize: 18.sp,
                color: textBoldColor),
          ),
          customHeight(10.h),
          Text(
            'The Fiscal Option Warriors Indicator is a powerful trading tool designed to assist traders in making informed decisions in financial markets. It provides buy and sell signals on the TradingView platform with an impressive accuracy rate of 85%–90%. Whether you\'re a beginner or an experienced trader, this indicator is user-friendly, making it accessible to all levels of expertise. ',
            style: TextStyle(
                height: 1.4,
                fontFamily: "Montserrat-Regular",
                fontSize: 12.sp,
                color: greyTextColor),
          ),
          customHeight(27.h),
          Text(
            'Benefits:-',
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
                  'Accurate Buy/Sell Signals',
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
                  'User-Friendly Interface',
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
                  '24/7 Customer Support',
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
                  'Telegram Signal Alerts',
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
                  'Risk Management',
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
                  'Enhanced Decision-Making',
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
            'Enhance your trading experience today with the Smart tool and experience the power of intelligent trading.',
            style: TextStyle(
                height: 1.4,
                fontFamily: "Montserrat-Regular",
                fontSize: 12.sp,
                color: greyTextColor),
          ),
          PrimaryTextButton(
            title: "Book Your Appointment Now",
            onPressed: () {
              launchUrl("https://youtu.be/wjQs198YT-0");
            },
          ),
        ],
      ),
    ));
  }


  Future<void> launchUrl(String url1) async {
    var url = url1;
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}


