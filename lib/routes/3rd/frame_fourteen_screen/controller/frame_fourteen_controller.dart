import 'package:firestore/core/app_export.dart';
import 'package:firestore/routes/3rd/frame_fourteen_screen/models/frame_fourteen_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

/// A controller class for the FrameFourteenScreen.
///
/// This class manages the state of the FrameFourteenScreen, including the
/// current frameFourteenModelObj
class FrameFourteenController extends GetxController {
  Rx<FrameFourteenModel> frameFourteenModelObj = FrameFourteenModel().obs;
}
