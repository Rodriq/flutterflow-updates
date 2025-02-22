import '/flutter_flow/flutter_flow_util.dart';
import 'my_component_widget.dart' show MyComponentWidget;
import 'package:flutter/material.dart';

class MyComponentModel extends FlutterFlowModel<MyComponentWidget> {
  ///  Local state fields for this component.

  String var1 = '';

  List<String> fields = [];
  void addToFields(String item) => fields.add(item);
  void removeFromFields(String item) => fields.remove(item);
  void removeAtIndexFromFields(int index) => fields.removeAt(index);
  void insertAtIndexInFields(int index, String item) =>
      fields.insert(index, item);
  void updateFieldsAtIndex(int index, Function(String) updateFn) =>
      fields[index] = updateFn(fields[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
