import 'package:firestore/core/utils/size_utils.dart';
import 'package:firestore/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:firestore/core/app_export.dart';

// ignore: must_be_immutable
class AppbarImage1 extends StatelessWidget {
  AppbarImage1({
    Key? key,
    this.imagePath,
    this.svgPath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  String? svgPath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          svgPath: svgPath,
          imagePath: imagePath,
          height: 21.v,
          width: 17.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
