import '../controller/frame_244_controller.dart';
import 'package:get/get.dart';

/// A binding class for the Frame244Screen.
///
/// This class ensures that the Frame244Controller is created when the
/// Frame244Screen is first loaded.
class Frame244Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Frame244Controller());
  }
}
