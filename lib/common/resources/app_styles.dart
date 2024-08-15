import 'package:flutter/material.dart';

import '../dimensions/font_size.dart';
import '../dimensions/paddings.dart';
import '../dimensions/radius.dart';
import 'app_color.dart';

class AppStyles {
  TextStyle get mediumGreyTextStyle =>
      TextStyle(
        fontSize: headerTitle,
        decoration: TextDecoration.none,
        color: AppColors.grey,
      );

  TextStyle get mediumWhiteTextStyle =>
      TextStyle(
        fontSize: subHeaderTitle,
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w400,
      );

  TextStyle get headerTextStyle =>
      TextStyle(
        fontSize: headerTitle,
        color: AppColors.primaryColor,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.none,
      );

  TextStyle get primaryButtonTextStyle =>
      TextStyle(
        fontSize: title,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      );

  TextStyle subTitleStyle({Color? color}) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: subHeaderTitle,
      color: color ?? AppColors.colorAccent,
    );
  }

  ButtonStyle get elevatedWhiteBtnRoundedStyle {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.secondaryColor,
      textStyle: TextStyle(
        fontSize: title,
        color: AppColors.secondaryColor,
        fontWeight: FontWeight.w500,
      ),
      minimumSize: const Size(400, 48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(cardRadius)),
      ),
      padding: EdgeInsets.symmetric(
          vertical: cardVerticalPadding, horizontal: cardHorizontalPadding),
      elevation: 2.0,
      foregroundColor: AppColors.secondaryColor,
    );
  }
}
