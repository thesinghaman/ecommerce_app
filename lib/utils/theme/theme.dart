import 'package:flutter/material.dart';

import '/utils/constants/colors.dart';
import '/utils/theme/widget_themes/appbar_theme.dart';
import '/utils/theme/widget_themes/bottom_sheet_theme.dart';
import '/utils/theme/widget_themes/checkbox_theme.dart';
import '/utils/theme/widget_themes/chip_theme.dart';
import '/utils/theme/widget_themes/elevated_button_theme.dart';
import '/utils/theme/widget_themes/outlined_button_theme.dart';
import '/utils/theme/widget_themes/text_field_theme.dart';
import '/utils/theme/widget_themes/text_theme.dart';

class AAppTheme {
  AAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: AColors.grey,
    brightness: Brightness.light,
    primaryColor: AColors.primary,
    textTheme: ATextTheme.lightTextTheme,
    chipTheme: AChipTheme.lightChipTheme,
    scaffoldBackgroundColor: AColors.white,
    appBarTheme: AAppBarTheme.lightAppBarTheme,
    checkboxTheme: ACheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: ABottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: AElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: AOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: ATextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: AColors.grey,
    brightness: Brightness.dark,
    primaryColor: AColors.primary,
    textTheme: ATextTheme.darkTextTheme,
    chipTheme: AChipTheme.darkChipTheme,
    scaffoldBackgroundColor: AColors.black,
    appBarTheme: AAppBarTheme.darkAppBarTheme,
    checkboxTheme: ACheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: ABottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: AElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: AOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: ATextFormFieldTheme.darkInputDecorationTheme,
  );
}
