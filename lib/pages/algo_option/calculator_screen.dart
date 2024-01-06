import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joyn/components/static_decoration.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../components/buttons/text_button.dart';
import '../../components/colors.dart';
import '../../components/ui.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _returnRateController = TextEditingController();
  final TextEditingController _timePeriodController = TextEditingController();
  double _monthlyInvestment = 25000;
  double _expectedReturnRate = 12;
  double _timePeriod = 10;
  late double _investedAmount;
  late double totalInvestment;
  late double _result;
  late double i;

  @override
  void initState() {
    _controller.text = _monthlyInvestment.toString();
    _returnRateController.text = _expectedReturnRate.toString();
    _timePeriodController.text = _timePeriod.toString();
    _investedAmount = (_monthlyInvestment * 12) * _timePeriod;

    i = (_expectedReturnRate) / (12 * 100);

    _result = (_monthlyInvestment *
            (((pow((1 + i), (_timePeriod * 12))) - 1) / i) *
            (1 + i)) -
        _investedAmount;

    totalInvestment = _investedAmount + _result;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        appBar: UiInterface.CustomAppBar(
            titleShow: true, title: "Public Provident Found Calculator"),
        body: ListView(
          padding: const EdgeInsets.only(top: 30, bottom: 24).r,
          children: [
            // Redesign Calculator
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
              ).r,
              child: Text(
                'Calculate Your Public Provid Fund',
                style: TextStyle(
                    fontFamily: "Montserrat-Bold",
                    fontSize: 16.sp,
                    color: textBoldColor),
              ),
            ),
            customHeight(15.h),
            // Set Calculator

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ).r,
                  child: Text(
                    'Yearly Investment amount',
                    style: TextStyle(
                        fontFamily: "Montserrat-Medium",
                        fontSize: 12.sp,
                        color: textBoldColor),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 13, right: 24, top: 10).r,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Column(
                          children: [
                            SfSliderTheme(
                              data: SfSliderThemeData(
                                activeTrackHeight: 6.h,
                                inactiveTrackHeight: 6.h,
                                activeTrackColor: slidersColor,
                                inactiveTrackColor: slidersOffColor,
                                thumbColor: slidersIndicatorColor,
                                overlayRadius: 0,
                                trackCornerRadius: 11,
                                thumbRadius: 12,
                              ),
                              child: SfSlider(
                                  min: 500,
                                  max: 150000,
                                  value: _monthlyInvestment,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      _monthlyInvestment = value;
                                      _controller.text =
                                          _monthlyInvestment.toStringAsFixed(0);
                                      _investedAmount =
                                          (_monthlyInvestment * 12) *
                                              _timePeriod;
                                      i = (_expectedReturnRate) / (12 * 100);
                                      _result = (_monthlyInvestment *
                                              (((pow((1 + i),
                                                          (_timePeriod * 12))) -
                                                      1) /
                                                  i) *
                                              (1 + i)) -
                                          _investedAmount;
                                      totalInvestment =
                                          _investedAmount + _result;
                                    });
                                  }),
                            ),
                            customHeight(8.h),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '₹500',
                                    style: TextStyle(
                                        fontFamily: "Montserrat-Medium",
                                        fontSize: 12.sp,
                                        color: textBoldColor),
                                  ),
                                  Text(
                                    '₹1,50,000',
                                    style: TextStyle(
                                        fontFamily: "Montserrat-Medium",
                                        fontSize: 12.sp,
                                        color: textBoldColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // customWidth(18.w),
                      // TextFormField(
                      //   controller: _controller,
                      //   decoration: const InputDecoration(
                      //     fillColor: Color(0xffe5faf5),
                      //     filled: true,
                      //     contentPadding: EdgeInsets.only(left: 30),
                      //     border: OutlineInputBorder(
                      //         borderSide: BorderSide.none),
                      //   ),
                      //   style: const TextStyle(
                      //       fontSize: 17,
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.green),
                      // ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '₹ / 47902',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontFamily: "Montserrat-Bold",
                              fontSize: 14.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, top: 24).r,
                  child: Text(
                    'Number of year',
                    style: TextStyle(
                        fontFamily: "Montserrat-Medium",
                        fontSize: 12.sp,
                        color: textBoldColor),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 13, right: 24, top: 10).r,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Column(
                          children: [
                            SfSliderTheme(
                              data: SfSliderThemeData(
                                activeTrackHeight: 6.h,
                                inactiveTrackHeight: 6.h,
                                activeTrackColor: slidersColor,
                                inactiveTrackColor: slidersOffColor,
                                thumbColor: slidersIndicatorColor,
                                overlayRadius: 0,
                                trackCornerRadius: 11,
                                thumbRadius: 12,
                              ),
                              child: SfSlider(
                                  min: 1,
                                  max: 30,
                                  value: _timePeriod,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      _timePeriod = value;
                                      _timePeriodController.text =
                                          _timePeriod.toStringAsFixed(0);
                                      _investedAmount =
                                          (_monthlyInvestment * 12) *
                                              _timePeriod;
                                      i = (_expectedReturnRate) / (12 * 100);
                                      _result = (_monthlyInvestment *
                                              (((pow((1 + i),
                                                          (_timePeriod * 12))) -
                                                      1) /
                                                  i) *
                                              (1 + i)) -
                                          _investedAmount;
                                      totalInvestment =
                                          _investedAmount + _result;
                                    });
                                  }),
                            ),
                            customHeight(8.h),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '15 yrs',
                                    style: TextStyle(
                                        fontFamily: "Montserrat-Medium",
                                        fontSize: 12.sp,
                                        color: textBoldColor),
                                  ),
                                  Text(
                                    '50yrs',
                                    style: TextStyle(
                                        fontFamily: "Montserrat-Medium",
                                        fontSize: 12.sp,
                                        color: textBoldColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // customWidth(18.w),
                      // TextFormField(
                      //   controller: _controller,
                      //   decoration: const InputDecoration(
                      //     fillColor: Color(0xffe5faf5),
                      //     filled: true,
                      //     contentPadding: EdgeInsets.only(left: 30),
                      //     border: OutlineInputBorder(
                      //         borderSide: BorderSide.none),
                      //   ),
                      //   style: const TextStyle(
                      //       fontSize: 17,
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.green),
                      // ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'yrs / 42',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontFamily: "Montserrat-Bold",
                              fontSize: 14.sp,
                              color: textBoldColor),
                        ),
                      ),
                    ],
                  ),
                ),

                // Time Period

                // SizedBox(
                //   width: 350,
                //   child: Padding(
                //     padding: const EdgeInsets.all(20.0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: <Widget>[
                //         const Text(
                //           'Time period',
                //           style: TextStyle(
                //             fontSize: 15,
                //           ),
                //         ),
                //         SizedBox(
                //           width: 100,
                //           child: TextFormField(
                //             controller: _timePeriodController,
                //             decoration: const InputDecoration(
                //               fillColor: Color(0xffe5faf5),
                //               filled: true,
                //               contentPadding: EdgeInsets.only(left: 30),
                //               border: OutlineInputBorder(
                //                   borderSide: BorderSide.none),
                //             ),
                //             style: const TextStyle(
                //                 fontSize: 17,
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.green),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   width: 350,
                //   child: SfSliderTheme(
                //     data: SfSliderThemeData(
                //       activeTrackHeight: 5,
                //       inactiveTrackHeight: 5,
                //       activeTrackColor: const Color(0xff00d09c),
                //       inactiveTrackColor: Colors.black12,
                //       thumbColor: Colors.white,
                //       trackCornerRadius: 0,
                //       thumbRadius: 15,
                //     ),
                //     child: SfSlider(
                //         min: 1,
                //         max: 30,
                //         value: _timePeriod,
                //         onChanged: (dynamic value) {
                //           setState(() {
                //             _timePeriod = value;
                //             _timePeriodController.text =
                //                 _timePeriod.toStringAsFixed(0);
                //             _investedAmount =
                //                 (_monthlyInvestment * 12) * _timePeriod;
                //             i = (_expectedReturnRate) / (12 * 100);
                //             _result = (_monthlyInvestment *
                //                     (((pow((1 + i), (_timePeriod * 12))) - 1) /
                //                         i) *
                //                     (1 + i)) -
                //                 _investedAmount;
                //             totalInvestment = _investedAmount + _result;
                //           });
                //         }),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 30,
                    bottom: 25,
                  ).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Current Interest Rate',
                        style: TextStyle(
                            fontFamily: "Montserrat-Medium",
                            fontSize: 12.sp,
                            color: textBoldColor),
                      ),
                      Text(
                        '7.1%',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontFamily: "Montserrat-Bold",
                            fontSize: 14.sp,
                            color: textBoldColor),
                      ),
                    ],
                  ),
                ),

                // Expected return rate (p.a)

                // SizedBox(
                //   width: 350,
                //   child: Padding(
                //     padding: const EdgeInsets.all(20.0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: <Widget>[
                //         const Text(
                //           'Expected return rate (p.a)',
                //           style: TextStyle(
                //             fontSize: 15,
                //           ),
                //         ),
                //         SizedBox(
                //           width: 100,
                //           child: TextFormField(
                //             controller: _returnRateController,
                //             decoration: const InputDecoration(
                //               fillColor: Color(0xffe5faf5),
                //               filled: true,
                //               contentPadding: EdgeInsets.only(left: 30),
                //               border: OutlineInputBorder(
                //                   borderSide: BorderSide.none),
                //             ),
                //             style: const TextStyle(
                //                 fontSize: 17,
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.green),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   width: 350,
                //   child: SfSliderTheme(
                //     data: SfSliderThemeData(
                //       activeTrackHeight: 5,
                //       inactiveTrackHeight: 5,
                //       activeTrackColor: const Color(0xff00d09c),
                //       inactiveTrackColor: Colors.black12,
                //       thumbColor: Colors.white,
                //       trackCornerRadius: 0,
                //       thumbRadius: 15,
                //     ),
                //     child: SfSlider(
                //         min: 1,
                //         max: 30,
                //         value: _expectedReturnRate,
                //         onChanged: (dynamic value) {
                //           setState(() {
                //             _expectedReturnRate = value;
                //             _returnRateController.text =
                //                 _expectedReturnRate.toStringAsFixed(0);
                //             i = (_expectedReturnRate) / (12 * 100);
                //             _result = (_monthlyInvestment *
                //                     (((pow((1 + i), (_timePeriod * 12))) - 1) /
                //                         i) *
                //                     (1 + i)) -
                //                 _investedAmount;
                //             totalInvestment = _investedAmount + _result;
                //           });
                //         }),
                //   ),
                // ),

                // SizedBox(
                //   width: 350,
                //   child: Padding(
                //     padding: const EdgeInsets.all(20.0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: <Widget>[
                //         const Text('Invested Amount'),
                //         Text(
                //           _investedAmount.toStringAsFixed(0),
                //           style: const TextStyle(
                //             fontSize: 14,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   width: 350,
                //   child: Padding(
                //     padding: const EdgeInsets.all(20.0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: <Widget>[
                //         const Text('Est. returns'),
                //         Text(
                //           _result.toStringAsFixed(0),
                //           style: const TextStyle(
                //             fontSize: 14,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   width: 350,
                //   child: Padding(
                //     padding: const EdgeInsets.all(20.0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: <Widget>[
                //         const Text('Total value'),
                //         Text(
                //           totalInvestment.toStringAsFixed(0),
                //           style: const TextStyle(
                //             fontSize: 14,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),
            SizedBox(
              height: 220.h,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 30,
                    useRangeColorForAxis: true,
                    startAngle: 270,
                    endAngle: 270,
                    showLabels: false,
                    showTicks: false,
                    axisLineStyle: const AxisLineStyle(
                        thicknessUnit: GaugeSizeUnit.factor,
                        thickness: 0.25,
                        color: Color(0xFF98a4ff)),
                    ranges: <GaugeRange>[
                      GaugeRange(
                          startValue: 0,
                          endValue: 17,
                          color: buttonsColor,
                          sizeUnit: GaugeSizeUnit.factor,
                          startWidth: 0.25,
                          endWidth: 0.25),
                      GaugeRange(
                          startValue: _expectedReturnRate,
                          endValue: 30,
                          sizeUnit: GaugeSizeUnit.factor,
                          color: roundColor,
                          startWidth: 0.25,
                          endWidth: 0.25),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 24, right: 24).r,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 17.w,
                        height: 17.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: roundColor,
                        ),
                      ),
                      customWidth(8.w),
                      Text(
                        'Total Interest',
                        style: TextStyle(
                            fontFamily: "Montserrat-Medium",
                            fontSize: 12.sp,
                            color: textBoldColor),
                      ),
                    ],
                  ),
                  customHeight(9.h),
                  Row(
                    children: [
                      Container(
                        width: 17.w,
                        height: 17.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: buttonsColor,
                        ),
                      ),
                      customWidth(8.w),
                      Text(
                        'Total Investment',
                        style: TextStyle(
                            fontFamily: "Montserrat-Medium",
                            fontSize: 12.sp,
                            color: textBoldColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45, left: 24, right: 24).r,
              child: PrimaryTextButton(
                title: "Invest Now",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
  //   return SafeArea(
  //     child: Scaffold(
  //       backgroundColor: primaryWhite,
  //       appBar: UiInterface.CustomAppBar(titleShow: true, title: "Public Provident Found Calculator"),
  //     ),
  //   );
  // }
}
