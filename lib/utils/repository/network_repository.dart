import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joyn/components/colors.dart';
import 'package:joyn/components/common_methos.dart';

import 'package:joyn/utils/app_constants.dart';
import 'package:joyn/utils/network_dio/network_dio.dart';

NetworkRepository networkRepository = NetworkRepository();

class NetworkRepository {
  static final NetworkRepository _networkRepository =
      NetworkRepository._internal();
  static final dataStorage = GetStorage();

  factory NetworkRepository() {
    return _networkRepository;
  }
  NetworkRepository._internal();

  FocusNode searchFocus = FocusNode();

  // StreamController gameDetailStream = new StreamController
  //     .broadcast(); // for stream builder - to add data in stramCiontroller
//Login
  userSignUp(context, authUserData) async {
    try {
      final authUserResponse = await NetworkDioHttp.postDioHttpMethod(
        url: ApiAppConstants.apiEndPoint + ApiAppConstants.signUp,
        context: context,
        data: authUserData,
      );
      debugPrint('\x1b[97m Response : $authUserResponse');
      return authUserResponse;
      // return checkResponse(
      //     authUserResponse, LoginModel.fromJson(authUserResponse['body']));
    } catch (e) {
      CommonMethod().getXSnackBar("Error", e.toString(), red);
    }
  }

  verifyOtp(BuildContext context, data) async {
    try {
      var response = await NetworkDioHttp.postDioHttpMethod(
        url: '${ApiAppConstants.apiEndPoint}${ApiAppConstants.otp}',
        data: data,
        context: context,
      );
      return response;
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  userLogin(BuildContext context, Map data) async {
    try {
      Map response = await NetworkDioHttp.postDioHttpMethod(
        url: '${ApiAppConstants.apiEndPoint}${ApiAppConstants.login}',
        data: data,
        context: context,
      );
      debugPrint('\x1b[97m Response : $response');
      return response;
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  // User

  getProfile(BuildContext context, String id) async {
    try {
      var response = await NetworkDioHttp.getDioHttpMethod(
        url:
            '${ApiAppConstants.apiEndPoint}${ApiAppConstants.userDetailsById}${id}',
        context: context,
      );
      debugPrint('\x1b[97m getProfile Response : $response');
      return response;
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  updateProfile(context, data) async {
    try {
      var response = await NetworkDioHttp.postDioHttpMethod(
        context: context,
        url: ApiAppConstants.apiEndPoint + ApiAppConstants.updateUser,
        data: data,
      );
      log('\x1b[97m updateProfile Response : $response');
      return response;
      // return checkResponse(
      //     authUserResponse, LoginModel.fromJson(authUserResponse['body']));
    } catch (e) {
      CommonMethod().getXSnackBar("Error", e.toString(), red);
    }
  }

  // Course
  getCourses(BuildContext context) async {
    try {
      var response = await NetworkDioHttp.getDioHttpMethod(
        url:
            '${ApiAppConstants.apiEndPoint}${ApiAppConstants.getCourses}',
        context: context,
      );
      print('Course Response: $response');
      return response;
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

   // getLectureByCourseId
  getLectureByCourseId(BuildContext context,String id) async {
    try {
      var response = await NetworkDioHttp.getDioHttpMethod(
        url:
            '${ApiAppConstants.apiEndPoint}${ApiAppConstants.getLectureByCourseId}${id}',
        context: context,
      );
      debugPrint('\x1b[97m getLectureByCourseId Response : $response');
      return response;
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> checkResponse(
    response,
    modelResponse,
  ) async {
    log("response check------>${response}---->Checked");
    if ((response['body']['status'] == 401 ||
            response['body']['status'] == 410) &&
        dataStorage.read("token") != null) {}
    if (response["error_description"] == null ||
        response["error_description"] == 'null') {
      if (response['body']['status'] == 200 ||
          response['body']['status'] == "200") {
        return modelResponse;
        // } else {
        //   showErrorDialog(message: response['body']['message']);
        // }
      } else if (response['body']['status'] == 500 ||
          response['body']['status'] == "500") {
        return modelResponse;
      } else {
        showErrorDialog(message: response['body']['message']);
      }
    }
    // else {
    //   if (response['body']['status'] == 401 ||
    //       response['body']['status'] == '401') {
    //     showErrorDialog(message: response['body']['message']);
    //     Future.delayed(Duration(seconds: 2), () {
    //       // Get.to(LoginScreen());
    //     });
    // }
    else {
      if (dataStorage.read("token") != null) {
        showErrorDialog(message: response['body']['message']);
      }
    }
    // }
  }

  Future<void> checkResponse2(
    response,
  ) async {
    log("response check------>2${response['body']['message']}---->Checked");
    if ((response['body']['status'] == 401 ||
            response['body']['status'] == 410) &&
        dataStorage.read("token") != null) {}
    if (response["error_description"] == null ||
        response["error_description"] == 'null') {
      if (response['body']['status'] == 200 ||
          response['body']['status'] == "200") {
        log('${response['body']}');
        return response['body'];
      } else if (response['body']['status'] == 500 ||
          response['body']['status'] == "500") {
        showErrorDialog(message: response['body']['message']);
        return response['body'];
      } else {
        showErrorDialog(message: response['body']['message']);
      }
    } else {
      if (dataStorage.read("token") != null) {
        showErrorDialog(message: response['error_description']);
      }
    }
  }

  void showErrorDialog({required String message}) {
    CommonMethod().getXSnackBar("Error", message.toString(), red);
  }
}
