import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joyn/components/app_asset.dart';

import '../../components/buttons/text_button.dart';
import '../../components/colors.dart';
import '../../components/static_decoration.dart';
import '../../components/ui.dart';

class DrAlgoScreen extends StatefulWidget {
  const DrAlgoScreen({Key? key}) : super(key: key);

  @override
  State<DrAlgoScreen> createState() => _DrAlgoScreenState();
}

class _DrAlgoScreenState extends State<DrAlgoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        appBar: UiInterface.CustomAppBar(
          titleShow: true,
          title: "Advantages of investing in DrAlgo",
        ),
        body: ListView(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24).r,
          children: [
            Row(
              children: [
                Icon(
                  Icons.circle,
                  color: greyTextColor,
                  size: 8,
                ),
                customWidth(5.w),
                Text(
                  'Best investment Plan to protect your money',
                  style: TextStyle(
                      fontFamily: "Montserrat-Regular",
                      fontSize: 12.sp,
                      color: greyTextColor),
                ),
              ],
            ),
            customHeight(10.h),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  color: greyTextColor,
                  size: 8,
                ),
                customWidth(5.w),
                Text(
                  'Fund Will remain In Your Account Only',
                  style: TextStyle(
                      fontFamily: "Montserrat-Regular",
                      fontSize: 12.sp,
                      color: greyTextColor),
                ),
              ],
            ),
            customHeight(10.h),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  color: greyTextColor,
                  size: 8,
                ),
                customWidth(5.w),
                Text(
                  'Works According To Hedging Strategy',
                  style: TextStyle(
                      fontFamily: "Montserrat-Regular",
                      fontSize: 12.sp,
                      color: greyTextColor),
                ),
              ],
            ),
            customHeight(10.h),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  color: greyTextColor,
                  size: 8,
                ),
                customWidth(5.w),
                Text(
                  'Advantage is You Can Set Your Own Risk',
                  style: TextStyle(
                      fontFamily: "Montserrat-Regular",
                      fontSize: 12.sp,
                      color: greyTextColor),
                ),
              ],
            ),
            customHeight(10.h),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  color: greyTextColor,
                  size: 8,
                ),
                customWidth(5.w),
                Text(
                  'Risk Reward Ratio is 1:17',
                  style: TextStyle(
                      fontFamily: "Montserrat-Regular",
                      fontSize: 12.sp,
                      color: greyTextColor),
                ),
              ],
            ),
            customHeight(26.h),
            Text(
                'There Backtesting and calculator should be included in algo segment',
                style: TextStyle(
                    fontFamily: "Montserrat-Bold",
                    height: 1.7.h,
                    fontSize: 12.sp,
                    color: textBoldColor),
              ),
              customHeight(50.h),
              Image.asset(AppAsset.dralgoImage,width: double.infinity,),
              customHeight(50.h),
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
