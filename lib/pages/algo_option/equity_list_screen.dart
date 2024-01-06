import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/colors.dart';
import '../../components/ui.dart';

class EquityListScreen extends StatefulWidget {
  const EquityListScreen({Key? key}) : super(key: key);

  @override
  State<EquityListScreen> createState() => _EquityListScreenState();
}

class _EquityListScreenState extends State<EquityListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        appBar: UiInterface.CustomAppBar(
          titleShow: true,
          title: "Equity Long Term List",
        ),
        body: ListView(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 24).r,
          children: [
            DataTable(
              dataRowHeight: 35.h,
              horizontalMargin: 10,
              columns: <DataColumn>[
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Stock Name',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Montserrat-Medium",
                          fontSize: 16.sp,
                          color: textRegularColor),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      '',
                      style: TextStyle(
                          fontFamily: "Montserrat-Medium",
                          fontSize: 16.sp,
                          color: textRegularColor),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      '1 year',
                      style: TextStyle(
                          fontFamily: "Montserrat-Medium",
                          fontSize: 16.sp,
                          color: textRegularColor),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      '5 year',
                      style: TextStyle(
                          fontFamily: "Montserrat-Medium",
                          fontSize: 16.sp,
                          color: textRegularColor),
                    ),
                  ),
                ),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Nifty',
                          style: TextStyle(
                              fontFamily: "Montserrat-Medium",
                              fontSize: 16.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ),
                    DataCell(Text('')),
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '78%',
                          style: TextStyle(
                              fontFamily: "Montserrat-Medium",
                              fontSize: 16.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ),
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '-',
                          style: TextStyle(
                              fontFamily: "Montserrat-Medium",
                              fontSize: 16.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Bank Nifty',
                          style: TextStyle(
                              fontFamily: "Montserrat-Medium",
                              fontSize: 16.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ),
                    DataCell(Text('')),
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '-',
                          style: TextStyle(
                              fontFamily: "Montserrat-Medium",
                              fontSize: 16.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ),
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '25%',
                          style: TextStyle(
                              fontFamily: "Montserrat-Medium",
                              fontSize: 16.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'SBI',
                          style: TextStyle(
                              fontFamily: "Montserrat-Medium",
                              fontSize: 16.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ),
                    DataCell(Text('')),
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '-',
                          style: TextStyle(
                              fontFamily: "Montserrat-Medium",
                              fontSize: 16.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ),
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '7%',
                          style: TextStyle(
                              fontFamily: "Montserrat-Medium",
                              fontSize: 16.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Yes Bank',
                          style: TextStyle(
                              fontFamily: "Montserrat-Medium",
                              fontSize: 16.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ),
                    DataCell(Text('')),
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '80%',
                          style: TextStyle(
                              fontFamily: "Montserrat-Medium",
                              fontSize: 16.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ),
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '-',
                          style: TextStyle(
                              fontFamily: "Montserrat-Medium",
                              fontSize: 16.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Bharti Airtel',
                          style: TextStyle(
                              fontFamily: "Montserrat-Medium",
                              fontSize: 16.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ),
                    DataCell(Text('')),
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '55%',
                          style: TextStyle(
                              fontFamily: "Montserrat-Medium",
                              fontSize: 16.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ),
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '-',
                          style: TextStyle(
                              fontFamily: "Montserrat-Medium",
                              fontSize: 16.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Maruti',
                          style: TextStyle(
                              fontFamily: "Montserrat-Medium",
                              fontSize: 16.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ),
                    DataCell(Text('')),
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '89%',
                          style: TextStyle(
                              fontFamily: "Montserrat-Medium",
                              fontSize: 16.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ),
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '-',
                          style: TextStyle(
                              fontFamily: "Montserrat-Medium",
                              fontSize: 16.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Asian Paint',
                          style: TextStyle(
                              fontFamily: "Montserrat-Medium",
                              fontSize: 16.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ),
                    DataCell(Text('')),
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '-',
                          style: TextStyle(
                              fontFamily: "Montserrat-Medium",
                              fontSize: 16.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ),
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '18%',
                          style: TextStyle(
                              fontFamily: "Montserrat-Medium",
                              fontSize: 16.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Adani',
                          style: TextStyle(
                              fontFamily: "Montserrat-Medium",
                              fontSize: 16.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ),
                    DataCell(Text('')),
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '73%',
                          style: TextStyle(
                              fontFamily: "Montserrat-Medium",
                              fontSize: 16.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ),
                    DataCell(
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '-',
                          style: TextStyle(
                              fontFamily: "Montserrat-Medium",
                              fontSize: 16.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}