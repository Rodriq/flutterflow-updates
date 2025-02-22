import '/flutter_flow/flutter_flow_util.dart';
import 'gemini_test_widget.dart' show GeminiTestWidget;
import 'package:flutter/material.dart';

class GeminiTestModel extends FlutterFlowModel<GeminiTestWidget> {
  ///  Local state fields for this page.

  String textResp = ' ';

  String imgResp = ' ';

  String imagePath =
      'https://styles.redditmedia.com/t5_402prw/styles/communityIcon_jvx6bz9e3zha1.png';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for prompt widget.
  FocusNode? promptFocusNode1;
  TextEditingController? promptTextController1;
  String? Function(BuildContext, String?)? promptTextController1Validator;
  // State field(s) for prompt widget.
  FocusNode? promptFocusNode2;
  TextEditingController? promptTextController2;
  String? Function(BuildContext, String?)? promptTextController2Validator;
  // Stores action output result for [Gemini - Generate Text] action in Button widget.
  String? geminiTextResp;
  // Stores action output result for [Gemini - Text From Image] action in Button widget.
  String? geminiImageResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    promptFocusNode1?.dispose();
    promptTextController1?.dispose();

    promptFocusNode2?.dispose();
    promptTextController2?.dispose();
  }
}
