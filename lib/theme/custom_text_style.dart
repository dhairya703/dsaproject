import 'package:firestore/core/utils/size_utils.dart';
import 'package:firestore/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBlack90002 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black90002,
      );
  static get bodyLargeOnPrimaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      );
  static get bodyMediumBlueA70001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueA70001,
      );
  static get bodyMediumOnSecondaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onSecondaryContainer,
        fontSize: 14.fSize,
      );
  static get bodyMediumOnSecondaryContainer15 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onSecondaryContainer,
        fontSize: 15.fSize,
      );
  static get bodyMediumPoppins => theme.textTheme.bodyMedium!.poppins;
  static get bodyMediumPoppinsGray600 =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: appTheme.gray600,
      );
  static get bodySmall12 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 12.fSize,
      );
  static get bodySmallBlack90002 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black90002,
      );
  static get bodySmallGray100 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray100,
        fontSize: 12.fSize,
      );
  static get bodySmallPoppins => theme.textTheme.bodySmall!.poppins.copyWith(
        fontSize: 12.fSize,
      );
  static get bodySmallPoppinsBlue600 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.blue600,
        fontSize: 10.fSize,
      );
  static get bodySmallPoppinsLightblueA700 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.lightBlueA700,
        fontSize: 10.fSize,
      );
  // Inter text style
  static get interOnPrimaryContainer => TextStyle(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontSize: 4.fSize,
        fontWeight: FontWeight.w600,
      ).inter;
  // Keania text style
  static get keaniaOneOnPrimaryContainer => TextStyle(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontSize: 100.fSize,
        fontWeight: FontWeight.w400,
      ).keaniaOne;
  // Label text style
  static get labelLarge12 => theme.textTheme.labelLarge!.copyWith(
        fontSize: 12.fSize,
      );
  static get labelLargeBlack90002 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black90002,
      );
  static get labelLargeInter => theme.textTheme.labelLarge!.inter;
  static get labelLargeInterGray90001 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.gray90001,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeInterGray90002 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.gray90002,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeInterOnPrimary =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeInterPrimary =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: theme.colorScheme.primary,
      );
  static get labelLargeMedium => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );
  static get labelMedium11 => theme.textTheme.labelMedium!.copyWith(
        fontSize: 11.fSize,
      );
  static get labelMediumBlack90002 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.black90002,
      );
  static get labelMediumBold => theme.textTheme.labelMedium!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get labelMediumPoppins => theme.textTheme.labelMedium!.poppins;
  static get labelMediumPoppinsBold =>
      theme.textTheme.labelMedium!.poppins.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get labelMediumPoppinsIndigo100 =>
      theme.textTheme.labelMedium!.poppins.copyWith(
        color: appTheme.indigo100,
      );
  static get labelMediumPoppinsRed500 =>
      theme.textTheme.labelMedium!.poppins.copyWith(
        color: appTheme.red500,
      );
  static get labelSmallBlack90002 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.black90002,
      );
  // Title text style
  static get titleLargeOnPrimaryContainer =>
      theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get titleLargeSemiBold => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleSmallGray90003 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray90003,
      );
  static get titleSmallInter => theme.textTheme.titleSmall!.inter.copyWith(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallInterBlack90002 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.black90002,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallInterBlack90002Medium =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.black90002,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallInterGray100 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.gray100,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallInterGray90002 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.gray90002,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w600,
      );
}

extension on TextStyle {
  TextStyle get jomhuria {
    return copyWith(
      fontFamily: 'Jomhuria',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get keaniaOne {
    return copyWith(
      fontFamily: 'Keania One',
    );
  }
}
