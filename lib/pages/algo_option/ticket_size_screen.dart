import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joyn/components/static_decoration.dart';
import 'package:joyn/pages/algo_option/ticket_report_screen.dart';
import '../../components/colors.dart';
import '../../components/ui.dart';

class TicketSizeScreen extends StatefulWidget {
  const TicketSizeScreen({Key? key}) : super(key: key);

  @override
  State<TicketSizeScreen> createState() => _TicketSizeScreenState();
}

class _TicketSizeScreenState extends State<TicketSizeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        appBar: UiInterface.CustomAppBar(titleShow: true, title: "Ticket Size"),
        body: ListView(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24).r,
          children: [
            Text(
              'Different ticket sizes are offered with varying fees and the varied return on investment. A secure place to invest money that will yield the highest returns.',
              style: TextStyle(
                  height: 1.4,
                  fontFamily: "Montserrat-Regular",
                  fontSize: 12.sp,
                  color: greyTextColor),
            ),
            customHeight(24.h),
            SingleChildScrollView(
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
            // customHeight(70.h),
            // PrimaryTextButton(
            //   title: "Calculate PPF",
            //   onPressed: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
