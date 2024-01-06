import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Padding
const EdgeInsets horizonatal20 = EdgeInsets.symmetric(horizontal: 20);
EdgeInsets customVerticalHorizontal20({double vertical = 0}) =>
    EdgeInsets.symmetric(horizontal: 20, vertical: vertical);

// Sizedbox
SizedBox customWidth(double width) => SizedBox(width: width);
 SizedBox width05 = SizedBox(width: 05.w);
 SizedBox width10 = SizedBox(width: 10.w);
 SizedBox width15 = SizedBox(width: 15.w);

SizedBox customHeight(double height) => SizedBox(height: height);
 SizedBox height05 = SizedBox(height: 05.h);
 SizedBox height10 = SizedBox(height: 10.h);
 SizedBox height15 = SizedBox(height: 15.h);
 SizedBox height20 = SizedBox(height: 20.h);
 SizedBox height16 = SizedBox(height: 16.h);

BorderRadius circularBorderRadius(double radius) =>
    BorderRadius.circular(radius);
BorderRadius circular5BorderRadius = BorderRadius.circular(4.r);
BorderRadius circular8BorderRadius = BorderRadius.circular(8.r);
BorderRadius circular10BorderRadius = BorderRadius.circular(10.r);
BorderRadius circular15BorderRadius = BorderRadius.circular(15.r);
BorderRadius circular20BorderRadius = BorderRadius.circular(20.r);
BorderRadius circular24BorderRadius = BorderRadius.circular(24.r);
BorderRadius circular25BorderRadius = BorderRadius.circular(25.r);
BorderRadius circular30BorderRadius = BorderRadius.circular(30.r);
