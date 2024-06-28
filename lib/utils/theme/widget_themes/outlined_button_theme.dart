import 'package:flutter/material.dart';

import '/utils/constants/colors.dart';
import '/utils/constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class AOutlinedButtonTheme {
  AOutlinedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AColors.dark,
      side: const BorderSide(color: AColors.borderPrimary),
      padding: const EdgeInsets.symmetric(
          vertical: ASizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ASizes.buttonRadius)),
      textStyle: const TextStyle(
          fontSize: 16,
          color: AColors.black,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins'),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AColors.light,
      side: const BorderSide(color: AColors.borderPrimary),
      padding: const EdgeInsets.symmetric(
          vertical: ASizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ASizes.buttonRadius)),
      textStyle: const TextStyle(
          fontSize: 16,
          color: AColors.textWhite,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins'),
    ),
  );
}
