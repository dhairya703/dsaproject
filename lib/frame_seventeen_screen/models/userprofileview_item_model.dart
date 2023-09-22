import '../../../core/app_export.dart';

/// This class is used in the [userprofileview_item_widget] screen.
class UserprofileviewItemModel {
  UserprofileviewItemModel({
    this.userText,
    this.id,
  }) {
    userText =
        userText ?? Rx("Ask Lily? \nAbout your services & other Information  ");
    id = id ?? Rx("");
  }

  Rx<String>? userText;

  Rx<String>? id;
}
