import 'package:flutter/material.dart';
import 'package:shivi_s_application2/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlack => BoxDecoration(
        color: appTheme.black90002,
      );
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue50,
      );
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray900,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray90002,
      );
  static BoxDecoration get fillGray300 => BoxDecoration(
        color: appTheme.gray300,
      );
  static BoxDecoration get fillOnError => BoxDecoration(
        color: theme.colorScheme.onError,
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillRed => BoxDecoration(
        color: appTheme.red700,
      );
  static BoxDecoration get fillRed900 => BoxDecoration(
        color: appTheme.red900,
      );

  // Gradient decorations
  static BoxDecoration get gradientBlackToIndigo => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.27, -0.15),
          end: Alignment(0.27, 0.85),
          colors: [
            appTheme.black90001,
            appTheme.indigo900,
          ],
        ),
      );
  static BoxDecoration get gradientOnErrorContainerToPrimaryContainer =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0, 0.45),
          end: Alignment(1.04, 0.54),
          colors: [
            theme.colorScheme.onErrorContainer,
            theme.colorScheme.primaryContainer,
          ],
        ),
      );
  static BoxDecoration get gradientRedToYellow => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.01, 0.53),
          end: Alignment(0.93, 0.5),
          colors: [
            appTheme.red70001,
            appTheme.yellow800,
          ],
        ),
      );
  static BoxDecoration get gradientYellowToSecondaryContainer => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.02, 0.41),
          end: Alignment(1, 0.5),
          colors: [
            appTheme.yellow700,
            theme.colorScheme.secondaryContainer,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: appTheme.gray90002,
        border: Border.all(
          color: appTheme.black90002,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineGray => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        border: Border.all(
          color: appTheme.gray200,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlinePrimary => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder11 => BorderRadius.circular(
        11.h,
      );
  static BorderRadius get circleBorder51 => BorderRadius.circular(
        51.h,
      );

  // Rounded borders
  static BorderRadius get roundedBorder1 => BorderRadius.circular(
        1.h,
      );
  static BorderRadius get roundedBorder18 => BorderRadius.circular(
        18.h,
      );
  static BorderRadius get roundedBorder25 => BorderRadius.circular(
        25.h,
      );
  static BorderRadius get roundedBorder41 => BorderRadius.circular(
        41.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
