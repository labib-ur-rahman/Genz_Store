import 'package:flutter/material.dart';
import 'package:genz_store/utils/theme/custom_themes/chip_theme.dart';
import 'package:genz_store/utils/theme/custom_themes/text_theme.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
//import 'custom_themes/chip_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_field_theme.dart';

class SLAppTheme {
  SLAppTheme._();

  /// Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: SLTextTheme.lightTextTheme,
    chipTheme: SLChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: SLAppBarTheme.lightAppBarTheme,
    checkboxTheme: SLCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: SLBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: SLElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: SLOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: SLTextFieldTheme.lightInputDecorationTheme,
  );

  /// Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: SLTextTheme.darkTextTheme,
    chipTheme: SLChipTheme.darkChipTheme,
    appBarTheme: SLAppBarTheme.darkAppBarTheme,
    checkboxTheme: SLCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: SLBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: SLElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: SLOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: SLTextFieldTheme.darkInputDecorationTheme,
  );
}