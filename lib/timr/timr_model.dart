import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'timr_widget.dart' show TimrWidget;
import 'package:flutter/material.dart';

class TimrModel extends FlutterFlowModel<TimrWidget> {
  ///  Local state fields for this page.

  List<String> multiItem = [];
  void addToMultiItem(String item) => multiItem.add(item);
  void removeFromMultiItem(String item) => multiItem.remove(item);
  void removeAtIndexFromMultiItem(int index) => multiItem.removeAt(index);
  void insertAtIndexInMultiItem(int index, String item) =>
      multiItem.insert(index, item);
  void updateMultiItemAtIndex(int index, Function(String) updateFn) =>
      multiItem[index] = updateFn(multiItem[index]);

  List<FullNameStruct> names = [];
  void addToNames(FullNameStruct item) => names.add(item);
  void removeFromNames(FullNameStruct item) => names.remove(item);
  void removeAtIndexFromNames(int index) => names.removeAt(index);
  void insertAtIndexInNames(int index, FullNameStruct item) =>
      names.insert(index, item);
  void updateNamesAtIndex(int index, Function(FullNameStruct) updateFn) =>
      names[index] = updateFn(names[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    minute: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for DropDown widget.
  List<String>? dropDownValue1;
  FormFieldController<List<String>>? dropDownValueController1;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue2;
  FormFieldController<List<String>>? dropDownValueController2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    timerController.dispose();
  }
}
