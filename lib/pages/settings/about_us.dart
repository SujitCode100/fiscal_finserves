import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Languages/Languages.dart';
import '../../components/colors.dart';
import '../../components/static_decoration.dart';
import '../../components/ui.dart';

class about_us extends StatefulWidget {
  const about_us({Key? key}) : super(key: key);

  @override
  State<about_us> createState() => _about_usState();
}

class _about_usState extends State<about_us> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: primaryWhite,
      appBar:
      UiInterface.CustomAppBar(titleShow: true, title: Languages.of(context)!.about_us),
      body: ListView(
        padding:
        const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24).r,
        children: [
          Text(
            'About Fiscal Finserve Solution Pvt.Ltd',
            style: TextStyle(
                fontFamily: "Montserrat-Bold",
                fontSize: 18.sp,
                color: textBoldColor),
          ),
          customHeight(27.h),
          Text(
            'Welcome to Fiscal Finserve Solution Pvt. Ltd, a pioneering force in the stock market industry since 2008. Renowned for our revolutionary work and innovative approach, we have established ourselves as leaders committed to reshaping the landscape of financial markets.',
            style: TextStyle(
                height: 1.4,
                fontFamily: "Montserrat-Regular",
                fontSize: 12.sp,
                color: greyTextColor),
          ),
          customHeight(27.h),
          Text(
            'Our Mission: -',
            style: TextStyle(
                fontFamily: "Montserrat-Bold",
                fontSize: 18.sp,
                color: textBoldColor),
          ),
          customHeight(27.h),
          Text(
            'To provide accessible and affordable financial services to individuals and businesses while promoting financial literacy and stability.',
            style: TextStyle(
                height: 1.4,
                fontFamily: "Montserrat-Regular",
                fontSize: 12.sp,
                color: greyTextColor),
          ),
          customHeight(27.h),
          Text(
            'Our Vision: -',
            style: TextStyle(
                fontFamily: "Montserrat-Bold",
                fontSize: 18.sp,
                color: textBoldColor),
          ),
          customHeight(27.h),
          Text(
            'Our vision is to become a leading financial services provider, recognized for delivering innovative solutions, exceptional customer service, and promoting financial wellness.',
            style: TextStyle(
                height: 1.4,
                fontFamily: "Montserrat-Regular",
                fontSize: 12.sp,
                color: greyTextColor),
          ),
          customHeight(27.h),
          Text(
            'Services We Offer: - ',
            style: TextStyle(
                fontFamily: "Montserrat-Bold",
                fontSize: 18.sp,
                color: textBoldColor),
          ),
          customHeight(27.h),
          Row(
            children: [
              customWidth(10.w),
              Icon(
                Icons.circle,
                color: primaryBlack,
                size: 5,
              ),
              customWidth(8.h),
              Expanded(
                child: Text(
                  'Education and Training: From basic to advanced training, we equip traders with the knowledge and skills needed to navigate the stock market confidently.',
                  style: TextStyle(
                      fontFamily: "Montserrat-Regular",
                      fontSize: 11.26.sp,
                      color: greyTextColor),
                ),
              ),
            ],
          ),
          customHeight(10.h),
          Row(
            children: [
              customWidth(10.w),
              Icon(
                Icons.circle,
                color: primaryBlack,
                size: 5,
              ),
              customWidth(8.h),
              Expanded(
                child: Text(
                  'AI-Based Trading: Harness the power of artificial intelligence with our advanced trading solutions designed to optimize your trading strategies.',
                  style: TextStyle(
                      fontFamily: "Montserrat-Regular",
                      fontSize: 11.26.sp,
                      color: greyTextColor),
                ),
              ),
            ],
          ),
          customHeight(10.h),
          Row(
            children: [
              customWidth(10.w),
              Icon(
                Icons.circle,
                color: primaryBlack,
                size: 5,
              ),
              customWidth(8.h),
              Expanded(
                child: Text(
                  'Co-working Space: Our collaborative trading spaces provide a dynamic environment for traders to connect, share ideas, and thrive together.',
                  style: TextStyle(
                      fontFamily: "Montserrat-Regular",
                      fontSize: 11.26.sp,
                      color: greyTextColor),
                ),
              ),
            ],
          ),
          customHeight(27.h),
          Text(
            'Our Success Journey: -',
            style: TextStyle(
                fontFamily: "Montserrat-Bold",
                fontSize: 18.sp,
                color: textBoldColor),
          ),
          customHeight(27.h),
          Text(
            'With a successful journey spanning over a decade, Fiscal Finserve boasts a community of over 12,000 traders. Our journey is a testament to our commitment to excellence, continuous innovation, and the success stories of the individuals who have chosen to trade with us.',
            style: TextStyle(
                height: 1.4,
                fontFamily: "Montserrat-Regular",
                fontSize: 12.sp,
                color: greyTextColor),
          ),
          customHeight(27.h),
          Text(
            'Join Us on the Path to Success: -',
            style: TextStyle(
                fontFamily: "Montserrat-Bold",
                fontSize: 18.sp,
                color: textBoldColor),
          ),
          customHeight(27.h),
          Text(
            'Embark on your trading journey with Fiscal Finserve Solution Pvt. Ltd. Whether you\'re a novice or an experienced trader, our comprehensive solutions and supportive community are here to elevate your trading experience.',
            style: TextStyle(
                height: 1.4,
                fontFamily: "Montserrat-Regular",
                fontSize: 12.sp,
                color: greyTextColor),
          ),
          customHeight(10.h),
          Text(
            'Thank you for being a part of our success story. Your financial success begins with Fiscal Finserve.',
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
