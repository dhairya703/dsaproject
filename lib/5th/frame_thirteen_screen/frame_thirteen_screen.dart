import 'controller/frame_thirteen_controller.dart';
import 'package:flutter/material.dart';
import 'package:shivi_s_application2/core/app_export.dart';
import 'package:shivi_s_application2/core/utils/validation_functions.dart';
import 'package:shivi_s_application2/widgets/app_bar/custom_app_bar.dart';
import 'package:shivi_s_application2/widgets/custom_elevated_button.dart';
import 'package:shivi_s_application2/widgets/custom_outlined_button.dart';
import 'package:shivi_s_application2/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class FrameThirteenScreen extends GetWidget<FrameThirteenController> {
  FrameThirteenScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.h, top: 47.v, right: 82.h),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomAppBar(
                                        height: 268.v,
                                        leadingWidth: double.maxFinite,
                                        leading: Container(
                                            height: 36.adaptSize,
                                            width: 36.adaptSize,
                                            margin: EdgeInsets.only(
                                                left: 25.h, right: 332.h),
                                            child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgVolume,
                                                      height: 36.adaptSize,
                                                      width: 36.adaptSize,
                                                      alignment:
                                                          Alignment.center,
                                                      onTap: () {
                                                        onTapImgVolumeone();
                                                      }),
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgArrowleft,
                                                      height: 36.adaptSize,
                                                      width: 36.adaptSize,
                                                      alignment:
                                                          Alignment.center)
                                                ]))),
                                    Container(
                                        height: 259.v,
                                        width: 235.h,
                                        margin: EdgeInsets.only(top: 10.v),
                                        child: Stack(
                                            alignment: Alignment.topCenter,
                                            children: [
                                              Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Text("lbl_login2".tr,
                                                      style: CustomTextStyles
                                                          .titleLargeOnPrimaryContainer)),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgScreenshot20230919at405,
                                                  height: 235.adaptSize,
                                                  width: 235.adaptSize,
                                                  radius: BorderRadius.circular(
                                                      23.h),
                                                  alignment:
                                                      Alignment.topCenter)
                                            ]))
                                  ])),
                          SizedBox(height: 50.v),
                          Expanded(
                              child: SingleChildScrollView(
                                  child: Container(
                                      margin: EdgeInsets.only(
                                          left: 25.h, right: 30.h, bottom: 5.v),
                                      decoration: AppDecoration.fillGray,
                                      child: Column(children: [
                                        CustomTextFormField(
                                            controller:
                                                controller.userNameController,
                                            hintText: "lbl_username".tr,
                                            validator: (value) {
                                              if (!isText(value)) {
                                                return "Please enter valid text";
                                              }
                                              return null;
                                            }),
                                        SizedBox(height: 38.v),
                                        Obx(() => CustomTextFormField(
                                            controller:
                                                controller.passwordController,
                                            hintText: "lbl_password".tr,
                                            textInputAction:
                                                TextInputAction.done,
                                            textInputType:
                                                TextInputType.visiblePassword,
                                            suffix: InkWell(
                                                onTap: () {
                                                  controller.isShowPassword
                                                          .value =
                                                      !controller
                                                          .isShowPassword.value;
                                                },
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 1.h,
                                                            vertical: 4.v),
                                                    margin: EdgeInsets.fromLTRB(
                                                        30.h, 10.v, 25.h, 10.v),
                                                    decoration: BoxDecoration(
                                                        color: theme.colorScheme
                                                            .onPrimaryContainer
                                                            .withOpacity(1)),
                                                    child: CustomImageView(
                                                        svgPath: controller
                                                                .isShowPassword
                                                                .value
                                                            ? ImageConstant
                                                                .imgEye
                                                            : ImageConstant
                                                                .imgEye))),
                                            suffixConstraints:
                                                BoxConstraints(maxHeight: 45.v),
                                            validator: (value) {
                                              if (value == null ||
                                                  (!isValidPassword(value,
                                                      isRequired: true))) {
                                                return "Please enter valid password";
                                              }
                                              return null;
                                            },
                                            obscureText: controller.isShowPassword.value,
                                            contentPadding: EdgeInsets.only(left: 30.h, top: 12.v, bottom: 12.v))),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 27.v, right: 3.h),
                                                child: Text(
                                                    "msg_forget_password".tr,
                                                    style: CustomTextStyles
                                                        .bodyLargeOnPrimaryContainer))),
                                        SizedBox(height: 53.v),
                                        CustomOutlinedButton(
                                            height: 59.v,
                                            text: "lbl_login3".tr,
                                            buttonStyle: CustomButtonStyles
                                                .outlineYellow,
                                            buttonTextStyle: CustomTextStyles
                                                .titleSmallInterGray90002),
                                        SizedBox(height: 26.v),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 5.v, bottom: 8.v),
                                                  child: SizedBox(
                                                      width: 58.h,
                                                      child: Divider())),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 2.h),
                                                  child: Text(
                                                      "msg_or_continue_with".tr,
                                                      style: CustomTextStyles
                                                          .bodySmall12)),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 5.v, bottom: 8.v),
                                                  child: SizedBox(
                                                      width: 60.h,
                                                      child:
                                                          Divider(indent: 2.h)))
                                            ]),
                                        SizedBox(height: 28.v),
                                        CustomElevatedButton(
                                            height: 47.v,
                                            text: "msg_continue_with_gmail".tr,
                                            leftIcon: Container(
                                                margin: EdgeInsets.only(
                                                    right: 12.h),
                                                child: CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgGoog0ed88f7c1,
                                                    height: 32.adaptSize,
                                                    width: 32.adaptSize)),
                                            buttonStyle: CustomButtonStyles
                                                .fillOnPrimaryContainerTL23,
                                            buttonTextStyle: CustomTextStyles
                                                .titleSmallInterBlack90002)
                                      ]))))
                        ])))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapImgVolumeone() {
    Get.back();
  }
}
