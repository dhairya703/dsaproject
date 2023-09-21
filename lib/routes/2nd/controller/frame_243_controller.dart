import 'package:firestore/core/app_export.dart';

import '../models/frame_243_model.dart';

/// A controller class for the Frame243Screen.
///
/// This class manages the state of the Frame243Screen, including the
/// current frame243ModelObj
class Frame243Controller extends GetxController {
  Rx<Frame243Model> frame243ModelObj = Frame243Model().obs;
}
