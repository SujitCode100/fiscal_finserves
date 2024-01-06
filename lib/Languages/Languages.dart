import 'package:flutter/cupertino.dart';

abstract class Languages {

  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get home;

  String get whatsapp;

  String get services;

  String get profile;

  String get tending_in_zone;

  String get view_all;

  String get feature_courses;

  String get get_this_course;

  String get upcoming_course;

  String get get_started;

  String get connect_with_us;

  String get hi;

  String get trade_with_trend;

  String get my_courses;

  String get my_documents;

  String get refund_policy;

  String get privacy_policy;

  String get about_us;

  String get contact_us;

  String get use_app;

  String get edit_profile;

  String get logout;

  String get billing;

  String get language;

  String get FAQ;

  String get rate_us;

  String get share_app;

  String get full_name;

  String get email_address;

  String get whatsapp_no;

  String get date_of_birth;

  String get Gender;

  String get Address;

  String get biling_name;

  String get gst_number;

  String get save;

  String get demo_video;

  String get buy_now;
}