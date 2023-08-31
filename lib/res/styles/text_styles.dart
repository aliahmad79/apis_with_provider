import 'package:api_with_provider/res/colors/colors.dart';
import 'package:api_with_provider/res/fonts/fonts.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static const headLine1 = TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor,
      fontFamily: AppFonts.poppinsBold);

  static const headLine2 = TextStyle(
      fontSize: 32, fontWeight: FontWeight.w500, color: AppColors.blackColor);

  static const headLine3 = TextStyle(
      fontSize: 28, fontWeight: FontWeight.w500, color: AppColors.blackColor);

  static const headLine4 = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.blackColor,
      fontFamily: AppFonts.poppinsMedium);

  static const headLine5 = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.blackColor,
      fontFamily: AppFonts.poppinsLight);

  static const headLine6 = TextStyle(
      fontSize: 16,
      // height: 2.4,
      fontWeight: FontWeight.w700,
      color: AppColors.blackColor,
      fontFamily: AppFonts.poppinsMedium);

  static const buttonText = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.poppinsMedium);

  static const bodyHeadLine = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      // color: AppColors.blackColor,
      fontFamily: AppFonts.poppinsMedium);
  static const bodyText1 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor,
      height: 1.5);

  static const bodyText2 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.poppinsMedium);

  static const caption = TextStyle(fontSize: 14, color: AppColors.blackColor);
}
