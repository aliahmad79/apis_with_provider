import 'package:api_with_provider/res/colors/colors.dart';
import 'package:api_with_provider/res/styles/text_styles.dart';
import 'package:flutter/material.dart';

class InputTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FormFieldSetter onFieldSubmitValue;
  final FormFieldValidator validator;
  final TextInputType keyBoardType;
  final String hintText;
  final String? labelText;
  final bool enable;
  final bool autoFocus;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  const InputTextFormField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.onFieldSubmitValue,
    required this.validator,
    required this.keyBoardType,
    required this.hintText,
    this.labelText,
    this.enable = true,
    this.autoFocus = false,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyBoardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: onFieldSubmitValue,
      cursorColor: AppColors.primaryTextColor,
      style: AppTextStyle.bodyText1.copyWith(fontSize: 18),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: prefixIcon,
        ),
        hintText: hintText,
        labelText: labelText,
        contentPadding: const EdgeInsets.all(5.0),
        hintStyle: AppTextStyle.bodyText1.copyWith(
            height: 0, color: AppColors.primaryTextColor.withOpacity(0.7)),
        enabled: enable,
        prefixIconConstraints: BoxConstraints(minWidth: 0.0),
        border: UnderlineInputBorder(
          borderSide: const BorderSide(color: AppColors.textFieldDefaultFocus),
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(5.0),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: AppColors.alertColor),
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: AppColors.blackColor),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
