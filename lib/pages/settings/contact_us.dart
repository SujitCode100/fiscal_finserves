import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Languages/Languages.dart';
import '../../components/app_asset.dart';
import '../../components/colors.dart';
import '../../components/static_decoration.dart';
import '../../components/ui.dart';

class contact_us extends StatefulWidget {
  const contact_us({Key? key}) : super(key: key);

  @override
  State<contact_us> createState() => _contact_usState();
}

class _contact_usState extends State<contact_us>  {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: primaryWhite,
      appBar: UiInterface.CustomAppBar(titleShow: true, title: Languages.of(context)!.contact_us),
      body: ListView(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24).r,
        children: [
          Container(
            child: Center(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(24).w,
              child: Image.asset(
                AppAsset.contact_image,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            )),
          ),
          customHeight(24.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20).r,
              color: courseCardColor,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.phone_android,
                  color: greyTextColor,
                  size: 24,
                ),
                customWidth(10.w),
                Text(
                 "18008919677 / 9978597777",
                  style: TextStyle(
                      fontFamily: "Montserrat-Bold",
                      fontSize: 15.sp,
                      color: textBoldColor),
                )
              ],
            ),
          ),
          customHeight(10.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20).r,
              color: courseCardColor,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.mail,
                  color: greyTextColor,
                  size: 24,
                ),
                customWidth(10.w),
                Text(
                  "info@fiscalfinserve.com",
                  style: TextStyle(
                      fontFamily: "Montserrat-Bold",
                      fontSize: 15.sp,
                      color: textBoldColor),
                )
              ],
            ),
          ),
          customHeight(10.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20).r,
              color: courseCardColor,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.maps_home_work,
                  color: greyTextColor,
                  size: 24,
                ),
                customWidth(10.w),
                Text(
                  "B/301, Astha Square,\n Near Kapodra Uttran Bridge ,\n Utran , Surat, Gujarat 394105",
                  style: TextStyle(
                      fontFamily: "Montserrat-Bold",
                      fontSize: 15.sp,
                      color: textBoldColor),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
