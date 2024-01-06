import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joyn/components/colors.dart';

import '../pages/bottom_bar/bottom_bar_screen.dart';
import '../utils/repository/network_repository.dart';

class OTPController extends GetxController{

  final NetworkRepository _networkRepository = NetworkRepository();
  final TextEditingController otpController = TextEditingController();


  Future OtpVerification(context,String otp,String number) async {
    var response = await _networkRepository.verifyOtp(
        context, {"otp": int.parse(otp),"phoneNumber" : number});

    if (response['body']['status'] == 200) {
      // log("message body ==> ${response['body']}");
      // Get.back();
      Get.offAll(const BottomBarScreen());
      Get.snackbar('Success', response["body"]["message"],
          backgroundColor: greenColor, colorText: primaryBlack);
      // previousPage();
    } else {
      Get.snackbar('Error', response["body"]["message"],
          backgroundColor: red, colorText: primaryWhite);
    }
  }
}