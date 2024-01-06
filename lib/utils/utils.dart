import 'package:flutter/material.dart';

import '../components/colors.dart';

class Utils {
  static final messsengerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(content: Text(text),backgroundColor: red,);

            messsengerKey.currentState!..removeCurrentSnackBar()..showSnackBar(snackBar);
  }
}