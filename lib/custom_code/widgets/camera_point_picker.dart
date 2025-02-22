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

// // Automatic FlutterFlow imports
// import '/backend/schema/structs/index.dart';
// import '/backend/schema/enums/enums.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/custom_code/widgets/index.dart'; // Imports other custom widgets
// import '/custom_code/actions/index.dart'; // Imports custom actions
// import '/flutter_flow/custom_functions.dart'; // Imports custom functions
// import 'package:flutter/material.dart';
// // Begin custom widget code
// // DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import 'dart:io';

// import 'package:flutter/rendering.dart';

// import 'index.dart'; // Imports other custom widgets

// import 'package:image_picker/image_picker.dart';
// import 'dart:ui' as ui;
// import 'dart:typed_data';
// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as path;

// class CameraPointPicker extends StatefulWidget {
//   const CameraPointPicker({
//     super.key,
//     this.width,
//     this.height,
//     this.markedPoints,
//   });

//   final double? width;
//   final double? height;
//   final Future Function(List<int>? markers, FFUploadedFile? imageBytes)?
//       markedPoints;

//   @override
//   State<CameraPointPicker> createState() => _CameraPointPickerState();
// }

// class _Marker {
//   int id;
//   Offset position;

//   _Marker({required this.id, required this.position});
// }

// class _CameraPointPickerState extends State<CameraPointPicker> {
//   File? _imageFile;
//   Size _originalImageSize = Size.zero;
//   final List<_Marker> _markers = [];
//   int _currentId = 1;
//   final GlobalKey _repaintKey = GlobalKey();

//   Future<void> _takePicture() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.camera);
//     if (pickedFile != null) {
//       final imageFile = File(pickedFile.path);
//       final bytes = await imageFile.readAsBytes();
//       final image = await decodeImageFromList(bytes);
//       setState(() {
//         _imageFile = imageFile;
//         _originalImageSize =
//             Size(image.width.toDouble(), image.height.toDouble());
//         _markers.clear();
//         _currentId = 1;
//       });
//     }
//   }

//   void _addMarker(Offset position) {
//     setState(() {
//       _markers.add(_Marker(id: _currentId, position: position));
//       _currentId++;
//     });
//     _captureAndNotify();
//   }

//   void _removeMarker(int id) {
//     setState(() {
//       _markers.removeWhere((marker) => marker.id == id);
//     });
//     _captureAndNotify();
//   }

//   void _updateMarkerPosition(int id, Offset newPosition) {
//     setState(() {
//       final index = _markers.indexWhere((marker) => marker.id == id);
//       if (index != -1) {
//         _markers[index].position = newPosition;
//       }
//     });
//     _captureAndNotify();
//   }

//   Future<void> _captureAndNotify() async {
//     if (_repaintKey.currentContext == null) return;

//     final boundary =
//         _repaintKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
//     final image = await boundary.toImage();
//     final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//     final bytes = byteData!.buffer.asUint8List();

//     final uploadedFile = FFUploadedFile(
//       name: 'annotated_${DateTime.now().millisecondsSinceEpoch}.png',
//       bytes: bytes,
//     );

//     final markerIds = _markers.map((m) => m.id).toList();
//     if (widget.markedPoints != null) {
//       widget.markedPoints!(markerIds, uploadedFile);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: widget.width,
//       height: widget.height,
//       child: _imageFile == null
//           ? Center(
//               child: FloatingActionButton(
//                 onPressed: _takePicture,
//                 child: const Icon(Icons.camera_alt),
//               ),
//             )
//           : RepaintBoundary(
//               key: _repaintKey,
//               child: LayoutBuilder(
//                 builder: (context, constraints) {
//                   final imageSize = _originalImageSize;
//                   final fittedSizes = applyBoxFit(
//                     BoxFit.contain,
//                     imageSize,
//                     constraints.biggest,
//                   );
//                   final fittedSize = fittedSizes.destination;
//                   final imageRect = Alignment.center.inscribe(
//                     fittedSize,
//                     Offset.zero & constraints.biggest,
//                   );

//                   return GestureDetector(
//                     onTapDown: (details) {
//                       final localPosition = details.localPosition;
//                       if (imageRect.contains(localPosition)) {
//                         final dx = (localPosition.dx - imageRect.left) *
//                             (imageSize.width / fittedSize.width);
//                         final dy = (localPosition.dy - imageRect.top) *
//                             (imageSize.height / fittedSize.height);
//                         _addMarker(Offset(dx, dy));
//                       }
//                     },
//                     child: Stack(
//                       children: [
//                         Center(
//                           child: Image.file(
//                             _imageFile!,
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                         ..._markers.map((marker) {
//                           final x = (marker.position.dx / imageSize.width) *
//                                   fittedSize.width +
//                               imageRect.left;
//                           final y = (marker.position.dy / imageSize.height) *
//                                   fittedSize.height +
//                               imageRect.top;

//                           return Positioned(
//                             left: x - 20,
//                             top: y - 20,
//                             child: GestureDetector(
//                               onLongPress: () => _removeMarker(marker.id),
//                               onPanUpdate: (details) {
//                                 final imageDeltaX = details.delta.dx *
//                                     (imageSize.width / fittedSize.width);
//                                 final imageDeltaY = details.delta.dy *
//                                     (imageSize.height / fittedSize.height);
//                                 final newPosition = marker.position +
//                                     Offset(imageDeltaX, imageDeltaY);
//                                 final clampedPosition = Offset(
//                                   newPosition.dx.clamp(0, imageSize.width),
//                                   newPosition.dy.clamp(0, imageSize.height),
//                                 );
//                                 _updateMarkerPosition(
//                                     marker.id, clampedPosition);
//                               },
//                               child: Container(
//                                 width: 40,
//                                 height: 40,
//                                 decoration: const BoxDecoration(
//                                   color: Colors.red,
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     marker.id.toString(),
//                                     style: const TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//     );
//   }
// }

import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'dart:typed_data';

class CameraPointPicker extends StatefulWidget {
  const CameraPointPicker({
    super.key,
    this.width,
    this.height,
    this.onDataCaptured,
  });

  final double? width;
  final double? height;
  final Future Function(List<int>? markers, FFUploadedFile? imageBytes)?
      onDataCaptured;

  @override
  State<CameraPointPicker> createState() => _CameraPointPickerState();
}

class _CameraPointPickerState extends State<CameraPointPicker> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  List<Marker> _markers = [];
  int _counter = 1;
  final GlobalKey _globalKey = GlobalKey();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = image;
        _markers.clear();
        _counter = 1;
      });
    }
  }

  void _addMarker(TapUpDetails details) {
    setState(() {
      _markers.add(Marker(id: _counter, offset: details.localPosition));
      _counter++;
    });
    _sendData();
  }

  void _removeMarker(int id) {
    setState(() {
      _markers.removeWhere((marker) => marker.id == id);
    });
    _sendData();
  }

  Future<void> _captureImage() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    _sendData(imageBytes: FFUploadedFile(bytes: pngBytes));
  }

  void _sendData({FFUploadedFile? imageBytes}) {
    widget.onDataCaptured?.call(
      _markers.map((m) => m.id).toList(),
      imageBytes,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _pickImage,
          child: Text('Open Camera'),
        ),
        ElevatedButton(
          onPressed: _captureImage,
          child: Text('Save Annotated Image'),
        ),
        Expanded(
          child: GestureDetector(
            onTapUp: _addMarker,
            child: RepaintBoundary(
              key: _globalKey,
              child: Container(
                width: widget.width ?? double.infinity,
                height: widget.height ?? double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  image: _image != null
                      ? DecorationImage(
                          image: FileImage(File(_image!.path)),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: Stack(
                  children: _markers.map((marker) {
                    return Positioned(
                      left: marker.offset.dx,
                      top: marker.offset.dy,
                      child: GestureDetector(
                        onLongPress: () => _removeMarker(marker.id),
                        onPanUpdate: (details) {
                          setState(() {
                            marker.offset = Offset(
                              marker.offset.dx + details.delta.dx,
                              marker.offset.dy + details.delta.dy,
                            );
                          });
                        },
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.red,
                          child: Text(
                            marker.id.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Marker {
  int id;
  Offset offset;

  Marker({required this.id, required this.offset});
}
