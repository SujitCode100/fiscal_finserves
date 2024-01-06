import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joyn/pages/auth/verify/verify_phone_number_screen.dart';

import '../../../components/app_asset.dart';
import '../../../components/buttons/text_button.dart';
import '../../../components/colors.dart';
import '../../../components/static_decoration.dart';
import '../../../components/ui.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        resizeToAvoidBottomInset: false,
        appBar: UiInterface.CustomAppBar(),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customHeight(68.h),
              Image.asset(
                AppAsset.verifyImage,
                height: 140.h,
                width: 140.w,
              ),
              customHeight(40.h),
              Text(
                'Secure your account',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24.sp,
                    fontFamily: "Montserrat-Bold",
                    color: textBoldColor),
              ),
              customHeight(16.h),
              Text(
                'One way we keep your account secure is',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Montserrat-Regular",
                    fontSize: 14.sp,
                    color: textRegularColor),
              ),
              customHeight(5.h),
              Text(
                ' with 2-step verification, which requires',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Montserrat-Regular",
                    fontSize: 14.sp,
                    color: textRegularColor),
              ),
              customHeight(5.h),
              Text(
                ' your phone number.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Montserrat-Regular",
                    fontSize: 14.sp,
                    color: textRegularColor),
              ),
              Spacer(),
              PrimaryTextButton(
                title: "Continue",
                onPressed: () {
                  Get.to(()=> VerifyPhoneNumberScreen(),);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
