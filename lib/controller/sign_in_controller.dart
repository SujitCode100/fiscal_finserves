// import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';

import '../components/colors.dart';
import '../main.dart';
import '../pages/bottom_bar/bottom_bar_screen.dart';
import '../utils/repository/network_repository.dart';

class SignInController extends GetxController {
  final TextEditingController phoneController = TextEditingController();

  authLogin(BuildContext context) async {
    try {
      var data = {
        "phoneNumber": phoneController.text,
      };

      log("client login ${data}");

      var response = await networkRepository.userLogin(context, data);

      if (response['body']['status'] == 200) {
        dataStorage!
            .write('_id', response['body']['data']['_id']);
        dataStorage!.write('token', response['body']['data']['token']);
        log("---sujit----${dataStorage!.read('_id')}");

        log("---sujit---- ${response}");

        // NetworkDioHttp.setDynamicHeader(endPoint: ApiAppConstants.apiEndPoint);

        Get.snackbar('Success', response['body']['message'],
            backgroundColor: greenColor, colorText: primaryWhite);
        // emailController.clear();
        // passwordController.clear();

        Get.offAll(
            () => ShowCaseWidget(
              builder: Builder(
                builder: (context) => const BottomBarScreen(),
              ),
            ),
          );
      } else {
        Get.snackbar('Error!', response['body']['message'],
            backgroundColor: red, colorText: primaryWhite);
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
