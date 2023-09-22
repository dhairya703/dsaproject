import 'package:firestore/core/app_export.dart';
import 'package:firestore/frame_seventeen_screen/models/frame_seventeen_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:flutter/material.dart';

/// A controller class for the FrameSeventeenScreen.
///
/// This class manages the state of the FrameSeventeenScreen, including the
/// current frameSeventeenModelObj
class FrameSeventeenController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<FrameSeventeenModel> frameSeventeenModelObj = FrameSeventeenModel().obs;

  Rx<int> sliderIndex = 0.obs;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
