import 'package:firestore/core/app_export.dart';
import 'package:firestore/core/utils/image_constant.dart';
import 'package:firestore/core/utils/size_utils.dart';
import 'package:firestore/theme/app_decoration.dart';
import 'package:firestore/theme/theme_helper.dart';
import 'package:firestore/widgets/app_bar/appbar_image.dart';
import 'package:firestore/widgets/app_bar/appbar_image_1.dart';
import 'package:firestore/widgets/app_bar/custom_app_bar.dart';
import 'package:firestore/widgets/custom_elevated_button.dart';
import 'package:firestore/widgets/custom_search_view.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../frame_seventeen_screen/widgets/userprofileview_item_widget.dart';
import 'controller/frame_seventeen_controller.dart';
import 'models/userprofileview_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:shivi_s_application2/core/app_export.dart';
// import 'package:shivi_s_application2/widgets/app_bar/appbar_image.dart';
// import 'package:shivi_s_application2/widgets/app_bar/appbar_image_1.dart';
// import 'package:shivi_s_application2/widgets/app_bar/custom_app_bar.dart';
// import 'package:shivi_s_application2/widgets/custom_elevated_button.dart';
// import 'package:shivi_s_application2/widgets/custom_search_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore_for_file: must_be_immutable
class FrameSeventeenScreen extends GetWidget<FrameSeventeenController> {
  const FrameSeventeenScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          leadingWidth: 50.h,
          leading: AppbarImage(
            imagePath: ImageConstant.imgUser28x28,
            margin: EdgeInsets.only(
              left: 22.h,
              top: 10.v,
              bottom: 18.v,
            ),
          ),
          actions: [
            AppbarImage1(
              svgPath: ImageConstant.imgNotificationGray90002,
              margin: EdgeInsets.fromLTRB(24.h, 12.v, 10.h, 15.v),
            ),
            AppbarImage1(
              svgPath: ImageConstant.imgLayer1Gray90002,
              margin: EdgeInsets.only(
                left: 24.h,
                top: 17.v,
                right: 34.h,
              ),
            ),
          ],
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 2.v),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: 1276.v,
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 21.h,
                              right: 13.h,
                            ),
                            decoration: AppDecoration.fillGray,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomSearchView(
                                  margin: EdgeInsets.only(
                                    left: 1.h,
                                    right: 13.h,
                                  ),
                                  controller: controller.searchController,
                                  hintText: "lbl_search".tr,
                                  suffix: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        30.h, 12.v, 26.h, 14.v),
                                    child: CustomImageView(
                                      svgPath: ImageConstant.imgSearch,
                                    ),
                                  ),
                                  suffixConstraints: BoxConstraints(
                                    maxHeight: 40.v,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 57.h,
                                    top: 119.v,
                                  ),
                                  child: Text(
                                    "lbl_2".tr,
                                    style: CustomTextStyles.bodySmallBlack90002,
                                  ),
                                ),
                                SizedBox(height: 30.v),
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    height: 8.v,
                                    child: AnimatedSmoothIndicator(
                                      activeIndex: 0,
                                      count: 4,
                                      effect: ScrollingDotsEffect(
                                        spacing: 8.69,
                                        activeDotColor:
                                            theme.colorScheme.primary,
                                        dotColor: appTheme.blue100,
                                        dotHeight: 8.v,
                                        dotWidth: 8.h,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 1.h,
                                    top: 22.v,
                                    right: 13.h,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 13.h,
                                    vertical: 14.v,
                                  ),
                                  decoration:
                                      AppDecoration.outlinePrimary.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder18,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 3.h),
                                        child: Text(
                                          "lbl_services".tr,
                                          style: theme.textTheme.labelLarge,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 3.h,
                                          top: 12.v,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: 79.v,
                                              width: 82.h,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                      height: 79.v,
                                                      width: 82.h,
                                                      decoration: BoxDecoration(
                                                        color: theme.colorScheme
                                                            .onPrimaryContainer
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          41.h,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgLayer1BlueA700,
                                                    height: 39.v,
                                                    width: 37.h,
                                                    alignment: Alignment.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 79.v,
                                              width: 82.h,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                      height: 79.v,
                                                      width: 82.h,
                                                      decoration: BoxDecoration(
                                                        color: theme.colorScheme
                                                            .onPrimaryContainer
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          41.h,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgLayer1Blue700,
                                                    height: 39.v,
                                                    width: 51.h,
                                                    alignment: Alignment.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 79.v,
                                              width: 82.h,
                                              child: Stack(
                                                alignment:
                                                    Alignment.centerRight,
                                                children: [
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                      height: 79.v,
                                                      width: 82.h,
                                                      decoration: BoxDecoration(
                                                        color: theme.colorScheme
                                                            .onPrimaryContainer
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          41.h,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgLayer1Black90002,
                                                    height: 38.v,
                                                    width: 51.h,
                                                    alignment:
                                                        Alignment.centerRight,
                                                    margin: EdgeInsets.only(
                                                        right: 13.h),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: 10.h,
                                            top: 21.v,
                                            right: 18.h,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "lbl_business_setup".tr,
                                                style:
                                                    theme.textTheme.labelSmall,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 50.h),
                                                child: Text(
                                                  "lbl_documentation".tr,
                                                  style: theme
                                                      .textTheme.labelSmall,
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                "lbl_disputes".tr,
                                                style:
                                                    theme.textTheme.labelSmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 3.h,
                                          top: 39.v,
                                          right: 16.h,
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              height: 79.v,
                                              width: 82.h,
                                              child: Stack(
                                                alignment: Alignment.topCenter,
                                                children: [
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                      height: 79.v,
                                                      width: 82.h,
                                                      decoration: BoxDecoration(
                                                        color: theme.colorScheme
                                                            .onPrimaryContainer
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          41.h,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgLayer1Black900,
                                                    height: 40.v,
                                                    width: 34.h,
                                                    alignment:
                                                        Alignment.topCenter,
                                                    margin: EdgeInsets.only(
                                                        top: 17.v),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 79.v,
                                              width: 82.h,
                                              margin:
                                                  EdgeInsets.only(left: 34.h),
                                              child: Stack(
                                                alignment: Alignment.topRight,
                                                children: [
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                      height: 79.v,
                                                      width: 82.h,
                                                      decoration: BoxDecoration(
                                                        color: theme.colorScheme
                                                            .onPrimaryContainer
                                                            .withOpacity(1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          41.h,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgLayer1Black90039x39,
                                                    height: 39.adaptSize,
                                                    width: 39.adaptSize,
                                                    alignment:
                                                        Alignment.topRight,
                                                    margin: EdgeInsets.only(
                                                      top: 18.v,
                                                      right: 19.h,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            CustomElevatedButton(
                                              height: 56.v,
                                              width: 58.h,
                                              text: "lbl_see_all".tr,
                                              margin: EdgeInsets.only(
                                                left: 44.h,
                                                top: 11.v,
                                                bottom: 12.v,
                                              ),
                                              buttonStyle:
                                                  CustomButtonStyles.fillBlue,
                                              buttonTextStyle:
                                                  theme.textTheme.labelMedium!,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 17.h,
                                          top: 14.v,
                                          bottom: 10.v,
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              "lbl_consultant".tr,
                                              style:
                                                  theme.textTheme.labelMedium,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 55.h),
                                              child: Text(
                                                "lbl_legal_advice".tr,
                                                style:
                                                    theme.textTheme.labelMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 20.v,
                                  width: 56.h,
                                  margin: EdgeInsets.only(
                                    left: 17.h,
                                    top: 25.v,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "lbl_lawyers".tr,
                                          style: theme.textTheme.labelLarge,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: SizedBox(
                                          height: 20.v,
                                          width: 56.h,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "lbl_lawyers".tr,
                                                  style: theme
                                                      .textTheme.labelLarge,
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "lbl_lawyers".tr,
                                                  style: theme
                                                      .textTheme.labelLarge,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 25.h,
                                      top: 15.v,
                                      right: 13.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 98.v,
                                          width: 67.h,
                                          margin: EdgeInsets.only(bottom: 7.v),
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              Opacity(
                                                opacity: 0.5,
                                                child: Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Container(
                                                    height: 76.v,
                                                    width: 67.h,
                                                    decoration: BoxDecoration(
                                                      color: appTheme.blue5001
                                                          .withOpacity(0.53),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        10.h,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgRectangle53,
                                                height: 89.v,
                                                width: 67.h,
                                                radius: BorderRadius.circular(
                                                  10.h,
                                                ),
                                                alignment:
                                                    Alignment.bottomCenter,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 105.v,
                                          width: 208.h,
                                          child: Stack(
                                            alignment: Alignment.topCenter,
                                            children: [
                                              Opacity(
                                                opacity: 0.5,
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Container(
                                                    height: 76.v,
                                                    width: 67.h,
                                                    margin: EdgeInsets.only(
                                                        left: 7.h),
                                                    decoration: BoxDecoration(
                                                      color: appTheme.blue5001
                                                          .withOpacity(0.53),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        10.h,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Opacity(
                                                opacity: 0.5,
                                                child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgRectangle143,
                                                  height: 79.v,
                                                  width: 193.h,
                                                  radius: BorderRadius.circular(
                                                    10.h,
                                                  ),
                                                  alignment:
                                                      Alignment.topCenter,
                                                ),
                                              ),
                                              CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgRectangle6196x84,
                                                height: 96.v,
                                                width: 84.h,
                                                radius: BorderRadius.circular(
                                                  10.h,
                                                ),
                                                alignment: Alignment.bottomLeft,
                                              ),
                                              CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgRectangle62,
                                                height: 96.v,
                                                width: 85.h,
                                                radius: BorderRadius.circular(
                                                  10.h,
                                                ),
                                                alignment:
                                                    Alignment.bottomRight,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 38.h,
                                      top: 6.v,
                                      right: 26.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 1.v),
                                          child: Text(
                                            "lbl_criminal".tr,
                                            style: theme.textTheme.labelMedium,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 1.v),
                                          child: Text(
                                            "lbl_civil".tr,
                                            style: theme.textTheme.labelMedium,
                                          ),
                                        ),
                                        Text(
                                          "lbl_corporate".tr,
                                          style: theme.textTheme.labelMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 17.h,
                                      top: 19.v,
                                      right: 13.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 107.v,
                                          width: 84.h,
                                          margin: EdgeInsets.only(top: 1.v),
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              Opacity(
                                                opacity: 0.5,
                                                child: Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Container(
                                                    height: 97.v,
                                                    width: 67.h,
                                                    decoration: BoxDecoration(
                                                      color: appTheme.blue5001
                                                          .withOpacity(0.53),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        10.h,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgRectangle63,
                                                height: 95.v,
                                                width: 84.h,
                                                radius: BorderRadius.circular(
                                                  10.h,
                                                ),
                                                alignment:
                                                    Alignment.bottomCenter,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 108.v,
                                          width: 208.h,
                                          child: Stack(
                                            alignment: Alignment.bottomLeft,
                                            children: [
                                              Opacity(
                                                opacity: 0.5,
                                                child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgRectangle143,
                                                  height: 79.v,
                                                  width: 193.h,
                                                  radius: BorderRadius.circular(
                                                    10.h,
                                                  ),
                                                  alignment:
                                                      Alignment.topCenter,
                                                ),
                                              ),
                                              CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgRectangle64,
                                                height: 96.v,
                                                width: 84.h,
                                                radius: BorderRadius.circular(
                                                  10.h,
                                                ),
                                                alignment: Alignment.bottomLeft,
                                              ),
                                              CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgRectangle65,
                                                height: 96.v,
                                                width: 85.h,
                                                radius: BorderRadius.circular(
                                                  10.h,
                                                ),
                                                alignment:
                                                    Alignment.bottomRight,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 21.h,
                                      top: 10.v,
                                      right: 4.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "lbl_public_interest".tr,
                                          style: theme.textTheme.labelMedium,
                                        ),
                                        Spacer(),
                                        Text(
                                          "lbl_immigration".tr,
                                          style: theme.textTheme.labelMedium,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 48.h),
                                          child: Text(
                                            "msg_intellectual_property".tr,
                                            style: theme.textTheme.labelMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 16.h,
                                    top: 24.v,
                                  ),
                                  child: Text(
                                    "msg_recommended_lawyers".tr,
                                    style: theme.textTheme.labelLarge,
                                  ),
                                ),
                                SizedBox(height: 21.v),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 147.v,
                                      width: 115.h,
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          CustomImageView(
                                            imagePath:
                                                ImageConstant.imgRectangle140,
                                            height: 147.v,
                                            width: 115.h,
                                            radius: BorderRadius.circular(
                                              18.h,
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 16.v),
                                              child: Text(
                                                "lbl_ritika_sharma".tr,
                                                style: CustomTextStyles
                                                    .labelMediumPoppins,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 147.v,
                                      width: 111.h,
                                      child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          CustomImageView(
                                            imagePath:
                                                ImageConstant.imgRectangle66,
                                            height: 147.v,
                                            width: 111.h,
                                            radius: BorderRadius.circular(
                                              18.h,
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                right: 6.h,
                                                bottom: 18.v,
                                              ),
                                              child: Text(
                                                "msg_simran_singhania".tr,
                                                style: CustomTextStyles
                                                    .labelMediumPoppins,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 147.v,
                                      width: 105.h,
                                      child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          CustomImageView(
                                            imagePath:
                                                ImageConstant.imgRectangle141,
                                            height: 147.v,
                                            width: 105.h,
                                            radius: BorderRadius.circular(
                                              18.h,
                                            ),
                                            alignment: Alignment.center,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                right: 2.h,
                                                bottom: 18.v,
                                              ),
                                              child: Text(
                                                "lbl_chetan_agarwal".tr,
                                                style: CustomTextStyles
                                                    .labelMediumPoppins,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 29.h,
                                      top: 65.v,
                                      right: 13.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                          svgPath: ImageConstant.imgHome,
                                          height: 25.v,
                                          width: 27.h,
                                          margin: EdgeInsets.only(bottom: 5.v),
                                        ),
                                        SizedBox(
                                          height: 30.v,
                                          width: 178.h,
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgGroup17,
                                                height: 25.v,
                                                width: 178.h,
                                                alignment: Alignment.topCenter,
                                              ),
                                              CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgGroup675,
                                                height: 25.v,
                                                width: 178.h,
                                                alignment:
                                                    Alignment.bottomCenter,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                CustomImageView(
                                  svgPath: ImageConstant.imgHome,
                                  height: 25.v,
                                  width: 27.h,
                                  margin: EdgeInsets.only(
                                    left: 25.h,
                                    top: 7.v,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.only(
                              top: 64.v,
                              bottom: 1096.v,
                            ),
                            child: IntrinsicWidth(
                              child: SizedBox(
                                height: 116.v,
                                width: 1057.h,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        height: 115.v,
                                        width: 350.h,
                                        child: Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(right: 5.h),
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 16.h,
                                                  vertical: 32.v,
                                                ),
                                                decoration: AppDecoration
                                                    .gradientRedToYellow
                                                    .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .circleBorder11,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(height: 45.v),
                                                    Container(
                                                      height: 6.v,
                                                      width: 1.h,
                                                      decoration: BoxDecoration(
                                                        color: theme.colorScheme
                                                            .onPrimaryContainer
                                                            .withOpacity(1),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgD3a6f583a26aa67,
                                              height: 104.v,
                                              width: 225.h,
                                              alignment: Alignment.bottomRight,
                                            ),
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: 20.h,
                                                  top: 29.v,
                                                ),
                                                child: Text(
                                                  "msg_find_best_lawyers".tr,
                                                  style: CustomTextStyles
                                                      .labelMediumBold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Obx(
                                      () => CarouselSlider.builder(
                                        options: CarouselOptions(
                                          height: 116.v,
                                          initialPage: 0,
                                          autoPlay: true,
                                          viewportFraction: 1.0,
                                          enableInfiniteScroll: false,
                                          scrollDirection: Axis.horizontal,
                                          onPageChanged: (
                                            index,
                                            reason,
                                          ) {
                                            controller.sliderIndex.value =
                                                index;
                                          },
                                        ),
                                        itemCount: controller
                                            .frameSeventeenModelObj
                                            .value
                                            .userprofileviewItemList
                                            .value
                                            .length,
                                        itemBuilder:
                                            (context, index, realIndex) {
                                          UserprofileviewItemModel model =
                                              controller
                                                  .frameSeventeenModelObj
                                                  .value
                                                  .userprofileviewItemList
                                                  .value[index];
                                          return UserprofileviewItemWidget(
                                            model,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgRectangle8,
                          height: 72.v,
                          width: 393.h,
                          alignment: Alignment.bottomCenter,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(left: 3.h),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            border: Border.all(
              color: appTheme.gray500,
              width: 1.h,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(41.h, 17.v, 32.h, 28.v),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomImageView(
                  svgPath: ImageConstant.imgFrameGray900,
                  height: 25.v,
                  width: 27.h,
                ),
                CustomImageView(
                  svgPath: ImageConstant.imgGroup675,
                  height: 25.v,
                  width: 178.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
