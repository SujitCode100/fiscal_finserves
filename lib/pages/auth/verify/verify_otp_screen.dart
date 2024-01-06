import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joyn/controller/otp_controller.dart';
import 'package:pinput/pinput.dart';

import '../../../components/buttons/text_button.dart';
import '../../../components/colors.dart';
import '../../../components/static_decoration.dart';
import '../../../components/ui.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String? mobileNo;
  const VerifyOtpScreen({Key? key, this.mobileNo}) : super(key: key);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  var otp;
  final otpController = Get.put(OTPController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        appBar: UiInterface.CustomAppBar(),
        body: Form(
          key: formKey,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 32, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter authentication code',
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontFamily: "Montserrat-Bold",
                      color: textBoldColor),
                ),
                customHeight(16.h),
                Text(
                  'Enter 6-digit code we just texted to your',
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
                      widget.mobileNo!,
                      style: TextStyle(
                          fontFamily: "Montserrat-Medium",
                          fontSize: 14.sp,
                          color: buttonsColor),
                    ),
                  ],
                ),
                customHeight(40.h),
                Pinput(
                  length: 4,
                  controller: otpController.otpController,
                  keyboardType: TextInputType.number,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                  // pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  defaultPinTheme: PinTheme(
                    // width: 64.w,
                    height: 64.h,
                    textStyle: TextStyle(
                        fontSize: 24.sp,
                        fontFamily: "Montserrat-Bold",
                        color: buttonsColor),
                    decoration: BoxDecoration(
                      border: Border.all(color: buttonsColor, width: 1.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    //  width: 64.w,
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
                    //  width: 64.w,
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
                    return s == otp ? null : 'Pin is incorrect';
                  },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: false,
                  onCompleted: (pin) {
                    otp = pin;
                    // otpController.verifyOTP(otp);
                  },
                ),
                Spacer(),
                PrimaryTextButton(
                  title: "Continue",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                    otpController.OtpVerification(
                      context,
                      otpController.otpController.text,
                      widget.mobileNo.toString(),
                    );
                    }
                    // final user = UserModel(
                    //   fullName: widget.fullName,
                    //   email: widget.email,
                    //   phoneNumber: widget.mobileNo,
                    //   whatsappNumber: widget.whatsappNumber,
                    //   dateOfBirth: widget.dateOfBirth,
                    //   gender: widget.gender,
                    //   country: widget.country,
                    //   state: widget.state,
                    //   city: widget.city,
                    // );
                    // signUpController.createUser(user);
                  },
                ),
                customHeight(16.h),
                PrimaryTextBorderButton(
                  title: "Resend code",
                  onPressed: () {
                    // signUpController.phoneAuthentication(widget.mobileNo!);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
