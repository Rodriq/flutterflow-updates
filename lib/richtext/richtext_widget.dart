import '/flutter_flow/flutter_flow_util.dart';
import 'package:rich_text_editor_library_lxfwn9/app_state.dart'
    as rich_text_editor_library_lxfwn9_app_state;
import 'package:rich_text_editor_library_lxfwn9/custom_code/widgets/index.dart'
    as rich_text_editor_library_lxfwn9_custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'richtext_model.dart';
export 'richtext_model.dart';

class RichtextWidget extends StatefulWidget {
  const RichtextWidget({super.key});

  static String routeName = 'Richtext';
  static String routePath = '/richtext';

  @override
  State<RichtextWidget> createState() => _RichtextWidgetState();
}

class _RichtextWidgetState extends State<RichtextWidget> {
  late RichtextModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RichtextModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<rich_text_editor_library_lxfwn9_app_state.FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Rich Text',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: rich_text_editor_library_lxfwn9_custom_widgets
                          .RichTextEditor(
                        width: double.infinity,
                        height: double.infinity,
                        darkMode: false,
                        spellCheck: true,
                        hint: 'Type here',
                        getEditorContent: (editorText) async {
                          rich_text_editor_library_lxfwn9_app_state.FFAppState()
                              .HTMLMessage = editorText!;
                          safeSetState(() {});
                        },
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rich_text_editor_library_lxfwn9_app_state.FFAppState()
                              .HTMLMessage,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
