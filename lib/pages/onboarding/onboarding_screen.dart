import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joyn/components/buttons/text_button.dart';
import 'package:joyn/components/colors.dart';
// import 'package:joyn/components/static_decoration.dart';
import 'package:joyn/pages/auth/sign_in_screen.dart';
// import 'package:joyn/pages/auth/verify/verify_otp_screen.dart';

import 'onboarding_contents.dart';
import 'size_config.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;
  List colors = const [
    Color(0xffDAD3C8),
    Color(0xffFFE5DE),
    Color(0xffDCF6E6),
  ];

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: dotColor,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 8,
      curve: Curves.easeIn,
      width: _currentPage == index ? 24 : 8,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemCount: contents.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          contents[i].image,
                          height: SizeConfig.blockV! * 35,
                        ),
                        SizedBox(
                          height: (height >= 840) ? 61 : 34,
                        ),
                        Text(
                          contents[i].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "Montserrat-Bold",
                              fontSize: 24.sp,
                              color: textBoldColor),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          contents[i].desc,
                          style: TextStyle(
                              fontFamily: "Montserrat-Regular",
                              fontSize: 14.sp,
                              color: textRegularColor),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                      (int index) => _buildDots(
                        index: index,
                      ),
                    ),
                  ),
                  _currentPage + 1 == contents.length
                      ? Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            children: [
                              PrimaryTextButton(
                                title: "Get Started",
                                onPressed: () {
                                  Get.to(
                                    () => SignInScreen(),
                                  );
                                },
                              ),
                              // customHeight(16.h),
                              // PrimaryTextBorderButton(
                              //   title: "Sign in",
                              //   onPressed: () {
                              //     Get.to(
                              //       () => SignInScreen(),
                              //     );
                              //   },
                              // ),
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(24),
                          child: PrimaryTextButton(
                            title: "Next",
                            onPressed: () {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
