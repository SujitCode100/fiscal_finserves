import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joyn/model/course_model.dart';

import '../components/colors.dart';
import '../utils/repository/network_repository.dart';

class CourseController extends GetxController {

  // RxList<Datum> coursesData = <Datum>[].obs;
  // RxMap coursesData = RxMap();
  RxList coursesData = [].obs;
  RxList getLectureData = [].obs;

  getCoursesData(BuildContext context) async {
    try {
      var response = await networkRepository.getCourses(context);

      if (response['body']['status'] == 200) {
        // log("courseData--->${response['body']}");
        
        // coursesData.add(response['body']['data']);
        coursesData.value = response['body']['data'];
        // coursesData.refresh();

        // var dd = CourseModel.fromJson(response["body"]["data"]);
        debugPrint('\x1b[97m CoursesData : ${coursesData[1]['description']}');
        // log("CoursesData${dd.toString()}");
        // coursesData.value = dd.data;
        // debugPrint('\x1b[97m CoursesDataGet : ${coursesData}');
        // profileImage.value = profileData[0].image!;
        coursesData.refresh();
      } else {
        Get.snackbar('Error!', response['body']['message'],
            backgroundColor: red, colorText: primaryWhite);
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  getLectureByCourseIdData(BuildContext context) async {
    try {
      var response = await networkRepository.getLectureByCourseId(context,'6548e1b6c80560aab607e663');

      if (response['body']['status'] == 200) {
        // log("courseData--->${response['body']}");
        
        // coursesData.add(response['body']['data']);
        getLectureData.value = response['body']['data'][0]['lectureList'];
        // coursesData.refresh();

        // var dd = CourseModel.fromJson(response["body"]["data"]);
        debugPrint('CoursesData : ${getLectureData}');
        // log("CoursesData${dd.toString()}");
        // coursesData.value = dd.data;
        // debugPrint('\x1b[97m CoursesDataGet : ${coursesData}');
        // profileImage.value = profileData[0].image!;
        getLectureData.refresh();
      } else {
        Get.snackbar('Error!', response['body']['message'],
            backgroundColor: red, colorText: primaryWhite);
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

}