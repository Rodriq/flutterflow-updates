import '/components/my_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  List<String> listOfThings = [];
  void addToListOfThings(String item) => listOfThings.add(item);
  void removeFromListOfThings(String item) => listOfThings.remove(item);
  void removeAtIndexFromListOfThings(int index) => listOfThings.removeAt(index);
  void insertAtIndexInListOfThings(int index, String item) =>
      listOfThings.insert(index, item);
  void updateListOfThingsAtIndex(int index, Function(String) updateFn) =>
      listOfThings[index] = updateFn(listOfThings[index]);

  List<String> original = [];
  void addToOriginal(String item) => original.add(item);
  void removeFromOriginal(String item) => original.remove(item);
  void removeAtIndexFromOriginal(int index) => original.removeAt(index);
  void insertAtIndexInOriginal(int index, String item) =>
      original.insert(index, item);
  void updateOriginalAtIndex(int index, Function(String) updateFn) =>
      original[index] = updateFn(original[index]);

  String text = '';

  String bytee = 'bbbb';

  ///  State fields for stateful widgets in this page.

  // Models for MyComponent dynamic component.
  late FlutterFlowDynamicModels<MyComponentModel> myComponentModels;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for urlF widget.
  FocusNode? urlFFocusNode;
  TextEditingController? urlFTextController;
  String? Function(BuildContext, String?)? urlFTextControllerValidator;
  // Stores action output result for [Custom Action - imageUrlToByte] action in Button widget.
  String? jjjj;

  @override
  void initState(BuildContext context) {
    myComponentModels = FlutterFlowDynamicModels(() => MyComponentModel());
  }

  @override
  void dispose() {
    myComponentModels.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    urlFFocusNode?.dispose();
    urlFTextController?.dispose();
  }
}
