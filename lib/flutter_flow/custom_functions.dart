import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

String? uploadToText(FFUploadedFile? lkn) {
  // convert upload file byte to string
  if (lkn == null) {
    return null;
  }
  return utf8.decode(lkn.bytes as List<int>);
}

FFUploadedFile? stringToFileType(String? fileString) {
  // convert base64 string to uploaded file type
  if (fileString == null) {
    return null;
  }
  final bytes = base64.decode(fileString);
  return FFUploadedFile(
    name: 'file',
    bytes: bytes,
  );
}

List<String> convertEnum(List<UserType>? enumValues) {
  // return as list of string
  if (enumValues == null) {
    return [];
  }
  return enumValues.map((e) => e.serialize()).toList();
}
