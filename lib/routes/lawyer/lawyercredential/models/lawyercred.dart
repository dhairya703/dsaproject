import 'package:firestore/core/app_export.dart';
import 'package:firestore/core/utils/image_constant.dart';
import 'package:firestore/core/utils/size_utils.dart';
import 'package:firestore/routes/lawyer/lawyercredential/controller/lawyer_cred.dart';
import 'package:firestore/theme/app_decoration.dart';
import 'package:firestore/theme/theme_helper.dart';
import 'package:firestore/user/login_screen.dart';
import 'package:firestore/user/signup_screen.dart';
import 'package:firestore/widgets/custom_image_view.dart';
import 'package:firestore/widgets/custom_outlined_button.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

// import 'controller/usercred.dart';
import 'package:flutter/material.dart';


// ignore_for_file: must_be_immutable
class Lawyer extends GetWidget<Lawyercred> {
  const Lawyer({Key? key})
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
                    "LEGALLY".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 21.v),
                  SizedBox(
                    width: 142.h,
                    child: Text(
                      "“Explore the law expertly\n& with ease”".tr,
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
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LoginScreen1()),
                            );
                          },

                          height: 60.v,
                          text: "Login".tr,
                          buttonStyle: CustomButtonStyles.outlinePrimary,
                        ),
                        SizedBox(height: 26.v),
                        CustomOutlinedButton(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SignUpScreen()),
                            );
                          },

                          height: 50.v,
                          text: "SignUp".tr,
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
