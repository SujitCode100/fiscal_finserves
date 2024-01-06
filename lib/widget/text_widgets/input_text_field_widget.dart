import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:joyn/components/app_text_style.dart';
import 'package:joyn/components/colors.dart';
import 'package:joyn/utils/validators.dart';

class EmailWidget extends StatelessWidget {
  const EmailWidget({
    Key? key,
    this.fieldKey,
    this.hintText,
    this.style,
    this.prefixIcon,
    required this.controller,
    this.borderColor,
    this.textInputAction,
    this.keyboardType,
    this.textStyle,
    this.filledColor,
    this.enabled,
    this.focusNode,
    this.validator,
  }) : super(key: key);
  final Key? fieldKey;
  final String? hintText;
  final TextStyle? style;
  final TextStyle? textStyle;

  final Widget? prefixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool? enabled;
  final TextInputType? keyboardType;
  final Color? filledColor;
  final FormFieldValidator<String?>? validator;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return textFormField(
        fieldKey: fieldKey,
        hintText: hintText,

        // hintStyle: style ??
        //     AppTextStyle.normalSemiBold14.copyWith(color: primaryButtonColor),
        // prefixIcon: UiInterface.prefixTextFieldIcon(AppAsset.icEnvelop),
        enabled: enabled,
        focusNode: focusNode,
        controller: controller,
        // textStyle: textStyle ??
        //     AppTextStyle.normalSemiBold14.copyWith(color: primaryButtonColor),
        textInputAction: textInputAction,
        keyboardType: TextInputType.emailAddress,
        borderColor: borderColor,
        filledColor: filledColor,
        validator: validator ??
            (value) => Validators.validateEmail(
                  value!.trim(),
                ));
  }
}

class PasswordWidget extends StatefulWidget {
  final Key? fieldKey;
  final int? maxLength;
  final String? hintText;

  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  const PasswordWidget({
    Key? key,
    required this.controller,
    this.fieldKey,
    this.maxLength,
    this.hintText,
    this.validator,
    this.focusNode,
    this.textInputAction,
  }) : super(key: key);

  @override
  _PasswordWidgetState createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return textFormField(
        fieldKey: widget.fieldKey,
        hintText: widget.hintText,
        obscureText: _obscureText,
        focusNode: widget.focusNode,
        controller: widget.controller,
        textInputAction: widget.textInputAction,
        maxLength: widget.maxLength,
        maxLines: 1,
        // prefixIcon: UiInterface.prefixTextFieldIcon(AppAsset.icLock),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: primaryWhite,
          ),
        ),
        validator: widget.validator ??
            (value) => Validators.validateRequired(value!.trim(), 'Password')
        // (value) => Validators.validatePassword(value!.trim()),
        );
  }
}

class NumberWidget extends StatelessWidget {
  const NumberWidget({
    Key? key,
    this.fieldKey,
    this.hintText,
    this.validator,
    this.prefixIcon,
    required this.controller,
    this.maxLength,
    this.focusNode,
    this.autofocus,
    this.style,
    this.textInputAction,
    this.textAlign = TextAlign.left,
    this.inputFormatters,
    this.textStyle,
    this.keyboardType,
    this.borderColor,
    this.fillColor,
    this.enabled,
  }) : super(key: key);

  final Key? fieldKey;
  final String? hintText;
  final List<TextInputFormatter?>? inputFormatters;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  final int? maxLength;
  final bool? enabled;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? style;
  final TextStyle? textStyle;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final Widget? prefixIcon;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return textFormField(
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      fieldKey: fieldKey,
      hintText: hintText,
      focusNode: focusNode,
      enabled: enabled,
      borderRaduis: 10,
      hintStyle:
          style ?? AppTextStyle.normalRegular12.copyWith(color: greyColor),
      textStyle: textStyle ?? AppTextStyle.normalRegular12,
      controller: controller,
      style: style,
      prefixIcon: prefixIcon,
      filledColor: fillColor,
      validator: validator,
      textAlign: textAlign,
      maxLength: maxLength,
      borderColor: borderColor,
      textInputAction: textInputAction,
      // inputFormatters: [FilteringTextInputFormatter.deny(RegExp('[a-zA-Z]'))],
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    this.fieldKey,
    this.hintText,
    this.textStyle,
    this.hintStyle,
    this.validator,
    this.prefixIcon,
    required this.controller,
    this.focusNode,
    this.maxLines,
    this.maxLength,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction,
    this.keyboardType,
    this.borderColor,
    this.filledColor,
    this.enabled,
    this.readonly,
    this.scropadding,
    this.textAlign = TextAlign.left,
    this.contentPadding,
  }) : super(key: key);
  final EdgeInsets? scropadding;
  final Key? fieldKey;
  final bool? readonly;
  final String? hintText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color? borderColor;
  final Color? filledColor;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<String?>? onFieldSubmitted;
  final ValueChanged<String?>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final GestureTapCallback? onTap;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final bool? enabled;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return textFormField(
      fieldKey: fieldKey,
      focusNode: focusNode,
      hintText: hintText,
      scropadding: scropadding,
      controller: controller,
      borderRaduis: 10,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      maxLength: maxLength,
      maxLines: maxLines,
      enabled: enabled ?? true,
      textInputAction: textInputAction,
      textAlign: textAlign,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      contentPadding:
          contentPadding ?? const EdgeInsets.fromLTRB(20, 15, 10, 15),
      textStyle: textStyle,
      hintStyle:
          hintStyle ?? AppTextStyle.normalRegular12.copyWith(color: greyColor),
      borderColor: borderColor,
      filledColor: filledColor,
    );
  }
}

class OutlineTextFormFieldWidget extends StatelessWidget {
  const OutlineTextFormFieldWidget({
    Key? key,
    this.fieldKey,
    this.hintText,
    this.enabled,
    this.textStyle,
    this.hintStyle,
    this.validator,
    this.prefixIcon,
    required this.controller,
    this.focusNode,
    this.maxLines,
    this.maxLength,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction,
    this.keyboardType,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  final Key? fieldKey;
  final String? hintText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<String?>? onFieldSubmitted;
  final ValueChanged<String?>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final GestureTapCallback? onTap;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return textFormField(
      fieldKey: fieldKey,
      focusNode: focusNode,
      enabled: enabled,
      hintText: hintText,
      controller: controller,
      keyboardType: TextInputType.text,
      validator: validator,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      maxLength: maxLength,
      maxLines: maxLines,
      textInputAction: textInputAction,
      textAlign: textAlign,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      textStyle: textStyle,
      hintStyle: hintStyle,
    );
  }
}

class TextAreaWidget extends StatelessWidget {
  const TextAreaWidget({
    Key? key,
    this.fieldKey,
    this.hintText,
    this.validator,
    required this.controller,
    this.focusNode,
    this.maxLines,
    this.maxLength,
    this.filledColor,
    this.hintStyle,
    this.enabled,
  }) : super(key: key);

  final Key? fieldKey;
  final bool? enabled;
  final int? maxLines;
  final int? maxLength;
  final String? hintText;
  final TextStyle? hintStyle;
  final Color? filledColor;
  final FormFieldValidator<String?>? validator;

  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return textFormField(
        keyboardType: TextInputType.text,
        focusNode: focusNode,
        enabled: enabled,
        fieldKey: fieldKey,
        controller: controller,
        validator: validator,
        maxLines: maxLines,
        hintText: hintText,
        hintStyle: AppTextStyle.normalSemiBold14,
        textStyle: AppTextStyle.normalSemiBold14,
        filledColor: barrierBlackColor,
        borderColor: Colors.transparent);
  }
}

// ignore: must_be_immutable
class SearchBar extends StatelessWidget {
  final String? hintText;
  final Function(String?)? onFieldSubmit;
  final Function(String?)? onFieldChange;
  final Function()? onSubmit;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  TextEditingController? controller;

  SearchBar({
    Key? key,
    this.hintText,
    this.onFieldSubmit,
    this.onSubmit,
    this.onFieldChange,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: controller,
      onFieldSubmitted: onFieldSubmit,
      hintText: hintText ?? "Find restaurant or coffeeshop",
      hintStyle: AppTextStyle.normalRegular14,

      prefixIcon: prefixIcon ??
          IconButton(
            icon: const Icon(
              CupertinoIcons.search,
              color: primaryWhite,
            ),
            splashRadius: 5,
            onPressed: onSubmit,
          ),
      onChanged: onFieldChange,
      borderColor: Colors.transparent,
      filledColor: lightBlackColor,

      // suffixIcon: IconButton(
      //   icon: Icon(
      //     suffixIcon ?? Icons.arrow_forward,
      //     color: hintGrey,
      //   ),
      //   onPressed: onSubmit,
      // ),
    );
  }
}

// aa
TextFormField textFormField({
  final Key? fieldKey,
  final String? hintText,
  final String? labelText,
  final String? helperText,
  final String? initialValue,
  final int? errorMaxLines,
  final int? maxLines,
  final int? maxLength,
  final double? borderRaduis = 0,
  final bool? enabled,
  final bool autofocus = false,
  final bool obscureText = false,
  final Color? filledColor,
  final Color? cursorColor,
  final Color? borderColor,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
  final FocusNode? focusNode,
  final TextStyle? style,
  final TextStyle? textStyle,
  final TextStyle? hintStyle,
  final TextAlign textAlign = TextAlign.left,
  final TextEditingController? controller,
  final List<TextInputFormatter>? inputFormatters,
  final TextInputAction? textInputAction,
  final TextInputType? keyboardType,
  final TextCapitalization textCapitalization = TextCapitalization.none,
  final GestureTapCallback? onTap,
  final FormFieldSetter<String?>? onSaved,
  final FormFieldValidator<String?>? validator,
  final ValueChanged<String?>? onChanged,
  final ValueChanged<String?>? onFieldSubmitted,
  final BorderSide? border,
  final EdgeInsetsGeometry? contentPadding,
  final bool? readonly,
  final EdgeInsets? scropadding,
  final AutovalidateMode? autovalidateMode,
}) {
  return TextFormField(
    scrollPadding: scropadding ?? EdgeInsets.zero,
    key: fieldKey,
    readOnly: readonly ?? false,
    controller: controller,
    focusNode: focusNode,
    maxLines: maxLines,
    initialValue: initialValue,
    keyboardType: keyboardType,
    textCapitalization: textCapitalization,
    obscureText: obscureText,
    enabled: enabled,
    validator: validator,
    maxLength: maxLength,
    textInputAction: textInputAction,
    inputFormatters: inputFormatters,
    onTap: onTap,
    onSaved: onSaved,
    onChanged: onChanged,
    onFieldSubmitted: onFieldSubmitted,
    autocorrect: true,
    autofocus: autofocus,
    textAlign: textAlign,
    cursorColor: buttonsColor,
    cursorHeight: 16.h,
    autovalidateMode: autovalidateMode,
    style: textStyle ?? TextStyle(fontSize: 16.sp,fontFamily: 'Montserrat-Regular',color: textBoldColor),
    decoration: InputDecoration(
      prefixIcon: prefixIcon,
      contentPadding:
          contentPadding ?? const EdgeInsets.fromLTRB(24, 20, 24, 20).r,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.r),
        borderSide: border ?? BorderSide(width: 1.5,color: red),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.r),
        borderSide: border ?? BorderSide(width: 1.5,color: buttonsColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.r),
        borderSide: border ?? BorderSide(width: 1.5,color: bordersColor),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.r),
        borderSide: border ?? BorderSide(width: 1.5,color: buttonsColor),
      ),
      errorMaxLines: 1,
      fillColor: filledColor ?? primaryWhite,
      filled: true,
      hintStyle:
          hintStyle ?? TextStyle(fontSize: 16.sp,fontFamily: 'Montserrat-Regular',color: textRegularColor),
      hintText: hintText,
      enabled: enabled ?? true,
      suffixIcon: suffixIcon,
      labelText: labelText,
      floatingLabelStyle: TextStyle(fontSize: 14.sp,fontFamily: 'Montserrat-Regular',color: buttonsColor),
      labelStyle: TextStyle(fontSize: 16.sp,fontFamily: 'Montserrat-Regular',color: textRegularColor),
      errorStyle: TextStyle(fontSize: 10.sp,fontFamily: 'Montserrat-Regular',color: red),
      helperText: helperText,
    ),
  );
}

TextFormField outlineTextField({
  final Key? fieldKey,
  final String? hintText,
  final String? labelText,
  final String? helperText,
  final String? initialValue,
  final int? errorMaxLines,
  final int? maxLines,
  final int? maxLength,
  final bool? enabled,
  final bool autofocus = false,
  final bool obscureText = false,
  final Color? filledColor,
  final Color? cursorColor,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
  final FocusNode? focusNode,
  final TextStyle? style,
  final TextStyle? textStyle,
  final TextStyle? hintStyle,
  final TextAlign textAlign = TextAlign.left,
  final TextEditingController? controller,
  final List<TextInputFormatter>? inputFormatters,
  final TextInputAction? textInputAction,
  final TextInputType? keyboardType,
  final TextCapitalization textCapitalization = TextCapitalization.none,
  final GestureTapCallback? onTap,
  final FormFieldSetter<String?>? onSaved,
  final FormFieldValidator<String?>? validator,
  final ValueChanged<String?>? onChanged,
  final ValueChanged<String?>? onFieldSubmitted,
}) {
  return TextFormField(
    key: fieldKey,
    controller: controller,
    focusNode: focusNode,
    maxLines: maxLines,
    initialValue: initialValue,
    keyboardType: keyboardType,
    textCapitalization: textCapitalization,
    obscureText: obscureText,
    enabled: enabled,
    validator: validator,
    maxLength: maxLength,
    textInputAction: textInputAction,
    inputFormatters: inputFormatters,
    onTap: onTap,
    onSaved: onSaved,
    onChanged: onChanged,
    onFieldSubmitted: onFieldSubmitted,
    autocorrect: true,
    autofocus: autofocus,
    textAlign: textAlign,
    cursorColor: regularGrey,
    cursorHeight: 20,
    style: textStyle ?? AppTextStyle.normalRegular12,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.all(10),
      border: outlineBorderDecoration,
      enabledBorder: outlineBorderDecoration,
      focusedBorder: outlineBorderDecoration,
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: red),
        borderRadius: BorderRadius.zero,
      ),
      hintText: hintText,
      hintStyle: hintStyle ?? AppTextStyle.normalRegular12,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      labelText: labelText,
      helperText: helperText,
    ),
  );
}

OutlineInputBorder outlineBorderDecoration = const OutlineInputBorder(
  borderSide: BorderSide(color: darkGreyWhite, width: 1.2),
  borderRadius: BorderRadius.zero,
);



// class TextFormFieldWidget extends StatelessWidget {
//   const TextFormFieldWidget({
//     Key? key,
//     this.fieldKey,
//     this.hintText,
//     this.validator,
//     this.prefixIcon,
//     this.controller,
//     this.focusNode,
//     this.maxLines,
//     this.maxLength,
//     this.suffixIcon,
//     this.onTap,
//     this.onChanged,
//     this.onFieldSubmitted,
//     this.textInputAction,
//     this.keyboardType,
//     this.filledColor,
//     this.hintStyle,
//     this.style,
//     this.focusBorder,
//     this.border,
//     this.enabledBorder,
//     this.cursorColor,
//     this.textAlign = TextAlign.left,
//   }) : super(key: key);

//   final Key? fieldKey;
//   final String? hintText;
//   final FormFieldValidator<String?>? validator;
//   final ValueChanged<String?>? onFieldSubmitted;
//   final ValueChanged<String?>? onChanged;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final TextEditingController? controller;
//   final FocusNode? focusNode;
//   final GestureTapCallback? onTap;
//   final int? maxLines;
//   final int? maxLength;
//   final TextInputAction? textInputAction;
//   final TextInputType? keyboardType;
//   final TextAlign textAlign;
//   final Color? filledColor;
//   final Color? cursorColor;
//   final TextStyle? style;
//   final TextStyle? hintStyle;
//   final BorderSide? focusBorder;
//   final BorderSide? border;
//   final BorderSide? enabledBorder;

//   @override
//   Widget build(BuildContext context) {
//     return textFormField(
//       fieldKey: fieldKey,
//       focusNode: focusNode,
//       hintText: hintText,
//       filledColor: filledColor,
//       style: style,
//       hintStyle: hintStyle,
//       controller: controller,
//       cursorColor: cursorColor,
//       keyboardType: keyboardType,
//       validator: validator,
//       prefixIcon: prefixIcon,
//       suffixIcon: suffixIcon,
//       maxLength: maxLength,
//       maxLines: maxLines,
//       textInputAction: textInputAction,
//       textAlign: textAlign,
//       onTap: onTap,
//       onFieldSubmitted: onFieldSubmitted,
//       onChanged: onChanged,
//       focusBorder: focusBorder,
//       border: border,
//       enabledBorder: enabledBorder,
//     );
//   }
// }

// TextFormField textFormField({
//   final Key? fieldKey,
//   final String? hintText,
//   final String? labelText,
//   final String? helperText,
//   final String? initialValue,
//   final int? errorMaxLines,
//   final int? maxLines,
//   final int? maxLength,
//   final bool? enabled,
//   final bool autofocus = false,
//   final bool? obscureText,
//   final Color? filledColor,
//   final Color? cursorColor,
//   final prefixIcon,
//   final Widget? suffixIcon,
//   final FocusNode? focusNode,
//   final TextStyle? style,
//   final TextStyle? hintStyle,
//   final TextAlign textAlign = TextAlign.left,
//   final TextEditingController? controller,
//   final List<TextInputFormatter>? inputFormatters,
//   final TextInputAction? textInputAction,
//   final TextInputType? keyboardType,
//   final TextCapitalization textCapitalization = TextCapitalization.none,
//   final GestureTapCallback? onTap,
//   final FormFieldSetter<String?>? onSaved,
//   final FormFieldValidator<String?>? validator,
//   final ValueChanged<String?>? onChanged,
//   final ValueChanged<String?>? onFieldSubmitted,
//   final BorderSide? focusBorder,
//   final BorderSide? enabledBorder,
//   final BorderSide? border,
// }) {
//   return TextFormField(
//     key: fieldKey,
//     controller: controller,
//     focusNode: focusNode,
//     maxLines: maxLines ?? 1,
//     initialValue: initialValue,
//     keyboardType: keyboardType,
//     textCapitalization: textCapitalization,
//     obscureText: obscureText ?? false,
//     enabled: enabled,
//     validator: validator,
//     maxLength: maxLength,
//     textInputAction: textInputAction,
//     inputFormatters: inputFormatters,
//     onTap: onTap,
//     onSaved: onSaved,
//     onChanged: onChanged,
//     onFieldSubmitted: onFieldSubmitted,
//     autocorrect: true,
//     autofocus: autofocus,
//     textAlign: textAlign,
//     cursorColor: cursorColor ?? primaryBlack,
//     cursorHeight: 20,
//     cursorWidth: 1,
//     style: style ??
        // const TextStyle(
        //   color: primaryBlack,
        //   fontSize: 14,
        //   fontWeight: FontWeight.w400,
        // ),
//     decoration: InputDecoration(
//       prefixIcon: prefixIcon,
//       contentPadding: const EdgeInsets.fromLTRB(18, 17, 0, 17),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.zero,
//         borderSide: border ?? BorderSide.none,
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.zero,
//         borderSide: enabledBorder ?? BorderSide.none,
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.zero,
//         borderSide: focusBorder ?? BorderSide.none,
//       ),
//       errorBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.zero,
//         borderSide: BorderSide(
//           color: red,
//         ),
//       ),
//       errorMaxLines: 5,
//       fillColor: filledColor ?? primaryWhite,
//       filled: true,
//       hintStyle: hintStyle ??
//           const TextStyle(
//             color: textFieldTitleColor,
//             fontSize: 14,
//             fontWeight: FontWeight.w400,
//           ),
//       hintText: hintText,
//       counterText: "",
//       suffixIcon: suffixIcon,
//       labelText: labelText,
//       helperText: helperText,
//     ),
//   );
// }
