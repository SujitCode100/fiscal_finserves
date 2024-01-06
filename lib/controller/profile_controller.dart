import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/colors.dart';
import '../main.dart';
import '../utils/repository/network_repository.dart';

class ProfileController extends GetxController {

    final TextEditingController nameEditController = TextEditingController();
  final TextEditingController emailEditController = TextEditingController();
  final TextEditingController phoneNumberEditController = TextEditingController();
  final TextEditingController whatsappNumberEditController =
      TextEditingController();
  final TextEditingController countryEditController = TextEditingController();
  final TextEditingController stateEditController = TextEditingController();
  final TextEditingController cityEditController = TextEditingController();
  final TextEditingController confirmPasswordEditController =
      TextEditingController();
  final TextEditingController passwordEditController = TextEditingController();
  final TextEditingController dateOfBirthEditController = TextEditingController();
  final TextEditingController genderEditController = TextEditingController();
  
  RxMap profileData = RxMap();
  String? dropdownValue;

  getProfiles(BuildContext context) async {
    try {
      var response = await networkRepository.getProfile(
        context,
        '${dataStorage!.read('_id').toString()}',
      );

      log("profileData--->${response['body']['data']['fullName']}");

      if (response['body']['status'] == 200) {
        log("profileData--->${response['body']}");

        profileData.value = response['body']['data'];
        profileData.refresh();
      } else {
        Get.snackbar('Error!', response['body']['message'],
            backgroundColor: red, colorText: primaryWhite);
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  updateProfiles(BuildContext context) async {
    try {
      var data = {
        "_id": dataStorage!.read('_id'),
        "fullName": nameEditController.text,
        "email": emailEditController.text,
        "whatsappNumber": whatsappNumberEditController.text,
        "dateOfBirth": dateOfBirthEditController.text,
        "gender": dropdownValue,
        "country": countryEditController.text,
        "state": stateEditController.text,
        "city": cityEditController.text,
      };

      var response = await networkRepository.updateProfile(context, data);

      if (response['body']['status'] == 200) {
        log("profileData--->${response['body']}");

        Get.back();
        Get.snackbar('Success', response['body']['message'],
            backgroundColor: greenColor, colorText: primaryWhite);

        // homeController.currentIndex.value = 3;
      } else {
        Get.snackbar('Error!', response['body']['message'],
            backgroundColor: red, colorText: primaryWhite);
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
