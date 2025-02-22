import '/components/my_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dropdowns_checkboc_widget.dart' show DropdownsCheckbocWidget;
import 'package:flutter/material.dart';

class DropdownsCheckbocModel extends FlutterFlowModel<DropdownsCheckbocWidget> {
  ///  Local state fields for this page.

  int? index = 0;

  List<FFUploadedFile> uploadedImages = [];
  void addToUploadedImages(FFUploadedFile item) => uploadedImages.add(item);
  void removeFromUploadedImages(FFUploadedFile item) =>
      uploadedImages.remove(item);
  void removeAtIndexFromUploadedImages(int index) =>
      uploadedImages.removeAt(index);
  void insertAtIndexInUploadedImages(int index, FFUploadedFile item) =>
      uploadedImages.insert(index, item);
  void updateUploadedImagesAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      uploadedImages[index] = updateFn(uploadedImages[index]);

  String item = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  bool isDataUploading1 = false;
  List<FFUploadedFile> uploadedLocalFiles1 = [];

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for MyComponent component.
  late MyComponentModel myComponentModel;

  @override
  void initState(BuildContext context) {
    myComponentModel = createModel(context, () => MyComponentModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();
    myComponentModel.dispose();
  }
}
