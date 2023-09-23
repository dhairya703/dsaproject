import 'package:firestore/core/app_export.dart';
import 'package:firestore/core/utils/image_constant.dart';
import 'package:firestore/core/utils/size_utils.dart';
import 'package:firestore/routes/4th/frame_eleven_screen/frame_eleven_screen.dart';
import 'package:firestore/theme/app_decoration.dart';
import 'package:firestore/widgets/custom_image_view.dart';
import 'package:firestore/widgets/custom_outlined_button.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'controller/frame_fourteen_controller.dart';
import 'package:flutter/material.dart';


// ignore_for_file: must_be_immutable
class FrameFourteenScreen extends GetWidget<FrameFourteenController> {
  const FrameFourteenScreen({Key? key})
      : super(
          key: key,
        );

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
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 59.h,
                        vertical: 62.v,
                      ),
                      decoration: AppDecoration.fillGray,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: 366.v),
                          CustomImageView(
                            imagePath: ImageConstant.imgCloseofgavelincourtroom,
                            height: 81.v,
                            width: 192.h,
                            alignment: Alignment.center,
                          ),
                          Container(
                            width: 214.h,
                            margin: EdgeInsets.only(
                              left: 23.h,
                              top: 34.v,
                              right: 38.h,
                            ),
                            child: Text(
                              "Find all types of legal services in one app, with an easy process and multiple benefits.".tr,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyMedium!.copyWith(
                                height: 1.63,
                              ),
                            ),
                          ),
                          CustomOutlinedButton(
                            text: "Get Started".tr,
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        FrameElevenScreen()),
                              );
                            },
                            margin: EdgeInsets.only(
                              top: 163.v,
                              right: 16.h,
                            ),
                            buttonTextStyle: CustomTextStyles.labelLargeInterGray90002.copyWith(
                              color: Colors.yellow, // Set the text color to yellow.
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgCloseofgavelincourtroom211x305,
                    height: 211.v,
                    width: 305.h,
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(top: 161.v),
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
