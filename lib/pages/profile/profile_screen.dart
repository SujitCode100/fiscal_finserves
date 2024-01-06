import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:joyn/controller/profile_controller.dart';
import 'package:joyn/pages/auth/sign_in_screen.dart';
import 'package:joyn/pages/profile/edit_profile_screen.dart';
import 'package:joyn/pages/profile/language_screen.dart';
import 'package:joyn/pages/profile/referral_code_screen.dart';
import 'package:joyn/pages/settings/billing_otpion.dart';
import 'package:joyn/pages/settings/faq.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Languages/Languages.dart';
import '../../components/app_asset.dart';
import '../../components/colors.dart';
import '../../components/static_decoration.dart';
import '../../controller/sign_up_controller.dart';
import '../../main.dart';



final String url = "http://play.google.com/store/apps/details?id=";
final String packageName = "com.weblock.fiscal_finserve";

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final signUpController = Get.put(SignUpController());
  final profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    profileController.getProfiles(context);
    print("sssss${profileController.profileData}");
  }

  Future<void> shareApp() async {
    final String appLink = 'https://play.google.com/store/apps/details?id=com.weblock.fiscal_finserve';
    final String message = 'Check out my new app: $appLink';
    await FlutterShare.share(title: 'Share App', text: message, linkUrl: appLink);
  }


  final _dialog = RatingDialog(
    initialRating: 1.0,
    // your app's name?
    title: Text(
      'Rating Dialog',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    // encourage your user to leave a high rating?
    message: Text(
      'Tap a star to set your rating. Add more description here if you want.',
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 15),
    ),
    // your app's logo?
    image:  const FlutterLogo(size: 100),
    submitButtonText: 'Submit',
    commentHint: 'Reviews',
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      print('rating: ${response.rating}, comment: ${response.comment}');

      // TODO: add your own logic
      if (response.rating < 3.0) {
        // send their comments to your email or anywhere you wish
        // ask the user to contact you instead of leaving a bad review
      } else {
        _launchUrl();
      }
    },
  );



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: "Montserrat-Bold",
                        color: textBoldColor),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => EditProfileScreen(),
                      );
                    },
                    child: Text(
                      Languages.of(context)!.edit_profile,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: "Montserrat-Bold",
                          color: pink),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Obx(
          () => ListView(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24)
                    .r,
            children: [
              Row(
                children: [
                  Container(
                    height: 80.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(AppAsset.profileAvatar),
                          fit: BoxFit.contain),
                    ),
                  ),
                  customWidth(14.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${profileController.profileData['fullName']}",
                        style: TextStyle(
                            fontFamily: "Montserrat-Bold",
                            fontSize: 18.sp,
                            color: textBoldColor),
                      ),
                      customHeight(5.h),
                      Text(
                        // '',
                        "${profileController.profileData['email']}",
                        // userData.phoneNumber!,
                        style: TextStyle(
                            fontFamily: "Montserrat-Regular",
                            fontSize: 14.sp,
                            color: textRegularColor),
                      )
                    ],
                  ),
                ],
              ),
              customHeight(24.h),
              GestureDetector(
                onTap: () {
                  Get.to(
                    () => ReferralCodeScreen(),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 76.h,
                  padding: EdgeInsets.only(left: 24, right: 24).r,
                  decoration: BoxDecoration(
                      color: courseCardColor,
                      borderRadius: BorderRadius.circular(16).r),
                  child: Center(
                    child: Row(
                      children: [
                        Container(
                          height: 32.h,
                          width: 32.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(AppAsset.referralIcon),
                                fit: BoxFit.contain),
                          ),
                        ),
                        customWidth(14.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Referral Code',
                              style: TextStyle(
                                  fontFamily: "Montserrat-Bold",
                                  fontSize: 14.sp,
                                  color: textBoldColor),
                            ),
                            customHeight(4.h),
                            Text(
                              'Share your friend get \n \$20 of free stocks',
                              style: TextStyle(
                                  fontFamily: "Montserrat-Medium",
                                  fontSize: 12.sp,
                                  color: textRegularColor),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              customHeight(32.h),
              DottedLine(
                dashLength: 10,
                dashGapLength: 4,
                lineThickness: 1,
                dashColor: textRegularColor,
              ),
              customHeight(32.h),
              GestureDetector(
                onTap: () {
                  Get.to(
                        () => billing_option(),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Container(
                            height: 32.h,
                            width: 32.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12).r,
                              image: DecorationImage(
                                  image: AssetImage(AppAsset.paymentIcon),
                                  fit: BoxFit.contain),
                            ),
                          ),
                          customWidth(16.w),
                          Text(
                            Languages.of(context)!.billing,
                            style: TextStyle(
                                fontFamily: "Montserrat-Bold",
                                fontSize: 14.sp,
                                color: textBoldColor),
                          ),
                        ],
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
              customHeight(32.h),
              GestureDetector(
                onTap: () async {
                  Get.to(
                    () => LanguageScreen(),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Container(
                            height: 32.h,
                            width: 32.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12).r,
                              image: DecorationImage(
                                  image: AssetImage(AppAsset.languageIcon),
                                  fit: BoxFit.contain),
                            ),
                          ),
                          customWidth(16.w),
                          Text(
                            Languages.of(context)!.language,
                            style: TextStyle(
                                fontFamily: "Montserrat-Bold",
                                fontSize: 14.sp,
                                color: textBoldColor),
                          ),
                        ],
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
              customHeight(32.h),
              GestureDetector(
                onTap: () {
                  Get.to(
                        () => FAQ(),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Container(
                            height: 32.h,
                            width: 32.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12).r,
                              image: DecorationImage(
                                  image: AssetImage(AppAsset.faqIcon),
                                  fit: BoxFit.contain),
                            ),
                          ),
                          customWidth(16.w),
                          Text(
                            'FAQ',
                            style: TextStyle(
                                fontFamily: "Montserrat-Bold",
                                fontSize: 14.sp,
                                color: textBoldColor),
                          ),
                        ],
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
              customHeight(32.h),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true, // set to false if you want to force a rating
                    builder: (context) => _dialog,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Container(
                            height: 32.h,
                            width: 32.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12).r,
                              image: DecorationImage(
                                  image: AssetImage(AppAsset.rateUs),
                                  fit: BoxFit.contain),
                            ),
                          ),
                          customWidth(16.w),
                          Text(
                            Languages.of(context)!.rate_us,
                            style: TextStyle(
                                fontFamily: "Montserrat-Bold",
                                fontSize: 14.sp,
                                color: textBoldColor),
                          ),
                        ],
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
              customHeight(32.h),
              GestureDetector(
                onTap: (){
                  shareApp();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Container(
                            height: 32.h,
                            width: 32.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12).r,
                              image: DecorationImage(
                                  image: AssetImage(AppAsset.shareApp),
                                  fit: BoxFit.contain),
                            ),
                          ),
                          customWidth(16.w),
                          Text(
                            Languages.of(context)!.share_app,
                            style: TextStyle(
                                fontFamily: "Montserrat-Bold",
                                fontSize: 14.sp,
                                color: textBoldColor),
                          ),
                        ],
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
              customHeight(32.h),
              GestureDetector(
                onTap: () {
                  // signUpController.logout();
                },
                // onTap: () => FirebaseAuth.instance.signOut(),
                child: GestureDetector(
                  onTap: () {
                    dataStorage!.remove('token');
                    dataStorage!.erase();
                    Get.offAll(() => const SignInScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Container(
                              height: 32.h,
                              width: 32.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12).r,
                                image: DecorationImage(
                                    image: AssetImage(AppAsset.logoutIcon),
                                    fit: BoxFit.contain),
                              ),
                            ),
                            customWidth(16.w),
                            Text(
                              Languages.of(context)!.logout,
                              style: TextStyle(
                                  fontFamily: "Montserrat-Bold",
                                  fontSize: 14.sp,
                                  color: textBoldColor),
                            ),
                          ],
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
              ),
              customHeight(32.h),
            ],
          ),
        ),
      ),
    );
  }

}

Future _launchUrl() async {
  final Uri _url = Uri.parse(url+packageName);
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
