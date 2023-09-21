import 'package:shivi_s_application2/core/app_export.dart';
import 'package:shivi_s_application2/presentation/frame_eleven_screen/models/frame_eleven_model.dart';

/// A controller class for the FrameElevenScreen.
///
/// This class manages the state of the FrameElevenScreen, including the
/// current frameElevenModelObj
class FrameElevenController extends GetxController {
  Rx<FrameElevenModel> frameElevenModelObj = FrameElevenModel().obs;
}
