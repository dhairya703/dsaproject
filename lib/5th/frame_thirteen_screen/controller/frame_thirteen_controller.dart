import 'package:firestore/5th/frame_thirteen_screen/models/frame_thirteen_model.dart';
import 'package:firestore/core/app_export.dart';
import 'package:flutter/material.dart';

/// A controller class for the FrameThirteenScreen.
///
/// This class manages the state of the FrameThirteenScreen, including the
/// current frameThirteenModelObj
class FrameThirteenController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<FrameThirteenModel> frameThirteenModelObj = FrameThirteenModel().obs;

  Rx<bool> isShowPassword = true.obs;

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
