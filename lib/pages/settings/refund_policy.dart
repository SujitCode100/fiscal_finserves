import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Languages/Languages.dart';
import '../../components/colors.dart';
import '../../components/static_decoration.dart';
import '../../components/ui.dart';

class refund_policy extends StatefulWidget {
  const refund_policy({Key? key}) : super(key: key);

  @override
  State<refund_policy> createState() => _refund_policyState();
}

class _refund_policyState extends State<refund_policy> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: primaryWhite,
      appBar: UiInterface.CustomAppBar(titleShow: true, title: Languages.of(context)!.refund_policy),
      body: ListView(
        padding:
        const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24).r,
        children: [
          Text(
            'Effective Date: 01/01/2024',
            style: TextStyle(
                height: 1.4,
                fontFamily: "Montserrat-Regular",
                fontSize: 12.sp,
                color: greyTextColor),
          ),
          customHeight(27.h),
          Text(
            'All Sales Are Final – No Refund Policy ',
            style: TextStyle(
                fontFamily: "Montserrat-Bold",
                fontSize: 18.sp,
                color: textBoldColor),
          ),
          customHeight(27.h),
          Text(
            'Thank you for choosing Fiscal Finserve Stock Market Learning App. Before you proceed with your purchase, please carefully read and understand our refund policy.',
            style: TextStyle(
                height: 1.4,
                fontFamily: "Montserrat-Regular",
                fontSize: 12.sp,
                color: greyTextColor),
          ),
          customHeight(27.h),
          Text(
            '1. All Sales Are Final:',
            style: TextStyle(
                fontFamily: "Montserrat-Bold",
                fontSize: 18.sp,
                color: textBoldColor),
          ),
          customHeight(27.h),
          Text(
            'Once a purchase is made through the Fiscal Finserve Stock Market Learning App, it is considered final.No refunds, returns, or exchanges will be provided for any reason, including but not limited to dissatisfaction with the features, performance, or any other aspect of the app.',
            style: TextStyle(
                height: 1.4,
                fontFamily: "Montserrat-Regular",
                fontSize: 12.sp,
                color: greyTextColor),
          ),
          customHeight(27.h),
          Text(
            '2. Acknowledgment:',
            style: TextStyle(
                fontFamily: "Montserrat-Bold",
                fontSize: 18.sp,
                color: textBoldColor),
          ),
          customHeight(27.h),
          Text(
            'By using and/or purchasing any of our services or products, you acknowledge that you have read, understood, and agree to abide by this refund policy.It is the responsibility of the user to evaluate the app and its features before making a purchase decision.',
            style: TextStyle(
                height: 1.4,
                fontFamily: "Montserrat-Regular",
                fontSize: 12.sp,
                color: greyTextColor),
          ),
          customHeight(27.h),
          Text(
            '3. Technical Support:',
            style: TextStyle(
                fontFamily: "Montserrat-Bold",
                fontSize: 18.sp,
                color: textBoldColor),
          ),
          customHeight(27.h),
          Text(
            'If you encounter any technical issues or difficulties with the Fiscal Finserve Stock Market App, please contact our customer support team for assistance.Technical support is available to address and resolve issues related to the functionality of the app  .',
            style: TextStyle(
                height: 1.4,
                fontFamily: "Montserrat-Regular",
                fontSize: 12.sp,
                color: greyTextColor),
          ),
          customHeight(27.h),
          Text(
            '4. Unauthorized Transactions:',
            style: TextStyle(
                fontFamily: "Montserrat-Bold",
                fontSize: 18.sp,
                color: textBoldColor),
          ),
          customHeight(27.h),
          Text(
            'If you believe that an unauthorized transaction has taken place, please contact our customer support immediately for investigation and resolution.',
            style: TextStyle(
                height: 1.4,
                fontFamily: "Montserrat-Regular",
                fontSize: 12.sp,
                color: greyTextColor),
          ),
          customHeight(27.h),
          Text(
            '5.Changes to Refund Policy:',
            style: TextStyle(
                fontFamily: "Montserrat-Bold",
                fontSize: 18.sp,
                color: textBoldColor),
          ),
          customHeight(27.h),
          Text(
            'Fiscal Finserve reserves the right to amend or update this refund policy at any time without prior notice.Users are encouraged to review this policy periodically for any changes.',
            style: TextStyle(
                height: 1.4,
                fontFamily: "Montserrat-Regular",
                fontSize: 12.sp,
                color: greyTextColor),
          ),
          customHeight(27.h),
          Text(
            'Contact Information:-',
            style: TextStyle(
                fontFamily: "Montserrat-Bold",
                fontSize: 18.sp,
                color: textBoldColor),
          ),
          customHeight(27.h),
          Text(
            'For any questions or concerns regarding this refund policy, please contact our customer support team at info@fiscalfinserve.com or +919327232419 By using the Fiscal Finserve Stock Market Learning App, you agree to be bound by the terms and conditions of this refund policy. If you do not agree with this policy, please refrain from making any purchases through the app.',
            style: TextStyle(
                height: 1.4,
                fontFamily: "Montserrat-Regular",
                fontSize: 12.sp,
                color: greyTextColor),
          ),
          customHeight(27.h),
          Text(
            'Thank you for choosing Fiscal Finserve.',
            style: TextStyle(
                fontFamily: "Montserrat-Bold",
                fontSize: 18.sp,
                color: textBoldColor),
          ),
          customHeight(27.h),
          Text(
            'Fiscal Finserve Solution Pvt.Ltd \n Contact Mail: - info@fiscalfinserve.com \n Contact Number: - 9327232419',
            style: TextStyle(
                fontFamily: "Montserrat-Bold",
                fontSize: 15.sp,
                color: textBoldColor),
          ),

        ],
      ),
    ));
  }
}
