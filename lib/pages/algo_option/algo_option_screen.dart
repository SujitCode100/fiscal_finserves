import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joyn/pages/algo_option/algo_segment_screen.dart';
import 'package:joyn/pages/algo_option/demat_account.dart';
import 'package:joyn/pages/algo_option/fiscal_option_warriors.dart';
import 'package:joyn/pages/algo_option/ticket_size_screen.dart';
import '../../components/app_asset.dart';
import '../../components/colors.dart';
import '../../components/ui.dart';

class AlgoOptionScreen extends StatefulWidget {
  const AlgoOptionScreen({Key? key}) : super(key: key);

  @override
  State<AlgoOptionScreen> createState() => _AlgoOptionScreenState();
}

class _AlgoOptionScreenState extends State<AlgoOptionScreen> {
  final List title = [
    "Algo Segment",
    "Demat Account",
    "Fiscal Option Warriors"
  ];

  final List page = [
    AlgoSegmentScreen(),
    demat_account(),
    fiscal_option_warriors()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        appBar:
            UiInterface.CustomAppBar(titleShow: true, title: "Algo Options",isBack: false),
        body: ListView(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24).r,
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: title.length,
              itemBuilder: (c, i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => page[i],
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 24),
                    padding: EdgeInsets.all(24),
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
                            title[i],
                            style: TextStyle(
                                fontFamily: "Montserrat-Bold",
                                fontSize: 15.sp,
                                color: textBoldColor),
                          ),
                        ),
                        Image.asset(
                          AppAsset.rightArrow,
                          height: 16.h,
                          width: 16.w,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
