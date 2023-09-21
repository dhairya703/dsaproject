import '../controller/frame_243_controller.dart';
import 'package:get/get.dart';

/// A binding class for the Frame243Screen.
///
/// This class ensures that the Frame243Controller is created when the
/// Frame243Screen is first loaded.
class Frame243Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Frame243Controller());
  }
}
