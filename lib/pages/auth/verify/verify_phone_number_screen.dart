import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joyn/components/app_asset.dart';
import 'package:joyn/pages/auth/verify/verify_otp_screen.dart';
import '../../../components/buttons/text_button.dart';
import '../../../components/colors.dart';
import '../../../components/static_decoration.dart';
import '../../../components/ui.dart';
import '../../../widget/text_widgets/input_text_field_widget.dart';

class VerifyPhoneNumberScreen extends StatefulWidget {
  const VerifyPhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<VerifyPhoneNumberScreen> createState() =>
      _VerifyPhoneNumberScreenState();
}

class _VerifyPhoneNumberScreenState extends State<VerifyPhoneNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        resizeToAvoidBottomInset: false,
        appBar: UiInterface.CustomAppBar(),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 32, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Set up 2-step verification',
                style: TextStyle(
                    fontSize: 24.sp,
                    fontFamily: "Montserrat-Bold",
                    color: textBoldColor),
              ),
              customHeight(16.h),
              Text(
                'Enter your phone number so we can text you ',
                style: TextStyle(
                    fontFamily: "Montserrat-Regular",
                    fontSize: 14.sp,
                    color: textRegularColor),
              ),
              customHeight(5.h),
              Text(
                'an authentication code',
                style: TextStyle(
                    fontFamily: "Montserrat-Regular",
                    fontSize: 14.sp,
                    color: textRegularColor),
              ),
              customHeight(40.h),
              textFormField(
                  labelText: "Phone number",
                  hintText: "Phone number",
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
                title: "Continue",
                onPressed: () {
                  Get.to(
                    () => VerifyOtpScreen(),
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
