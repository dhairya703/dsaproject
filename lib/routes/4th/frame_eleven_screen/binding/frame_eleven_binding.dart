import '../controller/frame_eleven_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FrameElevenScreen.
///
/// This class ensures that the FrameElevenController is created when the
/// FrameElevenScreen is first loaded.
class FrameElevenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FrameElevenController());
  }
}
