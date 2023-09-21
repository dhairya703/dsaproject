import '../controller/frame_thirteen_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FrameThirteenScreen.
///
/// This class ensures that the FrameThirteenController is created when the
/// FrameThirteenScreen is first loaded.
class FrameThirteenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FrameThirteenController());
  }
}
