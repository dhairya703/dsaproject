import 'package:firestore/routes/lawyer/lawyercredential/controller/lawyer_cred.dart';

import '../controller/lawyer_cred.dart';
import 'package:get/get.dart';

/// A binding class for the FrameElevenScreen.
///
/// This class ensures that the FrameElevenController is created when the
/// FrameElevenScreen is first loaded.
class LawyerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Lawyercred());
  }
}
