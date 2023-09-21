import 'package:firestore/routes/lawyer/lawyercredential/controller/lawyer_cred.dart';

import '../controller/usercred.dart';
import 'package:get/get.dart';

/// A binding class for the FrameElevenScreen.
///
/// This class ensures that the FrameElevenController is created when the
/// FrameElevenScreen is first loaded.
class userBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => usercred());
  }
}
