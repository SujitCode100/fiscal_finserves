import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joyn/components/static_decoration.dart';

import '../../components/colors.dart';
import '../../components/ui.dart';

class TicketReportScreen extends StatefulWidget {
  final String? price;
  const TicketReportScreen({Key? key, this.price}) : super(key: key);

  @override
  State<TicketReportScreen> createState() => _TicketReportScreenState();
}

class _TicketReportScreenState extends State<TicketReportScreen> {
  List<Map<String, dynamic>> ticket1List = [
    {
      'year': '2019',
      'jan': '14,695',
      'feb': '3,500',
      'mar': '3,469',
      'apr': '13,209',
      'may': '6,627',
      'jun': '13,810',
      'jul': '5,134',
      'aug': '9,909',
      'sep': '28,820',
      'oct': '10,321',
      'nov': '15,798',
      'dec': '6,775',
      'total': '1,32,071',
      'maxDrawdown': '-5,392',
      'daysForMdd': '13',
    },
    {
      'year': '2020',
      'jan': '21,304',
      'feb': '7,930',
      'mar': '10,523',
      'apr': '9,556',
      'may': '7,547',
      'jun': '13,476',
      'jul': '12,170',
      'aug': '25,855',
      'sep': '4,389',
      'oct': '18,909',
      'nov': '4,113',
      'dec': '19,324',
      'total': '1,55,100',
      'maxDrawdown': '-8,055',
      'daysForMdd': '13',
    },
    {
      'year': '2021',
      'jan': '22,105',
      'feb': '21,852',
      'mar': '43,182',
      'apr': '8,728',
      'may': '27,307',
      'jun': '24,639',
      'jul': '7,551',
      'aug': '14,949',
      'sep': '13,028',
      'oct': '5,050',
      'nov': '2,616',
      'dec': '-382',
      'total': '1,90,626',
      'maxDrawdown': '-9,114',
      'daysForMdd': '20',
    },
    {
      'year': '2023',
      'jan': '5,442',
      'feb': '16,040',
      'mar': '3,573',
      'apr': '6,389',
      'may': '56',
      'jun': '-4,645',
      'jul': '33,506',
      'aug': '15,718',
      'sep': '8,409',
      'oct': '8,574',
      'nov': '10,361',
      'dec': '15,992',
      'total': '1,19,419',
      'maxDrawdown': '-17,433',
      'daysForMdd': '26',
    },
    {
      'year': '2023',
      'jan': '24,640',
      'feb': '11,140',
      'mar': '5,671',
      'apr': '445',
      'may': '4,753',
      'jun': '8,266',
      'jul': '2,389',
      'aug': '0',
      'sep': '0',
      'oct': '0',
      'nov': '0',
      'dec': '0',
      'total': '60,306',
      'maxDrawdown': '-13,081',
      'daysForMdd': '64',
    },
  ];

  final _scrollController = ScrollController();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        appBar: UiInterface.CustomAppBar(
            titleShow: true, title: "Algo Performance(Report)"),
        body: ListView(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24).r,
          children: [
            Text(
              'Algo Performance of ${widget.price}:-',
              style: TextStyle(
                  fontFamily: "Montserrat-Bold",
                  fontSize: 16.sp,
                  color: textBoldColor),
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
                  columnSpacing: 30, sortAscending: true,
                  headingRowColor: MaterialStateColor.resolveWith(
                      (states) => Colors.grey.withOpacity(0.35)),
                  border: TableBorder.all(width: 2, color: primaryWhite),
                  showBottomBorder: true,
                  horizontalMargin: 20,
                  dataTextStyle: TextStyle(
                      fontFamily: "Montserrat-SemiBold",
                      fontSize: 10.sp,
                      color: buttonsColor),
                  dataRowColor:
                      MaterialStateColor.resolveWith((states) => grey.withOpacity(0.08)),
                  headingTextStyle: TextStyle(
                      fontFamily: "Montserrat-Bold",
                      fontSize: 12.sp,
                      color: primaryBlack),
                  // dataRowColor: courseCardColor,
                  columns: [
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Year',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Jan',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Feb',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Mar',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Apr',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'May',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Jun',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Jul',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Aug',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Sep',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Oct',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Nov',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Dec',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Total',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Max Drawdown',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Days for MDD',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                  rows: ticket1List
                      .map(
                        (e) => DataRow(
                          cells: [
                            DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    e['year'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Montserrat-Bold",
                                        fontSize: 12.sp,
                                        color: primaryBlack),
                                  )),
                            ),
                            DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    e['jan'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Montserrat-SemiBold",
                                        fontSize: 12.sp,
                                        color: Color.fromARGB(255, 0, 222, 0)),
                                  )),
                            ),
                            DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    e['feb'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Montserrat-SemiBold",
                                        fontSize: 12.sp,
                                        color: Color.fromARGB(255, 0, 222, 0)),
                                  )),
                            ),
                            DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    e['mar'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Montserrat-SemiBold",
                                        fontSize: 12.sp,
                                        color: Color.fromARGB(255, 0, 222, 0)),
                                  )),
                            ),
                            DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    e['apr'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Montserrat-SemiBold",
                                        fontSize: 12.sp,
                                        color: Color.fromARGB(255, 0, 222, 0)),
                                  )),
                            ),
                            DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    e['may'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Montserrat-SemiBold",
                                        fontSize: 12.sp,
                                        color: Color.fromARGB(255, 0, 222, 0)),
                                  )),
                            ),
                            DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    e['jun'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Montserrat-SemiBold",
                                        fontSize: 12.sp,
                                        color: Color.fromARGB(255, 0, 222, 0)),
                                  )),
                            ),
                            DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    e['jul'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Montserrat-SemiBold",
                                        fontSize: 12.sp,
                                        color: Color.fromARGB(255, 0, 222, 0)),
                                  )),
                            ),
                            DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    e['aug'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Montserrat-SemiBold",
                                        fontSize: 12.sp,
                                        color: Color.fromARGB(255, 0, 222, 0)),
                                  )),
                            ),
                            DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    e['sep'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Montserrat-SemiBold",
                                        fontSize: 12.sp,
                                        color: Color.fromARGB(255, 0, 222, 0)),
                                  )),
                            ),
                            DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    e['oct'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Montserrat-SemiBold",
                                        fontSize: 12.sp,
                                        color: Color.fromARGB(255, 0, 222, 0)),
                                  )),
                            ),
                            DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    e['nov'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Montserrat-SemiBold",
                                        fontSize: 12.sp,
                                        color: Color.fromARGB(255, 0, 222, 0)),
                                  )),
                            ),
                            DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    e['dec'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Montserrat-SemiBold",
                                        fontSize: 12.sp,
                                        color: Color.fromARGB(255, 0, 222, 0)),
                                  )),
                            ),
                            DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    e['total'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Montserrat-SemiBold",
                                        fontSize: 12.sp,
                                        color: Color.fromARGB(255, 0, 222, 0)),
                                  )),
                            ),
                            DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    e['maxDrawdown'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Montserrat-SemiBold",
                                        fontSize: 12.sp,
                                        color: red),
                                  )),
                            ),
                            DataCell(
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    e['daysForMdd'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Montserrat-SemiBold",
                                        fontSize: 12.sp,
                                        color: Color.fromARGB(255, 0, 222, 0)),
                                  )),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
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
