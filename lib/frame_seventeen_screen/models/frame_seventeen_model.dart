import '../../../core/app_export.dart';
import 'userprofileview_item_model.dart';

/// This class defines the variables used in the [frame_seventeen_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FrameSeventeenModel {
  Rx<List<UserprofileviewItemModel>> userprofileviewItemList =
      Rx(List.generate(2, (index) => UserprofileviewItemModel()));
}
