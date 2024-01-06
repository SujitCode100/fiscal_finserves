import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joyn/components/app_asset.dart';
import 'package:joyn/components/static_decoration.dart';

import '../../components/buttons/text_button.dart';
import '../../components/colors.dart';
import '../../components/ui.dart';

class ReferralCodeScreen extends StatefulWidget {
  const ReferralCodeScreen({Key? key}) : super(key: key);

  @override
  State<ReferralCodeScreen> createState() => _ReferralCodeScreenState();
}

class _ReferralCodeScreenState extends State<ReferralCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        appBar:
            UiInterface.CustomAppBar(titleShow: true, title: "Referral Code"),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView(
                padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 35, bottom: 24)
                    .r,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Image.asset(AppAsset.referImage),
                  ),
                  customHeight(50.h),
                  Text(
                    "Refer & Earn",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Montserrat-Bold",
                        fontSize: 24.sp,
                        color: textBoldColor),
                  ),
                  customHeight(16.h),
                  Text(
                    'Share this code with your friend and\nboth of you will get \$10 free stocks.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Montserrat-Regular",
                        height: 1.7,
                        fontSize: 14.sp,
                        color: greyTextColor),
                  ),
                  customHeight(60.h),
                  DottedBorder(
                    color: buttonsColor,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(20).r,
                    dashPattern: [10, 10],
                    strokeWidth: 1.5,
                    child: Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 19),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20).r,
                        color: courseCardColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "TRADEBASE",
                              style: TextStyle(
                                  fontFamily: "Montserrat-Bold",
                                  fontSize: 15.sp,
                                  color: textBoldColor),
                            ),
                          ),
                          GestureDetector(
                            onTap:() {
                              Clipboard.setData(new ClipboardData(text: "TRADEBASE"))
                                  .then((_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Copied to your clipboard !')));
                              });
                            },
                            child: Row(
                              children: [
                                Image.asset(
                                  AppAsset.copyIcon,
                                  height: 24.h,
                                  width: 24.w,
                                ),
                                customWidth(7.w),
                                Text(
                                  "Copy Code",
                                  style: TextStyle(
                                      fontFamily: "Montserrat-Bold",
                                      fontSize: 15.sp,
                                      color: buttonsColor),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 24, bottom: 24)
                  .r,
              child: PrimaryTextButton(
                title: "Refer friend",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
