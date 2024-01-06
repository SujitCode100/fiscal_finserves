import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joyn/components/app_asset.dart';
import 'package:joyn/components/static_decoration.dart';
import 'package:joyn/components/ui.dart';
import 'package:joyn/controller/sign_in_controller.dart';
import 'package:joyn/pages/auth/sign_up_screen.dart';
import 'package:joyn/widget/text_widgets/input_text_field_widget.dart';

import '../../components/buttons/text_button.dart';
import '../../components/colors.dart';
import '../../controller/sign_up_controller.dart';
import '../../utils/validators.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // controller define
  final signInController = Get.put(SignInController());
  final signUpController = Get.put(SignUpController());

  // key
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

  // @override
  // void dispose() {
  //   signInController.emailController.dispose();
  //   signInController.passwordController.dispose();
  //   super.dispose();
  // }
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AppAsset.logos,
                  height: 42.h,
                ),
                customHeight(33.h),
                Text(
                  'Let’s Sign You In',
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontFamily: "Montserrat-Bold",
                      color: textBoldColor),
                ),
                customHeight(16.h),
                Text(
                  'Welcome back, you’ve been missed!',
                  style: TextStyle(
                      fontFamily: "Montserrat-Regular",
                      fontSize: 14.sp,
                      color: textRegularColor),
                ),
                customHeight(32.h),
                textFormField(
                  controller: signInController.phoneController,
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
                // textFormField(
                //   labelText: "Email address",
                //   hintText: "Email address",
                //   controller: signInController.emailController,
                // ),
                // customHeight(20.h),
                // textFormField(
                //   labelText: "Password",
                //   hintText: "Password",
                //   obscureText: true,
                //   maxLines: 1,
                //   controller: signInController.passwordController,
                //   suffixIcon: Row(
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           Get.to(
                //             () => PasswordForgotEmailScreen(),
                //           );
                //         },
                //         child: Text(
                //           'Forgot?',
                //           style: TextStyle(
                //               fontSize: 14.sp,
                //               fontFamily: "Montserrat-Bold",
                //               color: buttonsColor),
                //         ),
                //       ),
                //       customWidth(12),
                //       Image.asset(
                //         AppAsset.hidePassword,
                //         height: 24.h,
                //         width: 24.w,
                //       ),
                //       customWidth(24),
                //     ],
                //   ),
                // ),
                Spacer(),
                PrimaryTextButton(
                  title: "Login",
                  onPressed: () {
                    // if (formKey.currentState!.validate()) {
                    signInController.authLogin(context);
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
                customHeight(24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont’s have an account? ',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: "Montserrat-Regular",
                          color: textBoldColor),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          () => SignUpScreen(),
                        );
                      },
                      child: Text(
                        'Sign up',
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
    );
  }
}
