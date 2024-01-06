import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:joyn/components/app_asset.dart';
import 'package:joyn/components/app_text_style.dart';
import 'package:joyn/components/buttons/text_button.dart';
import 'package:joyn/components/colors.dart';
import 'package:joyn/components/static_decoration.dart';

class UiInterface {
  //AppBar
  static PreferredSize CustomAppBar({bool? titleShow,String? title,bool? actionImageShow,String? actionImage,bool? isBack}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(65),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isBack == false ? SizedBox(
              height: 40.h,
              width: 40.w,
            ) : GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Image.asset(
                AppAsset.backArrow,
                height: 40.h,
                width: 40.w,
              ),
            ),
            titleShow == true ? Expanded(
              child: Text(
                title ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: title!.length>15?15.sp:18.sp,
                    fontFamily: "Montserrat-Bold",
                    color: textBoldColor),
              ),
            ) : Text(''),
           actionImageShow == true ? Image.asset(
             actionImage ?? AppAsset.backArrow,
              height: 40.h,
              width: 40.w,
            ):SizedBox(
              height: 40.h,
              width: 40.w,
            ),
          ],
        ),
      ),
    );
  }

  static Widget squreIconWidget(
      {Color? color,
      required String iconName,
      Color? iconColor,
      double? width,
      EdgeInsetsGeometry? padding,
      double? iconHeight,
      double? iconWidth,
      required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 40,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        color: color ?? lightBlackColor,
        child: SvgPicture.asset(
          iconName,
          color: iconColor ?? primaryWhite,
          height: iconHeight ?? 10,
          width: iconWidth ?? 16,
        ),
      ),
    );
  }

  void showbottomSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  static Widget circleIconWidget(
      {Color? color, required String iconName, Function()? onTap}) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? primaryBlack,
        ),
        child: SvgPicture.asset(
          iconName,
          height: 14,
          width: 14,
        ),
      ),
    );
  }

  static Widget headingWidget({required String title}) {
    return Text(
      title,
      style: AppTextStyle.normalBold12.copyWith(
        color: textGreyColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static Widget imageButton(
      {required String title, required Function() onTap}) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: redColor, borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 15),
        // margin: const EdgeInsets.only(bottom: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: AppTextStyle.normalBold16.copyWith(
                  color: primaryWhite,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center),
            width10,
            SvgPicture.asset(AppAsset.logo),
          ],
        ),
      ),
    );
  }

  static Widget bottomBarButtonWidget(
      {required String title,
      required Function() onPressed,
      Color background = whiteColor,
      Color? btncolor,
      BorderRadiusGeometry? borderRadius,
      required BuildContext context}) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 100,
        color: background,
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: PrimaryTextButton(
          borderRadius: borderRadius ?? BorderRadius.zero,
          buttonColor: btncolor ?? appBlackColor,
          title: title,
          onPressed: onPressed,
        ),
      ),
    );
  }

  static Widget tabBarWidget({
    required String primaryText,
    required String secondoryText,
    required RxBool isActiveTab,
    required Function() primaryOnTap,
    required Function() secondoryOnTap,
    bool fromInbox = false,
    String primaryBagdeText = '0',
    String secondoryBagdeText = '0',
  }) {
    return Container(
      color: lightBlackColor,
      margin: const EdgeInsets.only(top: 25),
      padding: const EdgeInsets.all(8),
      child: Obx(
        () => Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: primaryOnTap,
                child: Container(
                  color: isActiveTab.value ? primaryWhite : lightBlackColor,
                  alignment: Alignment.center,
                  child: fromInbox
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              primaryText,
                              style: AppTextStyle.normalRegular12.copyWith(
                                color: isActiveTab.value
                                    ? primaryBlack
                                    : primaryWhite,
                              ),
                            ),
                            width05,
                            if (primaryBagdeText != "0")
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: isActiveTab.value
                                        ? primaryBlack
                                        : primaryWhite,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  primaryBagdeText,
                                  style: AppTextStyle.normalRegular12.copyWith(
                                    color: isActiveTab.value
                                        ? primaryBlack
                                        : primaryWhite,
                                  ),
                                ),
                              )
                          ],
                        )
                      : Text(
                          primaryText,
                          style: AppTextStyle.normalRegular12.copyWith(
                            color:
                                isActiveTab.value ? primaryBlack : primaryWhite,
                          ),
                        ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: secondoryOnTap,
                child: Container(
                  alignment: Alignment.center,
                  color: isActiveTab.value ? lightBlackColor : primaryWhite,
                  child: fromInbox
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              secondoryText,
                              style: AppTextStyle.normalRegular12.copyWith(
                                color: isActiveTab.value
                                    ? primaryWhite
                                    : primaryBlack,
                              ),
                            ),
                            width05,
                            if (secondoryBagdeText != "0")
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: isActiveTab.value
                                        ? primaryWhite
                                        : primaryBlack,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  secondoryBagdeText,
                                  style: AppTextStyle.normalRegular12.copyWith(
                                    color: isActiveTab.value
                                        ? primaryWhite
                                        : primaryBlack,
                                  ),
                                ),
                              )
                          ],
                        )
                      : Text(
                          secondoryText,
                          style: AppTextStyle.normalRegular12.copyWith(
                            color:
                                isActiveTab.value ? primaryWhite : primaryBlack,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget tabWidget({
    required String primaryText,
    required RxBool isActiveTab,
    required Function() primaryOnTap,
    bool fromInbox = false,
    String primaryBagdeText = '0',
    String secondoryBagdeText = '0',
  }) {
    return Obx(
      () => Expanded(
        child: InkWell(
          onTap: primaryOnTap,
          child: Container(
            color: isActiveTab.value ? primaryWhite : lightBlackColor,
            alignment: Alignment.center,
            child: fromInbox
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        primaryText,
                        style: AppTextStyle.normalRegular12.copyWith(
                          color:
                              isActiveTab.value ? primaryBlack : primaryWhite,
                        ),
                      ),
                      width05,
                      if (primaryBagdeText != "0")
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: isActiveTab.value
                                  ? primaryBlack
                                  : primaryWhite,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            primaryBagdeText,
                            style: AppTextStyle.normalRegular12.copyWith(
                              color: isActiveTab.value
                                  ? primaryBlack
                                  : primaryWhite,
                            ),
                          ),
                        )
                    ],
                  )
                : Text(
                    primaryText,
                    style: AppTextStyle.normalRegular12.copyWith(
                      color: isActiveTab.value ? primaryBlack : primaryWhite,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  static Widget buildHorizontalDivider({double? padding, double? height}) =>
      Container(
        margin: EdgeInsets.symmetric(vertical: padding ?? 20),
        height: height ?? 1,
        color: dividerColor.withOpacity(0.2),
      );

  static Widget editProfileImageWidget(
      {File? selectedProfileImage, required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: selectedProfileImage.toString() == 'null'
          ? Container(
              alignment: Alignment.center,
              color: greyColor,
              width: 90,
              height: 90,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: primaryBlack,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  AppAsset.logo,
                  height: 15,
                  width: 15,
                ),
              ),
            )
          : Image.file(
              File(selectedProfileImage!.path),
              height: 90,
              width: 90,
              fit: BoxFit.cover,
            ),
    );
  }
}
