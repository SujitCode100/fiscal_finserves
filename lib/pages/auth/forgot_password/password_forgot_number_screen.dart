import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joyn/pages/auth/forgot_password/password_forgot_otp_screen.dart';

import '../../../components/app_asset.dart';
import '../../../components/buttons/text_button.dart';
import '../../../components/colors.dart';
import '../../../components/static_decoration.dart';
import '../../../components/ui.dart';
import '../../../widget/text_widgets/input_text_field_widget.dart';

class PasswordForgotNumberScreen extends StatefulWidget {
  const PasswordForgotNumberScreen({Key? key}) : super(key: key);

  @override
  State<PasswordForgotNumberScreen> createState() => _PasswordForgotNumberScreenState();
}

class _PasswordForgotNumberScreenState extends State<PasswordForgotNumberScreen> {
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
                'Enter your Phone number to recover ',
                style: TextStyle(
                    fontFamily: "Montserrat-Regular",
                    fontSize: 14.sp,
                    color: textRegularColor),
              ),
              customHeight(5.h),
              Text(
                'your password',
                style: TextStyle(
                    fontFamily: "Montserrat-Regular",
                    fontSize: 14.sp,
                    color: textRegularColor),
              ),
              customHeight(40.h),
              textFormField(
                  labelText: "Phone number",
                  hintText: "Phone number",
                  keyboardType: TextInputType.number,
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      customWidth(18.w),
                      Image.asset(
                        AppAsset.flag,
                        height: 24.h,
                        width: 24.w,
                      ),
                      customWidth(10.w),
                      Text(
                        '+91',
                        style: TextStyle(
                            fontFamily: "Montserrat-Regular",
                            fontSize: 16.sp,
                            color: textRegularColor),
                      ),
                      customWidth(16.w),
                    ],
                  )),
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