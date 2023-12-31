import 'dart:ui';
import 'package:firestore/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../core/app_export.dart';
import '../core/utils/pref_utils.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onPrimaryContainer.withOpacity(1),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.gray90001,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.blueA70001,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        side: BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: colorScheme.onPrimaryContainer.withOpacity(1),
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.gray800,
          fontSize: 16.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 13.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 8.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: appTheme.deepOrangeA700,
          fontSize: 40.fSize,
          fontFamily: 'Jomhuria',
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 13.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
        labelMedium: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 10.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 8.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: appTheme.gray100,
          fontSize: 20.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 15.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFFFCA311),
    primaryContainer: Color(0XFF801D17),
    secondary: Color(0XFF801D17),
    secondaryContainer: Color(0XFFE4B003),
    tertiary: Color(0XFF801D17),
    tertiaryContainer: Color(0XFFE4B003),

    // Background colors
    background: Color(0XFF801D17),

    // Surface colors
    surface: Color(0XFF801D17),
    surfaceTint: Color(0XFF7B0101),
    surfaceVariant: Color(0XFFE4B003),

    // Error colors
    error: Color(0XFF7B0101),
    errorContainer: Color(0XFF027CF2),
    onError: Color(0XED63ACF3),
    onErrorContainer: Color(0XFF3D0000),

    // On colors(text colors)
    onBackground: Color(0X99FFFFFF),
    onInverseSurface: Color(0XED63ACF3),
    onPrimary: Color(0XFF7B0101),
    onPrimaryContainer: Color(0X99FFFFFF),
    onSecondary: Color(0X99FFFFFF),
    onSecondaryContainer: Color(0XFF1E1E1E),
    onTertiary: Color(0X99FFFFFF),
    onTertiaryContainer: Color(0XFF1E1E1E),

    // Other colors
    outline: Color(0XFF7B0101),
    outlineVariant: Color(0XFF801D17),
    scrim: Color(0XFF801D17),
    shadow: Color(0XFF7B0101),

    // Inverse colors
    inversePrimary: Color(0XFF801D17),
    inverseSurface: Color(0XFF7B0101),

    // Pending colors
    onSurface: Color(0X99FFFFFF),
    onSurfaceVariant: Color(0XFF1E1E1E),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => Color(0XFF050505);
  Color get black90001 => Color(0XFF00071E);
  Color get black90002 => Color(0XFF000000);

  // Blue
  Color get blue100 => Color(0XFFC0DFFF);
  Color get blue50 => Color(0XFFE6F3FF);
  Color get blue5001 => Color(0XFFE8F3FF);
  Color get blue600 => Color(0XFF2386E6);
  Color get blue700 => Color(0XFF2A5EDD);
  Color get blue70001 => Color(0XFF295CDB);
  Color get blue800 => Color(0XFF174AC9);
  Color get blue900 => Color(0XFF14538F);
  Color get blueA700 => Color(0XFF3265E2);
  Color get blueA70001 => Color(0XFF2D60DF);

  // BlueGray
  Color get blueGray400 => Color(0XFF888888);
  Color get blueGray900 => Color(0XFF14213D);

  // DeepOrange
  Color get deepOrangeA700 => Color(0XFFE31717);

  // Gray
  Color get gray100 => Color(0XFFF9F1F0);
  Color get gray200 => Color(0XFFEFEFEF);
  Color get gray300 => Color(0XFFE5E5E5);
  Color get gray500 => Color(0XFF989797);
  Color get gray600 => Color(0XFF7D7D7D);
  Color get gray800 => Color(0XFF4C4C4C);
  Color get gray900 => Color(0XFF350606);
  Color get gray90001 => Color(0XFF4B0000);
  Color get gray90002 => Color(0XFF061E35);
  Color get gray90003 => Color(0XFF1B1A18);

  // Green
  Color get green600 => Color(0XFF37A054);

  // Indigo
  Color get indigo100 => Color(0XFFB3C1E4);
  Color get indigo900 => Color(0XFF072471);

  // LightBlue
  Color get lightBlueA700 => Color(0XFF0077EB);
  Color get lightBlueA70001 => Color(0XFF0078EC);

  // Lime
  Color get lime600 => Color(0XFFD3AC2A);

  // Red
  Color get red500 => Color(0XFFFF2C2C);
  Color get red600 => Color(0XFFD73939);
  Color get red700 => Color(0XFFDE2D2D);
  Color get red70001 => Color(0XFFBC4F41);
  Color get red900 => Color(0XFF8B1111);
  Color get red90001 => Color(0XFFA12525);
  Color get red90002 => Color(0XFFB61313);
  Color get red90003 => Color(0XFFB21111);

  // Yellow
  Color get yellow600 => Color(0XFFF7CC3A);
  Color get yellow700 => Color(0XFFF8CA32);
  Color get yellow800 => Color(0XFFF5B02B);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
