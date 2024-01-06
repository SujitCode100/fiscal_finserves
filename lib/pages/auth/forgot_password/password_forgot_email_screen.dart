import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../components/buttons/text_button.dart';
import '../../../components/colors.dart';
import '../../../components/static_decoration.dart';
import '../../../components/ui.dart';
import '../../../widget/text_widgets/input_text_field_widget.dart';
import 'password_forgot_otp_screen.dart';

class PasswordForgotEmailScreen extends StatefulWidget {
  const PasswordForgotEmailScreen({Key? key}) : super(key: key);

  @override
  State<PasswordForgotEmailScreen> createState() => _PasswordForgotEmailScreenState();
}

class _PasswordForgotEmailScreenState extends State<PasswordForgotEmailScreen> {
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
                'Password Recovery',
                style: TextStyle(
                    fontSize: 24.sp,
                    fontFamily: "Montserrat-Bold",
                    color: textBoldColor),
              ),
              customHeight(16.h),
              Text(
                'Enter your email to recover your password',
                style: TextStyle(
                    fontFamily: "Montserrat-Regular",
                    fontSize: 14.sp,
                    color: textRegularColor),
              ),
              customHeight(5.h),
              Text(
                '',
                style: TextStyle(
                    fontFamily: "Montserrat-Regular",
                    fontSize: 14.sp,
                    color: textRegularColor),
              ),
              customHeight(40.h),
              textFormField(
                  labelText: "Email address",
                  hintText: "Email address",),
              Spacer(),
              PrimaryTextButton(
                title: "Send OTP Code",
                onPressed: () {
                  Get.to(
                    () => PasswordForgotOtpScreen(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}