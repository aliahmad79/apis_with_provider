import 'package:api_with_provider/res/colors/colors.dart';
import 'package:api_with_provider/res/styles/text_styles.dart';
import 'package:flutter/material.dart';

class AppRoundButton extends StatelessWidget {
  final String title;
  final Color buttonColor;
  final Color textColor;
  final bool isLoading;
  final double height;
  final double? width;
  final VoidCallback onPress;
  const AppRoundButton({
    super.key,
    required this.title,
    required this.onPress,
    this.buttonColor = AppColors.primaryColor,
    this.textColor = AppColors.whiteColor,
    this.isLoading = false,
    this.height = 45,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width ?? screenWidth,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ElevatedButton(
          onPressed: isLoading ? null : onPress,
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
          ),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: AppColors.whiteColor))
              : Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      title,
                      style: AppTextStyle.buttonText.copyWith(color: textColor),
                    ),
                  ),
                )),
    );
  }
}
