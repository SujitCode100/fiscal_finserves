import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Languages/Languages.dart';
import '../../Languages/local_constant.dart';
import '../../components/colors.dart';
import '../../components/ui.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  int? group1Value;

  String languageCode = "";

  void getSelectedLanguage() {
    getLocale().then((locale) {
      setState(() {
        languageCode = locale.languageCode;
        if(languageCode=="en"){
          group1Value = 2;
        }
        else if(languageCode=="hi"){
          group1Value = 1;
        }
        else if(languageCode=="gu"){
          group1Value = 0;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getSelectedLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        appBar: UiInterface.CustomAppBar(titleShow: true, title: "Languages"),
        body: ListView(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 24).r,
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 24),
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20).r,
                color: courseCardColor,
                border: Border.all(
                  color: buttonsColor,
                  width: 1.5,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "English",
                      style: TextStyle(
                          fontFamily: "Montserrat-Bold",
                          fontSize: 15.sp,
                          color: textBoldColor),
                    ),
                  ),
                  Radio(
                    value: 2,
                    groupValue:group1Value,
                    activeColor: buttonsColor,
                    onChanged: (value) {
                      setState(() {
                        changeLanguage(context, 'en');
                        group1Value = value as int?;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 24),
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20).r,
                color: courseCardColor,
                border: Border.all(
                  color: buttonsColor,
                  width: 1.5,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Hindi",
                      style: TextStyle(
                          fontFamily: "Montserrat-Bold",
                          fontSize: 15.sp,
                          color: textBoldColor),
                    ),
                  ),
                  Radio(
                    value: 1,
                    groupValue:group1Value,
                    activeColor: buttonsColor,
                    onChanged: (value) {
                      setState(() {
                        changeLanguage(context, 'hi');
                        group1Value = value as int?;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 24),
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20).r,
                border: Border.all(
                  color: buttonsColor,
                  width: 1.5,
                ),
                color: courseCardColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Gujarati",
                      style: TextStyle(
                          fontFamily: "Montserrat-Bold",
                          fontSize: 15.sp,
                          color: textBoldColor),
                    ),
                  ),
                  Radio(
                    value: 0,
                    groupValue:group1Value,
                    activeColor: buttonsColor,
                    onChanged: (value) {
                      setState(() {
                        changeLanguage(context, 'gu');
                        group1Value = value as int?;
                      });
                    },
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
