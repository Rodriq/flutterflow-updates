// Automatic FlutterFlow imports
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'package:html_editor_enhanced/html_editor.dart';

class RichTextEditor extends StatefulWidget {
  const RichTextEditor({
    super.key,
    this.width,
    this.height,
    this.darkMode,
    this.spellCheck,
    this.dropdownBackgroundColor,
    this.dropdownButtonColor,
    this.dropdownTextColor,
    this.editorBackgroundColor,
    this.editorTextColor,
    this.hint,
    this.initialText,
    this.getEditorContent,
  });

  final double? width;
  final double? height;
  final bool? darkMode;
  final bool? spellCheck;
  final Color? dropdownBackgroundColor;
  final Color? dropdownButtonColor;
  final Color? dropdownTextColor;
  final Color? editorBackgroundColor;
  final Color? editorTextColor;
  final String? hint;
  final String? initialText;
  final Future Function(String? editorText)? getEditorContent;

  @override
  State<RichTextEditor> createState() => _RichTextEditorState();
}

class _RichTextEditorState extends State<RichTextEditor> {
  late HtmlEditorController controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    controller = HtmlEditorController(processNewLineAsBr: true);
    WidgetsBinding.instance.addPostFrameCallback((_) => _setInitialContent());
  }

  @override
  void didUpdateWidget(covariant RichTextEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialText != widget.initialText && _isInitialized) {
      controller.setText(widget.initialText ?? "");
    }
  }

  void _setInitialContent() async {
    controller.setText(widget.initialText ?? "");
    _isInitialized = true;
  }

  String _colorToHex(Color? color) => color != null
      ? '#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}'
      : 'inherit';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: HtmlEditor(
        controller: controller,
        htmlEditorOptions: HtmlEditorOptions(
          hint: widget.hint ?? "Type here...",
          darkMode: widget.darkMode ?? false,
          spellCheck: widget.spellCheck ?? true,
          webInitialScripts: kIsWeb
              ? UnmodifiableListView([
                  WebScript(name: 'themeSetup', script: """
              document.querySelector('.note-editable').style.color = '${_colorToHex(widget.editorTextColor)}';
              document.querySelector('.note-editable').style.background = '${_colorToHex(widget.editorBackgroundColor)}';
            """),
                ])
              : null,
        ),
        callbacks: Callbacks(
          onChangeContent: (String? html) => widget.getEditorContent!(html),
          onInit: () async {
            if (kIsWeb) controller.evaluateJavascriptWeb('themeSetup');
            // Ensure content is set after full initialization
            await Future.delayed(Duration(milliseconds: 100));
            controller.setText(widget.initialText ?? "");
          },
        ),
        htmlToolbarOptions: HtmlToolbarOptions(
          textStyle: TextStyle(
            color: widget.dropdownTextColor ?? Colors.black,
          ),
          buttonColor: widget.dropdownButtonColor ?? Colors.black,
          dropdownBackgroundColor:
              widget.dropdownBackgroundColor ?? Colors.white,
          toolbarType: ToolbarType.nativeGrid,
        ),
      ),
    );
  }
}
