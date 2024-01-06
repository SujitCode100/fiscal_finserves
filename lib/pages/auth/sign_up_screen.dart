import 'package:country_picker/country_picker.dart';
import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:joyn/controller/sign_up_controller.dart';
import 'package:joyn/utils/utils.dart';
import 'package:joyn/utils/validators.dart';

import '../../app.dart';
import '../../components/app_asset.dart';
import '../../components/buttons/text_button.dart';
import '../../components/colors.dart';
import '../../components/static_decoration.dart';
import '../../components/ui.dart';
import '../../widget/text_widgets/input_text_field_widget.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // controller define
  final signUpController = Get.put(SignUpController());
  // key
  final formKey = GlobalKey<FormState>();
  bool isChecked = false;
  //Contry
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        resizeToAvoidBottomInset: false,
        appBar: UiInterface.CustomAppBar(),
        body: Form(
          key: formKey,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      AppAsset.logos,
                      height: 42.h,
                    ),
                  ),
                  customHeight(33.h),
                  Text(
                    'Getting Started',
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontFamily: "Montserrat-Bold",
                        color: textBoldColor),
                  ),
                  customHeight(16.h),
                  Text(
                    'Create an account to continue!',
                    style: TextStyle(
                        fontFamily: "Montserrat-Regular",
                        fontSize: 14.sp,
                        color: textRegularColor),
                  ),
                  customHeight(32.h),
                  textFormField(
                    controller: signUpController.nameController,
                    labelText: "Full name",
                    hintText: "Full name",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        Validators.validateName(value, "Full name"),
                  ),
                  customHeight(20.h),
                  textFormField(
                    controller: signUpController.emailController,
                    labelText: "Email address",
                    hintText: "Email address",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => Validators.validateEmail(value),
                  ),
                  customHeight(20.h),
                  textFormField(
                    controller: signUpController.phoneNumberController,
                    labelText: "Phone number",
                    hintText: "Phone number",
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
                    controller: signUpController.whatsappNumberController,
                    labelText: "WhatsApp number",
                    hintText: "WhatsApp number",
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
                      controller: signUpController.dateOfBirthController,
                      labelText: "Date Of Birth",
                      hintText: "Date Of Birth",
                      validator: (value) =>
                          Validators.validateRequired(value!, "DOB"),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('dd-MM-yyyy').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            signUpController.dateOfBirthController.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {}
                      }),
                  customHeight(20.h),
                  FormField<String>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    builder: (FormFieldState<String> state) {
                      return DropdownButtonFormField(
                        validator: (value) =>
                            value == null ? 'Gender is Required' : null,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(24, 18, 24, 18).r,
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24.r),
                            borderSide: BorderSide(width: 1.5, color: red),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24.r),
                            borderSide:
                                BorderSide(width: 1.5, color: buttonsColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24.r),
                            borderSide:
                                BorderSide(width: 1.5, color: bordersColor),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24.r),
                            borderSide:
                                BorderSide(width: 1.5, color: buttonsColor),
                          ),
                          errorMaxLines: 1,
                          fillColor: primaryWhite,
                          filled: true,
                          labelText: "Gender",
                          hintText: "Gender",
                          hintStyle: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Montserrat-Regular',
                              color: textRegularColor),
                          enabled: true,
                          floatingLabelStyle: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Montserrat-Regular',
                              color: buttonsColor),
                          labelStyle: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Montserrat-Regular',
                              color: textRegularColor),
                          errorStyle: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: 'Montserrat-Regular',
                              color: red),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            signUpController.dropdownValue = newValue!;
                            // state.didChange(newValue);
                          });
                        },
                        items: ['Male', 'Female'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: value == 'Gender'
                                  ? TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: 'Montserrat-Regular',
                                      color: textRegularColor)
                                  : TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: 'Montserrat-Regular',
                                      color: textBoldColor),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                  customHeight(20.h),
                  CountryStateCityPicker(
                        country: signUpController.countryController,
                        state: signUpController.stateController,
                        city: signUpController.cityController,
                        dialogColor: Colors.grey.shade200,
                        textFieldDecoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(24, 20, 24, 20).r,
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24.r),
                            borderSide: BorderSide(width: 1.5, color: red),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24.r),
                            borderSide:
                                BorderSide(width: 1.5, color: buttonsColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24.r),
                            borderSide:
                                BorderSide(width: 1.5, color: bordersColor),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24.r),
                            borderSide:
                                BorderSide(width: 1.5, color: buttonsColor),
                          ),
                          errorMaxLines: 1,
                          fillColor: primaryWhite,
                          filled: true,
                          // labelText: (signUpController.countryController == true) ? "Country" : (signUpController.stateController == true) ? "State" : "City",
                          // hintText: (signUpController.countryController == true) ? "Country" : (signUpController.stateController == true) ? "State" : "City",
                          hintStyle: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Montserrat-Regular',
                              color: textRegularColor),
                          enabled: true,
                          floatingLabelStyle: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Montserrat-Regular',
                              color: buttonsColor),
                          labelStyle: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Montserrat-Regular',
                              color: textRegularColor),
                          errorStyle: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: 'Montserrat-Regular',
                              color: red),
                        ),
                      ),
                  customHeight(20.h),
                  textFormField(
                    controller: signUpController.passwordController,
                    labelText: "Password",
                    hintText: "Password",
                    obscureText: true,
                    maxLines: 1,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => Validators.validatepass(value!),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          AppAsset.hidePassword,
                          height: 24.h,
                          width: 24.w,
                        ),
                        customWidth(24),
                      ],
                    ),
                  ),
                  customHeight(32.h),
                  Row(
                    children: [
                      Image.asset(
                        AppAsset.fillCheckBox,
                        height: 18.h,
                        width: 18.w,
                      ),
                      customWidth(12.w),
                      Row(
                        children: [
                          Text(
                            'I agree to the ',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: "Montserrat-Regular",
                                color: textBoldColor),
                          ),
                          Text(
                            'Terms of Service ',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: "Montserrat-Regular",
                                color: buttonsColor),
                          ),
                          Text(
                            'and ',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: "Montserrat-Regular",
                                color: textBoldColor),
                          ),
                          Text(
                            'Privacy Policy',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: "Montserrat-Regular",
                                color: buttonsColor),
                          ),
                        ],
                      )
                    ],
                  ),
                  customHeight(60.h),
                  PrimaryTextButton(
                    title: "Start",
                    onPressed: () {
                      signUpController.authSignUp(context);
                      // if (formKey.currentState!.validate()) {
                        // signUpController.signUpUser(
                        //     signUpController.emailController.text.trim(),
                        //     signUpController.passwordController.text.trim());
                        // signUpController
                        //     .phoneAuthentication(
                        //         "+${selectedCountry.phoneCode}${signUpController.phoneNumberController.text.trim()}")
                        //     .then(
                        //       (value) => Get.to(
                        //         () => VerifyOtpScreen(
                        //           mobileNo:
                        //               "+${selectedCountry.phoneCode}${signUpController.phoneNumberController.text.trim()}",
                        //           fullName: signUpController.nameController.text
                        //               .trim(),
                        //           email: signUpController.emailController.text
                        //               .trim(),
                        //           whatsappNumber:
                        //               "+${selectedCountry.phoneCode}${signUpController.whatsappNumberController.text.trim()}",
                        //           dateOfBirth: signUpController
                        //               .dateOfBirthController.text
                        //               .trim(),
                        //           gender: dropdownValue,
                        //           country: signUpController
                        //               .countryController.text
                        //               .trim(),
                        //           state: signUpController.stateController.text
                        //               .trim(),
                        //           city: signUpController.cityController.text
                        //               .trim(),
                        //         ),
                        //       ),
                        //     );
                      }
                    // },
                    // onPressed: signUp,
                    // onPressed: () {
                    //   Get.to(()=>VerifyScreen(),);
                    // },
                  ),
                  customHeight(24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ? ',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: "Montserrat-Regular",
                            color: textBoldColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(
                            () => SignInScreen(),
                          );
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: "Montserrat-Bold",
                              color: buttonsColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Login
  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signUpController.emailController.text.trim(),
        password: signUpController.passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
