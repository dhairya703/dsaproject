import 'package:firestore/core/app_export.dart';
import 'package:firestore/routes/4th/frame_eleven_screen/models/frame_eleven_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

/// A controller class for the FrameElevenScreen.
///
/// This class manages the state of the FrameElevenScreen, including the
/// current frameElevenModelObj
class FrameElevenController extends GetxController {
  Rx<FrameElevenModel> frameElevenModelObj = FrameElevenModel().obs;
}
