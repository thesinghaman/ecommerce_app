import 'package:flutter/material.dart';

import '/utils/constants/colors.dart';
import '/utils/constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class AElevatedButtonTheme {
  AElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AColors.light,
      backgroundColor: AColors.primary,
      disabledForegroundColor: AColors.darkGrey,
      disabledBackgroundColor: AColors.buttonDisabled,
      side: const BorderSide(color: AColors.primary),
      padding: const EdgeInsets.symmetric(vertical: ASizes.buttonHeight),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ASizes.buttonRadius)),
      textStyle: const TextStyle(
          fontSize: 16,
          color: AColors.textWhite,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins'),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AColors.light,
      backgroundColor: AColors.primary,
      disabledForegroundColor: AColors.darkGrey,
      disabledBackgroundColor: AColors.darkerGrey,
      side: const BorderSide(color: AColors.primary),
      padding: const EdgeInsets.symmetric(vertical: ASizes.buttonHeight),
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
