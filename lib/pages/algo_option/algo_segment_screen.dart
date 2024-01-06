import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:joyn/pages/algo_option/algo_booking.dart';
import 'package:joyn/pages/algo_option/ticket_report_screen.dart';

import '../../components/buttons/text_button.dart';
import '../../components/colors.dart';
import '../../components/static_decoration.dart';
import '../../components/ui.dart';

class AlgoSegmentScreen extends StatefulWidget {
  const AlgoSegmentScreen({Key? key}) : super(key: key);

  @override
  State<AlgoSegmentScreen> createState() => _AlgoSegmentScreenState();
}

class _AlgoSegmentScreenState extends State<AlgoSegmentScreen> {

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        appBar:
            UiInterface.CustomAppBar(titleShow: true, title: "Algo Options"),
        body: ListView(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24).r,
          children: [
            Text(
              'Fiscal Finserve Doctor Algo',
              style: TextStyle(
                  fontFamily: "Montserrat-Bold",
                  fontSize: 18.sp,
                  color: textBoldColor),
            ),
            customHeight(10.h),
            Text(
              'Unleash Your Portfolio\'s Potential with Dr. Algo: Where Science Meets Trading',
              style: TextStyle(
                  fontFamily: "Montserrat-Medium",
                  fontSize: 15.sp,
                  height: 1.3,
                  color: textBoldColor),
            ),
            customHeight(27.h),
            Text(
              '        Fiscal Finserve Solution Pvt Ltd offers Doctor Algo for PMS management this software forecasts early market situations and helps to take buy & sell trade automatically. By deploying a range of fund management strategies across asset classes through an automated trading infrastructure, we pursue opportunities that offer the highest potential for capital appreciation',
              style: TextStyle(
                  height: 1.4,
                  fontFamily: "Montserrat-Regular",
                  fontSize: 12.sp,
                  color: greyTextColor),
            ),
            customHeight(9.h),
            Text(
              '        Algorithmic trading combines computer programming and financial markets to execute trades at precise moments.',
              style: TextStyle(
                  height: 1.4,
                  fontFamily: "Montserrat-Regular",
                  fontSize: 12.sp,
                  color: greyTextColor),
            ),
            customHeight(9.h),
            Text(
              '        Trades are timed correctly and instantly to avoid significant price changes.Offers the maximum return on investment and lets you choose your own level of risk.',
              style: TextStyle(
                  height: 1.4,
                  fontFamily: "Montserrat-Regular",
                  fontSize: 12.sp,
                  color: greyTextColor),
            ),
            customHeight(9.h),
            Text(
              '        Our software is completely based on Al, providing an Algo trading based on Synthetic Hedge',
              style: TextStyle(
                  height: 1.4,
                  fontFamily: "Montserrat-Regular",
                  fontSize: 12.sp,
                  color: greyTextColor),
            ),
            customHeight(27.h),
            Text(
              'Ticket Size:-',
              style: TextStyle(
                  fontFamily: "Montserrat-Bold",
                  fontSize: 18.sp,
                  color: textBoldColor),
            ),
            customHeight(27.h),
            Text(
              'Different ticket sizes are offered with varying fees and the varied return on investment. A secure place to invest money that will yield the highest returns.',
              style: TextStyle(
                  height: 1.4,
                  fontFamily: "Montserrat-Regular",
                  fontSize: 12.sp,
                  color: greyTextColor),
            ),
            customHeight(24.h),

            Scrollbar(
              controller: _scrollController,
              trackVisibility: true,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 20, sortAscending: true,
                  headingRowColor:
                  MaterialStateColor.resolveWith((states) => buttonsColor),
                  border: TableBorder.all(width: 1, color: courseCardColor),
                  showBottomBorder: false,
                  horizontalMargin: 20,
                  dataTextStyle: TextStyle(
                      fontFamily: "Montserrat-SemiBold",
                      fontSize: 10.sp,
                      color: buttonsColor),
                  dataRowColor:
                  MaterialStateColor.resolveWith((states) => courseCardColor),
                  headingTextStyle: TextStyle(
                      fontFamily: "Montserrat-Bold",
                      fontSize: 12.sp,
                      color: primaryWhite),
                  // dataRowColor: courseCardColor,
                  columns: [
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Ticket Size',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Annual Charges\n(Including GST)',
                          textAlign: TextAlign.center,
                          style: TextStyle(height: 1.4),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Risk\n(Per Day)',
                          textAlign: TextAlign.center,
                          style: TextStyle(height: 1.4),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Return on investment\n(Per annum)',
                          textAlign: TextAlign.center,
                          style: TextStyle(height: 1.4),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Algo Performance\n(Report)',
                          textAlign: TextAlign.center,
                          style: TextStyle(height: 1.4),
                        ),
                      ),
                    ),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '2,20,000',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        DataCell(
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '23,600',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        DataCell(
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '1600',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        DataCell(
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '35 to 40%',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        DataCell(
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                    () => TicketReportScreen(
                                  price: '2,20,000',
                                ),
                              );
                            },
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Click Here',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: red,
                                      fontSize: 10.sp),
                                )),
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '3,60,000',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        DataCell(
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '29,500',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        DataCell(
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '2400',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        DataCell(
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '35 to 40%',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        DataCell(
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                    () => TicketReportScreen(
                                  price: '3,60,000',
                                ),
                              );
                            },
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Click Here',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: red,
                                      fontSize: 10.sp),
                                )),
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '4,80,000',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        DataCell(
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '35,400',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        DataCell(
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '3200',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        DataCell(
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '35 to 40 %',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        DataCell(
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                    () => TicketReportScreen(
                                  price: '4,80,000',
                                ),
                              );
                            },
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Click Here',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: red,
                                      fontSize: 10.sp),
                                )),
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '6,50,000',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        DataCell(
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '47,200',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        DataCell(
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '2000',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        DataCell(
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '40 to 50 %',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        DataCell(
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                    () => TicketReportScreen(
                                  price: '6,50,000',
                                ),
                              );
                            },
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Click Here',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: red,
                                      fontSize: 10.sp),
                                )),
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '10,00,000 or above',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        DataCell(
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '( 7 % of Investment )',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        DataCell(
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '3000',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        DataCell(
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '40 to 50 %',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        DataCell(
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                    () => TicketReportScreen(
                                  price: '10,00,000',
                                ),
                              );
                            },
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Click Here',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: red,
                                      fontSize: 10.sp),
                                )),
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '16,50,000 or above',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        DataCell(
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '( 7 % of Investment )',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        DataCell(
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '5000',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        DataCell(
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '40 to 50 %',
                                textAlign: TextAlign.center,
                              )),
                        ),
                        DataCell(
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                    () => TicketReportScreen(
                                  price: '16,50,000',
                                ),
                              );
                            },
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Click Here',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: red,
                                      fontSize: 10.sp),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            customHeight(27.h),
            Text(
              'How To Set Up Dr.Algo In Your Account ',
              style: TextStyle(
                  fontFamily: "Montserrat-Bold",
                  fontSize: 18.sp,
                  color: textBoldColor),
            ),
            customHeight(27.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    'Your Demat account should be open under the code Fiscal. ',
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    'You must transfer the funds to your demat account of your chosen relevant ticket size. Afterward, AI can be set up in your account. ',
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    'Within 24 hours of the funds being transferred, the algo system will begin to operate in your account.',
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
              'Advantages of investing in Dr.Algo',
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
                    'Best investment Plan to protect your money',
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
                    'Funds will remain In Your Account Only',
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
                    'Works According To Hedging Strategy',
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
                    'The advantage is You Can Set Your Own Risk',
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
                    'Risk Reward Ratio is 1:17',
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
              'Terms and Conditions for Dr. Algo:-',
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
                    'The algorithm will begin after the charges have been paid. In addition, the complete year of the charge must be paid in advance.',
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
                    'Demat ought to be in the Fiscal Finserve code.',
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
                    'Fiscal Finserve is not liable for any loss or gain.',
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
                    'Depending on the situation of the market, the return could be more or less.',
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
                    'Since these returns should be regarded as annual returns, the returns are set with annual performance.',
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
                    'Clients will not be permitted to trade in their demat account.',
                    style: TextStyle(
                        fontFamily: "Montserrat-Regular",
                        fontSize: 11.26.sp,
                        color: greyTextColor),
                  ),
                ),
              ],
            ),
            customHeight(70.h),
            PrimaryTextButton(
              title: "Book Your Appointment Now",
              onPressed: () {
                Get.to(() => alogo_booking());
              },
            ),
          ],
        ),
      ),
    );
  }
}