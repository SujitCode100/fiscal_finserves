import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:joyn/components/static_decoration.dart';

import '../../../components/app_asset.dart';
import '../../../components/colors.dart';
import '../../profile/edit_profile_screen.dart';

enum menuValues {
  reference,
  upcoming,
  euity,
  share,
}

class DashUiInterface {
  //AppBar
  static PreferredSize CustomAppBar(
      {bool? titleShow,
      String? title,
      bool? actionImageShow,
      String? actionImage,
      String? name,
      Function()? onTap}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(75.h),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(
                      () => EditProfileScreen(),
                );
              },
              child: Container(
                height: 48.h,
                width: 48.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(AppAsset.profileAvatar),
                      fit: BoxFit.contain),
                ),
              ),
            ),
            customWidth(14.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name.toString(),
                  style: TextStyle(
                      fontFamily: "Montserrat-Bold",
                      fontSize: 18.sp,
                      color: textBoldColor),
                ),
                customHeight(3.h),
                Text(
                  'Trade with Trend',
                  style: TextStyle(
                      fontFamily: "Montserrat-Regular",
                      fontSize: 14.sp,
                      color: textRegularColor),
                )
              ],
            ),
            Spacer(),
            // titleShow == true ? Text(
            //   title ?? '',
            //   style: TextStyle(
            //       fontSize: 18.sp,
            //       fontFamily: "Montserrat-Bold",
            //       color: textBoldColor),
            // ) : Text(''),
            GestureDetector(
              child:  Icon(
                Icons.notification_add,
                color: greyTextColor,
                size: 24,
              ),
            ),
            customWidth(10.w),
            GestureDetector(
              onTap: onTap,
              child: Image.asset(
                AppAsset.menu,
                height: 24.h,
                width: 24.w,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget customCourse(
      {String? title,
      String? subTitle1,
      String? subTitle2,
      String? subTitle3,
      String? subTitle4,
      String? subTitle5,
      bool? fiveText,
      String? chargeText,
      required Function() onTap}) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24).r,
        color: courseCardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20).r,
            child: Text(
              title ?? 'Free Course',
              style: TextStyle(
                  fontFamily: "Montserrat-Bold",
                  fontSize: 24.sp,
                  color: buttonsColor),
            ),
          ),
          customHeight(8.h),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20).r,
            child: Row(
              children: [
                Icon(
                  Icons.circle,
                  color: courseTextColor,
                  size: 5,
                ),
                customWidth(8.h),
                Text(
                  subTitle1 ?? 'No limit for watching time',
                  style: TextStyle(
                      fontFamily: "Montserrat-SemiBold",
                      fontSize: 10.sp,
                      color: courseTextColor),
                ),
              ],
            ),
          ),
          customHeight(6.h),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20).r,
            child: Row(
              children: [
                Icon(
                  Icons.circle,
                  color: courseTextColor,
                  size: 5,
                ),
                customWidth(8.h),
                Text(
                  subTitle2 ?? 'Hedge Demo Session',
                  style: TextStyle(
                      fontFamily: "Montserrat-SemiBold",
                      fontSize: 10.sp,
                      color: courseTextColor),
                ),
              ],
            ),
          ),
          customHeight(6.h),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20).r,
            child: Row(
              children: [
                Icon(
                  Icons.circle,
                  color: courseTextColor,
                  size: 5,
                ),
                customWidth(8.h),
                Text(
                  subTitle3 ?? 'Basic Demo Session',
                  style: TextStyle(
                      fontFamily: "Montserrat-SemiBold",
                      fontSize: 10.sp,
                      color: courseTextColor),
                ),
              ],
            ),
          ),
          customHeight(6.h),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20).r,
            child: Row(
              children: [
                Icon(
                  Icons.circle,
                  color: courseTextColor,
                  size: 5,
                ),
                customWidth(8.h),
                Text(
                  subTitle4 ?? 'Discipline Training',
                  style: TextStyle(
                      fontFamily: "Montserrat-SemiBold",
                      fontSize: 10.sp,
                      color: courseTextColor),
                ),
              ],
            ),
          ),
          fiveText == true ? customHeight(6.h) : SizedBox(),
          fiveText == true
              ? Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20).r,
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: courseTextColor,
                        size: 5,
                      ),
                      customWidth(8.h),
                      Text(
                        subTitle5 ?? 'Discipline Training',
                        style: TextStyle(
                            fontFamily: "Montserrat-SemiBold",
                            fontSize: 10.sp,
                            color: courseTextColor),
                      ),
                    ],
                  ),
                )
              : SizedBox(),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12).r,
            child: Stack(
              children: [
                SizedBox(
                  height: 110.h,
                  child: Center(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1.5, color: primaryWhite),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        primary: primaryWhite,
                        onSurface: primaryWhite,
                        backgroundColor: buttonsColor,
                        fixedSize: Size(
                          double.maxFinite,
                          56,
                        ),
                        alignment: Alignment.center,
                        textStyle: TextStyle(
                            fontSize: 20.sp,
                            debugLabel: "Title",
                            fontFamily: "Montserrat-Bold"),
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8).r,
                          child: Text(
                            chargeText ?? 'No Enrolment Charge!',
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: primaryWhite,
                                fontFamily: "Montserrat-Bold"),
                          ),
                        ),
                      ),
                      onPressed: null,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 12.w,
                  right: 12.w,
                  child: Center(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1.5, color: buttonsColor),
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        primary: primaryWhite,
                        onSurface: primaryWhite,
                        backgroundColor: primaryWhite,
                        fixedSize: Size(
                          double.maxFinite,
                          40,
                        ),
                        alignment: Alignment.center,
                        textStyle: TextStyle(
                            fontSize: 12.sp,
                            debugLabel: "Title",
                            fontFamily: "Montserrat-Bold",
                            color: buttonsColor),
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Subscribe Now!',
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: buttonsColor,
                              fontFamily: "Montserrat-Bold"),
                        ),
                      ),
                      onPressed: onTap,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
