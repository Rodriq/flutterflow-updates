// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'dart:html' as html;

Future<String> imageUrlToByte(String imageURL) async {
  // Add your function code here!
  // try {
  //   final response = await http.get(Uri.parse(imageURL));
  //   if (response.statusCode == 200) {
  //     Uint8List bytes = response.bodyBytes;
  //     String base64String = base64Encode(bytes);
  //     return base64String;
  //   } else {
  //     throw Exception('Failed to load image');
  //   }
  // } catch (e) {
  //   print('Error converting image to Base64: $e');
  //   return '';
  // }

  // http.Response response = await http.get(imageURL);
  // final bytes = response?.bodyBytes;
  // return (bytes != null ? base64Encode(bytes) : "");

  // try {
  //   final response = await http.get(Uri.parse(imageURL));
  //   if (response.statusCode == 200) {
  //     Uint8List bytes = response.bodyBytes;
  //     return base64Encode(bytes);
  //   } else {
  //     throw Exception(
  //         'Failed to load image, Status Code: ${response.statusCode}');
  //   }
  // } catch (e) {
  //   print('Error converting image to Base64: $e');
  //   return '';
  // }

  try {
    String proxyUrl =
        "https://cors-anywhere.herokuapp.com/$imageURL"; // Use a proxy
    final blob = await html.HttpRequest.request(proxyUrl, responseType: "blob");
    final reader = html.FileReader();
    reader.readAsDataUrl(blob.response);
    await reader.onLoad.first;
    return reader.result.toString().split(",")[1]; // Extract Base64 part
  } catch (e) {
    print('Error converting image to Base64 on web: $e');
    return '';
  }
}
