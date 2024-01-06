import 'package:country_picker/country_picker.dart';
import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:joyn/components/static_decoration.dart';

import '../../Languages/Languages.dart';
import '../../components/app_asset.dart';
import '../../components/buttons/text_button.dart';
import '../../components/colors.dart';
import '../../components/ui.dart';
import '../../controller/profile_controller.dart';
import '../../utils/validators.dart';
import '../../widget/text_widgets/input_text_field_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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

  

  final profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    profileController.getProfiles(context);
    print("sssss${profileController.profileData}");
    profileController.nameEditController.text =
        profileController.profileData['fullName'];
    profileController.emailEditController.text =
        profileController.profileData['email'];
    profileController.whatsappNumberEditController.text =
        profileController.profileData['whatsappNumber'];
    profileController.dateOfBirthEditController.text =
        profileController.profileData['dateOfBirth'];
    profileController.countryEditController.text =
        profileController.profileData['country'];
    profileController.stateEditController.text =
        profileController.profileData['state'];
    profileController.cityEditController.text =
        profileController.profileData['city'];    
    profileController.dropdownValue = profileController.profileData['gender'];            
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        appBar:
            UiInterface.CustomAppBar(titleShow: true, title: Languages.of(context)!.edit_profile),
        body: ListView(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 24).r,
          children: [
            Container(
              height: 120.h,
              width: 120.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(AppAsset.profileAvatar),
                    fit: BoxFit.contain),
              ),
            ),
            customHeight(40.h),
            textFormField(
              // initialValue: '${profileController.profileData['fullName']}',
              controller: profileController.nameEditController,
              labelText: Languages.of(context)!.full_name,
              hintText:  Languages.of(context)!.full_name,
            ),
            customHeight(20.h),
            textFormField(
              // initialValue: '${profileController.profileData['email']}',
              controller: profileController.emailEditController,
              labelText:  Languages.of(context)!.email_address,
              hintText:  Languages.of(context)!.email_address,
            ),
            customHeight(20.h),
            textFormField(
              // initialValue: '${profileController.profileData['whatsappNumber']}',
              controller: profileController.whatsappNumberEditController,
              labelText:  Languages.of(context)!.whatsapp_no,
              hintText:  Languages.of(context)!.whatsapp_no,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => Validators.validateMobile(value!),
              prefixIcon: Container(
                padding: const EdgeInsets.only(left: 24, top: 12, right: 10).r,
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
                // initialValue: '${profileController.profileData['dateOfBirth']}',
                controller: profileController.dateOfBirthEditController,
                labelText:  Languages.of(context)!.date_of_birth,
                hintText:  Languages.of(context)!.date_of_birth,
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
                      profileController.dateOfBirthEditController.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {}
                }),
            customHeight(20.h),
            FormField<String>(
              builder: (FormFieldState<String> state) {
                return DropdownButtonFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(24, 18, 24, 18).r,
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.r),
                      borderSide: BorderSide(width: 1.5, color: red),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.r),
                      borderSide: BorderSide(width: 1.5, color: buttonsColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.r),
                      borderSide: BorderSide(width: 1.5, color: bordersColor),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.r),
                      borderSide: BorderSide(width: 1.5, color: buttonsColor),
                    ),
                    errorMaxLines: 1,
                    fillColor: primaryWhite,
                    filled: true,
                    labelText: Languages.of(context)!.Gender,
                    hintText: Languages.of(context)!.Gender,
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
                  value: profileController.dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      profileController.dropdownValue = newValue!;
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
              country: profileController.countryEditController,
              state: profileController.stateEditController,
              city: profileController.cityEditController,
               dialogColor: Colors.grey.shade200,
              textFieldDecoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 20).r,
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.r),
                  borderSide: BorderSide(width: 1.5, color: red),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.r),
                  borderSide: BorderSide(width: 1.5, color: buttonsColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.r),
                  borderSide: BorderSide(width: 1.5, color: bordersColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.r),
                  borderSide: BorderSide(width: 1.5, color: buttonsColor),
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
              labelText:Languages.of(context)!.Address,
              hintText: Languages.of(context)!.Address,
            ),
            customHeight(20.h),
            textFormField(
              labelText: Languages.of(context)!.biling_name,
              hintText: Languages.of(context)!.biling_name,
            ),
            customHeight(20.h),
            textFormField(
              labelText: Languages.of(context)!.gst_number,
              hintText: Languages.of(context)!.gst_number,
            ),
            customHeight(52.h),
            PrimaryTextButton(
              title: Languages.of(context)!.save,
              onPressed: () {
                profileController.updateProfiles(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
