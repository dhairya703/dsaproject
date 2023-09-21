import 'controller/frame_eleven_controller.dart';
import 'package:flutter/material.dart';
import 'package:shivi_s_application2/core/app_export.dart';
import 'package:shivi_s_application2/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class FrameElevenScreen extends GetWidget<FrameElevenController> {
  const FrameElevenScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.blueGray900,
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              decoration: AppDecoration.outlineBlack,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 209.v),
                  CustomImageView(
                    svgPath: ImageConstant.imgFrameBlue800,
                    height: 67.v,
                    width: 83.h,
                  ),
                  SizedBox(height: 21.v),
                  Text(
                    "lbl_legally".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 21.v),
                  SizedBox(
                    width: 142.h,
                    child: Text(
                      "msg_explore_the_law".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodySmallGray100,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 4.h,
                      top: 156.v,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 23.h,
                      vertical: 95.v,
                    ),
                    decoration: AppDecoration.fillPrimary.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder41,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomOutlinedButton(
                          height: 60.v,
                          text: "lbl_login".tr,
                          buttonStyle: CustomButtonStyles.outlinePrimary,
                        ),
                        SizedBox(height: 26.v),
                        CustomOutlinedButton(
                          height: 50.v,
                          text: "lbl_signup".tr,
                          buttonStyle: CustomButtonStyles.outlineBlueGray,
                          buttonTextStyle: CustomTextStyles.titleSmallInter,
                        ),
                        SizedBox(height: 26.v),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
