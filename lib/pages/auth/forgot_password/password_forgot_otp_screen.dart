import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../components/buttons/text_button.dart';
import '../../../components/colors.dart';
import '../../../components/static_decoration.dart';
import '../../../components/ui.dart';

class PasswordForgotOtpScreen extends StatefulWidget {
  const PasswordForgotOtpScreen({Key? key}) : super(key: key);

  @override
  State<PasswordForgotOtpScreen> createState() => _PasswordForgotOtpScreenState();
}

class _PasswordForgotOtpScreenState extends State<PasswordForgotOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        appBar: UiInterface.CustomAppBar(),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 32, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Verification',
                style: TextStyle(
                    fontSize: 24.sp,
                    fontFamily: "Montserrat-Bold",
                    color: textBoldColor),
              ),
              customHeight(16.h),
              Text(
                'Enter 4-digit code we just texted to your',
                style: TextStyle(
                    fontFamily: "Montserrat-Regular",
                    fontSize: 14.sp,
                    color: textRegularColor),
              ),
              customHeight(5.h),
              Row(
                children: [
                  Text(
                    'phone number, ',
                    style: TextStyle(
                        fontFamily: "Montserrat-Regular",
                        fontSize: 14.sp,
                        color: textRegularColor),
                  ),
                  Text(
                    '${'+91'} 999 999 999',
                    style: TextStyle(
                        fontFamily: "Montserrat-Medium",
                        fontSize: 14.sp,
                        color: buttonsColor),
                  ),
                ],
              ),
              customHeight(40.h),
              Pinput(
                keyboardType: TextInputType.number,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                defaultPinTheme: PinTheme(
                  width: 64.w,
                  height: 64.h,
                  textStyle: TextStyle(
                      fontSize: 24.sp,
                    fontFamily: "Montserrat-Bold",
                    color: buttonsColor),
                  decoration: BoxDecoration(
                    border: Border.all(color: buttonsColor,width: 1.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                focusedPinTheme: PinTheme(
                   width: 64.w,
                  height: 64.h,
                  textStyle: TextStyle(
                      fontSize: 24.sp,
                    fontFamily: "Montserrat-Bold",
                    color: whiteColor),
                  decoration: BoxDecoration(
                    color: buttonsColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                submittedPinTheme: PinTheme(
                   width: 64.w,
                  height: 64.h,
                  textStyle: TextStyle(
                      fontSize: 24.sp,
                    fontFamily: "Montserrat-Bold",
                    color: whiteColor),
                  decoration: BoxDecoration(
                    color: buttonsColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (s) {
                  return s == '2222' ? null : 'Pin is incorrect';
                },
                // pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: false,
                onCompleted: (pin) => print(pin),
              ),
              Spacer(),
              PrimaryTextButton(
                title: "Continue",
                onPressed: () {},
              ),
              customHeight(16.h),
              PrimaryTextBorderButton(
                title: "Resend code",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}