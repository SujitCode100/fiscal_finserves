// ignore_for_file: body_might_complete_normally_catch_error



import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joyn/pages/auth/verify/verify_otp_screen.dart';

import '../components/colors.dart';
import '../main.dart';
import '../utils/repository/network_repository.dart';

class SignUpController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController whatsappNumberController =
      TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController genderController = TextEditingController();


   var dropdownValue = 'Gender';


  // API

  authSignUp(context) async {
    var data = {
      "fullName": nameController.text,
      "email": emailController.text,
      "phoneNumber": phoneNumberController.text,
      "whatsappNumber": whatsappNumberController.text,
      "dateOfBirth": dateOfBirthController.text,
      "gender": dropdownValue,
      "country": countryController.text,
      "state": stateController.text,
      "city": cityController.text,
      "password": passwordController.text,
    };
    var response = await networkRepository.userSignUp(context, data);
    log("status code :- ${response['body']['status']}");

    if (response['body']['status'] == 200) {
      log("data call :- ${response}");
      dataStorage!.write('fullName', nameController.text);
      dataStorage!.write('email', emailController.text);
      dataStorage!.write('phoneNumber', phoneNumberController.text);
      dataStorage!.write('whatsappNumber', whatsappNumberController.text);
      dataStorage!.write('dateOfBirth', dateOfBirthController.text);
      dataStorage!.write('gender', dropdownValue);
      dataStorage!.write('country', countryController.text);
      dataStorage!.write('state', stateController.text);
      dataStorage!.write('city', cityController.text);
      dataStorage!.write('password', passwordController.text);

      log("status code :- ${dataStorage!.read('dateOfBirth')}");

      Get.snackbar('Success', response["body"]["message"],
          backgroundColor: greenColor, colorText: primaryBlack);
      Get.to(
        () => VerifyOtpScreen(
          mobileNo: phoneNumberController.text,
        ),
      );
      // previousPage();
    } else {
      Get.snackbar('Error', response["body"]["message"],
          backgroundColor: red, colorText: primaryWhite);
    }
  }
}
