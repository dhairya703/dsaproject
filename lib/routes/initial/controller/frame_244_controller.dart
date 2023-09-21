import 'package:firestore/core/app_export.dart';
import 'package:firestore/routes/app_routes.dart';
import 'package:firestore/routes/initial/models/frame_244_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:firestore/core/app_export.dart';

/// A controller class for the Frame244Screen.
///
/// This class manages the state of the Frame244Screen, including the
/// current frame244ModelObj
///
class Frame244Controller extends GetxController {
  Rx<Frame244Model> frame244ModelObj = Frame244Model().obs;

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(
        AppRoutes.frame243Screen,
      );
    });
  }
}
