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

import 'dart:io';

import 'package:ed_dicom_viewer/ed_dicom_viewer.dart';
import 'package:file_selector/file_selector.dart';
import 'package:path_provider/path_provider.dart';

class DiComPickerAndViewer extends StatefulWidget {
  const DiComPickerAndViewer({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<DiComPickerAndViewer> createState() => _DiComPickerAndViewerState();
}

class _DiComPickerAndViewerState extends State<DiComPickerAndViewer> {
  final _dicomViewerPlugin = EdDicomViewer();
  final typeGroup = const XTypeGroup(
      label: 'dicom',
      extensions: <String>['dcm'],
      uniformTypeIdentifiers: ['public.item']);
  Uint8List? decodedData;
  EdDicomModel? dicomModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              final XFile? file =
                  await openFile(acceptedTypeGroups: <XTypeGroup>[typeGroup]);
              if (file != null) {
                final Directory tempDir = await getTemporaryDirectory();
                var newFile = File('${tempDir.path}/temp.dcm')
                  ..writeAsBytesSync(await file.readAsBytes());

                _dicomViewerPlugin.getViewDicom(newFile.path).then((value) {
                  dicomModel = EdDicomModel.fromJson(jsonDecode(value));
                  setState(() {
                    decodedData = Uint8List.fromList(dicomModel!.decodedBytes);
                  });
                });
              }
            },
            child: const Text("Select DICOM File"),
          ),
          if (decodedData != null) ...[
            SizedBox(
              width: 300,
              height: 300,
              child: Image.memory(decodedData!),
            ),
            Text("Patient Name: ${dicomModel?.patientName ?? 'N/A'}"),
            Text("Patient Age: ${dicomModel?.patientAge ?? 'N/A'}"),
            Text("Patient Gender: ${dicomModel?.patientGender ?? 'N/A'}"),
          ] else ...[
            const Text("No DICOM file selected."),
          ],
        ],
      ),
    );
  }
}
