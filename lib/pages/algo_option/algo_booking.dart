import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/app_asset.dart';
import '../../components/buttons/text_button.dart';
import '../../components/colors.dart';
import '../../components/static_decoration.dart';
import '../../components/ui.dart';
import '../../utils/validators.dart';
import '../../widget/text_widgets/input_text_field_widget.dart';
import '../dashboard/dashboard_screen.dart';

class alogo_booking extends StatefulWidget {
  const alogo_booking({Key? key}) : super(key: key);

  @override
  State<alogo_booking> createState() => _alogo_bookingState();
}

class _alogo_bookingState extends State<alogo_booking> {


  final formKey = GlobalKey<FormState>();


  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: primaryWhite,
      appBar: UiInterface.CustomAppBar(titleShow: true, title: "Book Appointment",isBack: true),
      body: Form(
        key: formKey,
        child: Padding(
          padding:
          const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customHeight(32.h),
              textFormField(
                labelText: "Phone number",
                hintText: "Phone number",
                keyboardType: TextInputType.phone,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => Validators.validateMobile(value!),
                prefixIcon: Container(
                  padding:
                  const EdgeInsets.only(left: 24, top: 12, right: 10).r,
                  child: InkWell(
                    onTap: () {
                      showCountryPicker(
                          context: context,
                          countryListTheme: const CountryListThemeData(
                            bottomSheetHeight: 550,
                          ),
                          onSelect: (value) {
                            setState(() {
                              selectedCountry = value;
                            });
                          });
                    },
                    child: Text(
                      "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              customHeight(20.h),
              textFormField(
                labelText: "Email address",
                hintText: "Email address",
              ),
              customHeight(20.h),
              Spacer(),
              PrimaryTextButton(
                title: "Submit",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DashboardScreen(),
                    ),
                  );
                  // if (formKey.currentState!.validate()) {
                 // signInController.authLogin(context);
                  // signUpController.login(
                  //   "+${selectedCountry.phoneCode}${signUpController.phoneNumberController.text.trim()}"
                  // );
                  // signUpController
                  //     .phoneAuthentication(
                  //         "+${selectedCountry.phoneCode}${signUpController.phoneNumberController.text.trim()}")
                  //     .then(
                  //       (value) => Get.to(
                  //         () => VerifyOtpScreen(
                  //           mobileNo:
                  //               "+${selectedCountry.phoneCode}${signUpController.phoneNumberController.text.trim()}",
                  //         ),
                  //       ),
                  //     );
                  // }
                  // if (formKey.currentState!.validate()) {
                  // signUpController.loginWithEmailAndPassword(
                  //   signInController.emailController.text.trim(),
                  //   signInController.passwordController.text.trim(),
                  // );
                  // }
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
