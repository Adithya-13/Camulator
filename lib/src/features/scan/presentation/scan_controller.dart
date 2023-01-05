import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:camulator/src/features/domain.dart';
import 'package:camulator/src/features/scan/presentation/scan_state.dart';
import 'package:camulator/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ScanController extends StateNotifier<ScanState> {
  ScanController() : super(const ScanState()) {
    _init();
  }

  final TextRecognizer _textRecognizer =
      TextRecognizer(script: TextRecognitionScript.latin);
  CameraController? cameraController;

  void _init() {
    _initializeCamera();
    getPermissionStatus();
  }

  Future<void> _initializeCamera() async {
    state = state.copyWith(
      cameras: await availableCameras(),
    );
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = this.cameraController;
    // Instantiating the camera controller
    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.yuv420,
      enableAudio: false,
    );

    // Dispose the previous controller
    await previousCameraController?.dispose();

    // Replace with the new controller
    if (mounted) {
      this.cameraController = cameraController;
    }

    // // Update UI if controller updated
    // cameraController.addListener(() {
    //   if (mounted) state = state.copyWith();
    // });

    // Initialize controller
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      dev.log('Error initializing camera: $e');
    }

    // Update the Boolean
    if (mounted) {
      state = state.copyWith(
        isCameraInitialized: cameraController.value.isInitialized,
      );
    }
  }

  getPermissionStatus() async {
    await Permission.camera.request();
    var status = await Permission.camera.status;
    if (status.isGranted) {
      dev.log('Camera Permission: GRANTED');
      state = state.copyWith(
        isCameraPermissionGranted: true,
      );
      // Set and initialize the new camera
      onNewCameraSelected(state.cameras[0]);
    } else {
      dev.log('Camera Permission: DENIED');
    }
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = this.cameraController;
    if (cameraController!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }
    try {
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      dev.log('Error occured while taking picture: $e');
      return null;
    }
  }

  void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
    if (cameraController == null) return;
    final offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );
    cameraController?.setExposurePoint(offset);
    cameraController?.setFocusPoint(offset);
  }

  Future<String?> onTextRecognition() async {
    XFile? rawImage = await takePicture();
    if (rawImage == null) {
      return null;
    }
    final file = File(rawImage.path);
    final croppedFile = await croppingImage(file);

    state = state.copyWith(
      selectedImage: Wrapped.value(croppedFile),
    );
    final inputImage = InputImage.fromFile(croppedFile);
    return processImage(inputImage);
  }

  Future<File> croppingImage(File file) async {
    var bytes = await file.readAsBytes();
    img.Image? src = img.decodeImage(bytes);

    img.Image destImage = img.copyCrop(
      src!,
      state.left.toInt(),
      state.top.toInt(),
      state.width.toInt(),
      state.height.toInt(),
    );

    var jpg = img.encodeJpg(destImage);
    final Directory dir = await getTemporaryDirectory();
    final String path = "${dir.path}/${randomNonceString()}.png";
    return await File(path).writeAsBytes(jpg);
  }

  Future<String> processImage(InputImage inputImage) async {
    final RecognizedText recognizedText =
        await _textRecognizer.processImage(inputImage);

    String text = recognizedText.text;
    for (TextBlock block in recognizedText.blocks) {
      final Rect blockRect = block.boundingBox;
      final List<Point<int>> blockCornerPoints = block.cornerPoints;
      final String blockText = block.text;

      for (TextLine line in block.lines) {
        final Rect lineRect = line.boundingBox;
        final List<Point<int>> lineCornerPoints = line.cornerPoints;
        final String lineText = line.text;
        // Same getters as TextBlock
        for (TextElement element in line.elements) {
          final Rect elementRect = line.boundingBox;
          final List<Point<int>> elementCornerPoints = line.cornerPoints;
          final String elementText = line.text;
          // Same getters as TextBlock
        }
      }
    }
    return text;
  }

  void setSelectedImage(File? image) {
    state = state.copyWith(
      selectedImage: Wrapped.value(image),
    );
  }

  void setSelectedOperator(Operator operator) {
    state = state.copyWith(
      selectedOperator: operator,
    );
  }

  String randomNonceString([int length = 32]) {
    final random = Random();

    final charCodes = List<int>.generate(length, (_) {
      late int codeUnit;

      switch (random.nextInt(3)) {
        case 0:
          codeUnit = random.nextInt(10) + 48;
          break;
        case 1:
          codeUnit = random.nextInt(26) + 65;
          break;
        case 2:
          codeUnit = random.nextInt(26) + 97;
          break;
      }

      return codeUnit;
    });

    return String.fromCharCodes(charCodes);
  }

  void updateViewFinder({
    double? top,
    double? left,
    double? height,
    double? width,
  }) {
    state = state.copyWith(
      top: top,
      left: left,
      height: height,
      width: width,
    );
  }
}

final scanControllerProvider =
    StateNotifierProvider<ScanController, ScanState>((ref) {
  return ScanController();
});
