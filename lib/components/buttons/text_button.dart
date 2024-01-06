// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joyn/components/app_text_style.dart';
import 'package:joyn/components/colors.dart';
import 'package:joyn/components/static_decoration.dart';

// ignore: must_be_immutable
class PrimaryTextButton extends StatelessWidget {
  String? title;
  VoidCallback onPressed;
  Color? buttonColor;
  Color? textColor;
  double? width;
  double? height;
  BorderSide? border;
  bool autofocus;
  Color? titleColor;
  double? fontSize;
  BorderRadiusGeometry? borderRadius;

  PrimaryTextButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.buttonColor,
    this.textColor,
    this.border,
    this.width,
    this.height,
    this.titleColor,
    this.fontSize,
    this.borderRadius,
    this.autofocus = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        autofocus: autofocus,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: border ?? BorderSide.none,
            borderRadius: borderRadius ?? BorderRadius.circular(24.r),
          ),
          primary: textColor ?? primaryWhite,
          onSurface: primaryWhite,
          backgroundColor: buttonColor ?? buttonsColor,
          fixedSize: Size(
            width ?? double.maxFinite,
            height ?? 64,
          ),
          alignment: Alignment.center,
          textStyle: TextStyle(
              fontSize:fontSize ?? 16.sp,
              debugLabel: "Title",
              fontFamily: "Montserrat-Bold"),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            title.toString(),
            softWrap: true,
            textAlign: TextAlign.center,
            style: AppTextStyle.normalSemiBold14
                .copyWith(color: titleColor ?? primaryWhite),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

// ignore: must_be_immutable
class PrimaryTextBorderButton extends StatelessWidget {
  String? title;
  VoidCallback onPressed;
  Color? buttonColor;
  Color? textColor;
  double? width;
  double? height;
  BorderSide? border;
  bool autofocus;
  Color? titleColor;
  BorderRadiusGeometry? borderRadius;

  PrimaryTextBorderButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.buttonColor,
    this.textColor,
    this.border,
    this.width,
    this.height,
    this.titleColor,
    this.borderRadius,
    this.autofocus = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        autofocus: autofocus,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: border ?? BorderSide(width: 1.5, color: buttonsColor),
            borderRadius: borderRadius ?? BorderRadius.circular(24.r),
          ),
          primary: textColor ?? primaryWhite,
          onSurface: primaryWhite,
          backgroundColor: buttonColor ?? Colors.transparent,
          fixedSize: Size(
            width ?? double.maxFinite,
            height ?? 64,
          ),
          alignment: Alignment.center,
          textStyle: TextStyle(
              fontSize: 16.sp,
              debugLabel: "Title",
              fontFamily: "Montserrat-Bold",
              color: buttonsColor),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            title.toString(),
            softWrap: true,
            textAlign: TextAlign.center,
            style: AppTextStyle.normalSemiBold14
                .copyWith(color: titleColor ?? buttonsColor),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class ImageButton extends StatelessWidget {
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final String? imageLink;
  final IconData? iconLink;
  final String? buttonName;
  final Color? buttonColor;
  final double? iconHeight;
  final VoidCallback? onPressed;

  const ImageButton({
    Key? key,
    this.width,
    this.height,
    this.textStyle,
    this.buttonColor,
    this.imageLink,
    this.iconLink,
    this.iconHeight,
    required this.onPressed,
    required this.buttonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height ?? 55,
        width: width ?? double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: circular30BorderRadius,
          color: buttonColor ?? secondaryButtonColor.withOpacity(0.3),
          border: Border.all(color: primaryWhite, width: 1.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageLink != null
                ? Image.asset(
                    imageLink.toString(),
                    height: iconHeight ?? 30,
                    fit: BoxFit.cover,
                  )
                : Icon(
                    iconLink,
                    color: primaryWhite,
                    size: iconHeight ?? 26,
                  ),
            width15,
            Text(buttonName.toString(),
                style: textStyle ?? AppTextStyle.normalSemiBold16),
          ],
        ),
      ),
    );
  }
}
