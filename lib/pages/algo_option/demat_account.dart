import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/app_asset.dart';
import '../../components/colors.dart';
import '../../components/ui.dart';
import 'package:url_launcher/url_launcher.dart';

class demat_account extends StatefulWidget {
  const demat_account({Key? key}) : super(key: key);

  @override
  State<demat_account> createState() => _demat_accountState();
}

class _demat_accountState extends State<demat_account> {

  final List title = [
    "Angel Demat Account",
    "Alice Blue Demat Account"
  ];

  final List page = [
    'http://tinyurl.com/ym57nu73',
    'https://app.aliceblueonline.com/OpenAccount.aspx?C=EPAT1932'
  ];

  Future<void> launchYoutubeUrl(String url1) async {
    var url = url1;
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        backgroundColor: primaryWhite,
        appBar: UiInterface.CustomAppBar(titleShow: true, title: "Demat Account",isBack: true),
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
                  launchYoutubeUrl(page[i]);
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
    ));
  }
}
