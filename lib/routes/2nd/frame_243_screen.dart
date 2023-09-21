import 'controller/frame_243_controller.dart';
import 'package:flutter/material.dart';
import 'package:shivi_s_application2/core/app_export.dart';
import 'package:shivi_s_application2/widgets/custom_outlined_button.dart';

class Frame243Screen extends GetWidget<Frame243Controller> {
  const Frame243Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                    child: SizedBox(
                        height: mediaQueryData.size.height,
                        width: double.maxFinite,
                        child: Stack(alignment: Alignment.topRight, children: [
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 17.h, vertical: 62.v),
                                  decoration: AppDecoration.fillGray,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 25.v),
                                        CustomImageView(
                                            svgPath: ImageConstant.imgArrowleft,
                                            height: 36.adaptSize,
                                            width: 36.adaptSize,
                                            onTap: () {
                                              onTapImgArrowleftone();
                                            }),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                width: 332.h,
                                                margin: EdgeInsets.only(
                                                    left: 9.h,
                                                    top: 395.v,
                                                    right: 17.h),
                                                child: Text(
                                                    "msg_enter_the_name_of".tr,
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    style: theme
                                                        .textTheme.bodyMedium!
                                                        .copyWith(
                                                            height: 1.54)))),
                                        CustomOutlinedButton(
                                            text: "lbl_next".tr,
                                            margin: EdgeInsets.only(
                                                left: 42.h,
                                                top: 167.v,
                                                right: 58.h),
                                            rightIcon: Container(
                                                margin:
                                                    EdgeInsets.only(left: 7.h),
                                                child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgArrowright)),
                                            buttonTextStyle: CustomTextStyles
                                                .labelLargeInterOnPrimary)
                                      ]))),
                          CustomImageView(
                              imagePath: ImageConstant
                                  .imgCloseofgavelincourtroom282x320,
                              height: 282.v,
                              width: 320.h,
                              alignment: Alignment.topRight,
                              margin: EdgeInsets.only(top: 138.v)),
                          CustomImageView(
                              imagePath:
                                  ImageConstant.imgCloseofgavelincourtroom,
                              height: 81.v,
                              width: 192.h,
                              alignment: Alignment.center)
                        ]))))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapImgArrowleftone() {
    Get.back();
  }
}
