import 'package:flutter/material.dart';

import '/utils/constants/sizes.dart';
import '/utils/constants/colors.dart';

class AAppBarTheme {
  AAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: AColors.black, size: ASizes.iconMd),
    actionsIconTheme: IconThemeData(color: AColors.black, size: ASizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: AColors.black,
        fontFamily: 'Poppins'),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: AColors.black, size: ASizes.iconMd),
    actionsIconTheme: IconThemeData(color: AColors.white, size: ASizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: AColors.white,
        fontFamily: 'Poppins'),
  );
}
