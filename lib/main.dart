// import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joyn/app.dart';
import 'package:joyn/controller/sign_up_controller.dart';

import 'utils/app_constants.dart';
import 'utils/network_dio/network_dio.dart';
// import 'package:joyn/utils/app_constants.dart';
// import 'package:joyn/utils/network_dio/network_dio.dart';

GetStorage? dataStorage;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  Stripe.publishableKey =
  "pk_test_51OKEnxSIfGMQApXyQrgtrIzI5Er2x12VMGNeR8m7ritBUHfpwHy3eE5kKI79x7YALcsvHhSxr7MIfZV3fq8ftvf000U2MpivLS";

  dataStorage = GetStorage();

  await Firebase.initializeApp().then((value) => Get.put(SignUpController()));
  NetworkDioHttp.setDynamicHeader(endPoint: ApiAppConstants.apiEndPoint);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemStatusBarContrastEnforced: true,
    ),
  );
  runApp(const FiscalFinserveApp());
}
