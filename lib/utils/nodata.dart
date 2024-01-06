import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joyn/components/app_text_style.dart';
import 'package:joyn/components/colors.dart';
import 'package:joyn/components/static_decoration.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class NoData extends StatelessWidget {
  String? noDataText;
  String? lottieJson;
  NoData({
    Key? key,
    this.noDataText,
    this.lottieJson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // lottieJson != null
          // ?
          Lottie.asset(
            'assets/json/nodata.json',
            height: 200,
          ),
          // : Image.asset(
          //     'assets/gif/no-data.gif',
          //   ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: Get.height / 2,
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/png/sad 1.png",
                  height: 100,
                  width: 100,
                ),
                height10,
                Text(
                  "No Result Found",
                  style:
                      AppTextStyle.normalBold20.copyWith(color: appBlackColor),
                ),
                height10,
                Text(
                  "Please try something different.",
                  style: AppTextStyle.normalSemiBold14
                      .copyWith(color: appBlackColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
