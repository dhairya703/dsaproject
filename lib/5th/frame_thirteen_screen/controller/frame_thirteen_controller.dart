import 'package:shivi_s_application2/core/app_export.dart';
import 'package:shivi_s_application2/presentation/frame_thirteen_screen/models/frame_thirteen_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the FrameThirteenScreen.
///
/// This class manages the state of the FrameThirteenScreen, including the
/// current frameThirteenModelObj
class FrameThirteenController extends GetxController {
  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<FrameThirteenModel> frameThirteenModelObj = FrameThirteenModel().obs;

  Rx<bool> isShowPassword = true.obs;

  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    passwordController.dispose();
  }
}
