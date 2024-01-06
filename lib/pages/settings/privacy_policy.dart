import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Languages/Languages.dart';
import '../../components/colors.dart';
import '../../components/static_decoration.dart';
import '../../components/ui.dart';

class privacy_policy extends StatefulWidget {
  const privacy_policy({Key? key}) : super(key: key);

  @override
  State<privacy_policy> createState() => _privacy_policyState();
}

class _privacy_policyState extends State<privacy_policy> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: primaryWhite,
      appBar: UiInterface.CustomAppBar(titleShow: true, title: Languages.of(context)!.privacy_policy),
      body: ListView(
        padding:
        const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24).r,
        children: [
          Text(
            'Welcome to the Fiscal Finserve Solution Pvt. Ltd. App, your platform for stock market education. At Fiscal Finserve, we prioritize your privacy and are dedicated to ensuring the security of your information. Our Privacy Policy is designed to transparently explain how we collect, utilize, and safeguard your data.',
            style: TextStyle(
                height: 1.4,
                fontFamily: "Montserrat-Regular",
                fontSize: 12.sp,
                color: greyTextColor),
          ),
          customHeight(27.h),
          Text(
            'Information We Collect:',
            style: TextStyle(
                fontFamily: "Montserrat-Bold",
                fontSize: 18.sp,
                color: textBoldColor),
          ),
          customHeight(27.h),
          Text(
             'Personal Information: We collect essential details such as your name and contact information.Educational Information: Your learning progress and preferences are gathered to tailor our educational content.Device and Usage Information: We may collect your IP address, device type, and usage patterns for improving our app\'s functionality.',
            style: TextStyle(
                height: 1.4,
                fontFamily: "Montserrat-Regular",
                fontSize: 12.sp,
                color: greyTextColor),
          ),
          customHeight(27.h),
          Text(
            'How We Use Your Information:',
            style: TextStyle(
                fontFamily: "Montserrat-Bold",
                fontSize: 18.sp,
                color: textBoldColor),
          ),
          customHeight(27.h),
          Text(
            'We utilize your information to deliver personalized educational content and enhance your learning experience.',
            style: TextStyle(
                height: 1.4,
                fontFamily: "Montserrat-Regular",
                fontSize: 12.sp,
                color: greyTextColor),
          ),
          customHeight(10.h),
          Text(
            'Your data helps us improve our app\'s features and functionality.Periodically, we may communicate with you about updates, promotions, and other relevant news.Compliance with legal obligations is a priority in our data processing practices.',
            style: TextStyle(
                height: 1.4,
                fontFamily: "Montserrat-Regular",
                fontSize: 12.sp,
                color: greyTextColor),
          ),
          customHeight(27.h),
          Text(
            'Information Sharing:',
            style: TextStyle(
                fontFamily: "Montserrat-Bold",
                fontSize: 18.sp,
                color: textBoldColor),
          ),
          customHeight(27.h),
          Text(
            'We want to assure you that we do not sell, trade, or transfer your personal information to third parties without your explicit consent. Information is shared only as outlined in this Privacy Policy.',
            style: TextStyle(
                height: 1.4,
                fontFamily: "Montserrat-Regular",
                fontSize: 12.sp,
                color: greyTextColor),
          ),
          customHeight(27.h),
          Text(
            'Security:-',
            style: TextStyle(
                fontFamily: "Montserrat-Bold",
                fontSize: 18.sp,
                color: textBoldColor),
          ),
          customHeight(27.h),
          Text(
            'We implement robust security measures to prevent unauthorized access, disclosure, alteration, or destruction of your data.',
            style: TextStyle(
                height: 1.4,
                fontFamily: "Montserrat-Regular",
                fontSize: 12.sp,
                color: greyTextColor),
          ),
          customHeight(27.h),
          Text(
            'Your Choices:-',
            style: TextStyle(
                fontFamily: "Montserrat-Bold",
                fontSize: 18.sp,
                color: textBoldColor),
          ),
          customHeight(27.h),
          Text(
            'You have the right to access, correct, or delete your personal information.Manage your preferences to control the use of your data.',
            style: TextStyle(
                height: 1.4,
                fontFamily: "Montserrat-Regular",
                fontSize: 12.sp,
                color: greyTextColor),
          ),
          customHeight(27.h),
          Text(
            'Changes to this Policy:-',
            style: TextStyle(
                fontFamily: "Montserrat-Bold",
                fontSize: 18.sp,
                color: textBoldColor),
          ),
          customHeight(27.h),
          Text(
            'Updates to our Privacy Policy will be posted within the app along with the effective date.',
            style: TextStyle(
                height: 1.4,
                fontFamily: "Montserrat-Regular",
                fontSize: 12.sp,
                color: greyTextColor),
          ),
          customHeight(27.h),
          Text(
            'Contact Us:-',
            style: TextStyle(
                fontFamily: "Montserrat-Bold",
                fontSize: 18.sp,
                color: textBoldColor),
          ),
          customHeight(27.h),
          Text(
            'If you have any questions or concerns about our Privacy Policy, please contact us at [info@fiscalfinserve.com].',
            style: TextStyle(
                height: 1.4,
                fontFamily: "Montserrat-Regular",
                fontSize: 12.sp,
                color: greyTextColor),
          ),
        ],
      ),
    ));
  }
}
