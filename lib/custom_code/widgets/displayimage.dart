// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class Displayimage extends StatefulWidget {
  const Displayimage({
    Key? key,
    this.width,
    this.height,
    required this.imagePath,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? imagePath;

  @override
  State<Displayimage> createState() => _DisplayimageState();
}

class _DisplayimageState extends State<Displayimage> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.imagePath!,
      width: widget.width,
      height: widget.height,
    );
  }
}
