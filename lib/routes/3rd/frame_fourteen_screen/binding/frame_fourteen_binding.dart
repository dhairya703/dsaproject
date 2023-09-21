import '../controller/frame_fourteen_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FrameFourteenScreen.
///
/// This class ensures that the FrameFourteenController is created when the
/// FrameFourteenScreen is first loaded.
class FrameFourteenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FrameFourteenController());
  }
}
