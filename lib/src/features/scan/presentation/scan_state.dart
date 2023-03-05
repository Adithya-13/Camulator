// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:camera/camera.dart';

import 'package:camulator/src/features/domain.dart';
import 'package:camulator/src/utils/utils.dart';

class ScanState {
  final List<CameraDescription> cameras;
  final bool isCameraInitialized;
  final bool isCameraPermissionGranted;
  final File? selectedImage;
  final double top;
  final double left;
  final double right;
  final double bottom;
  final double height;
  final double width;
  final Operator selectedOperator;

  const ScanState({
    this.cameras = const [],
    this.isCameraInitialized = false,
    this.isCameraPermissionGranted = false,
    this.selectedImage,
    this.top = 0,
    this.left = 0,
    this.right = 0,
    this.bottom = 0,
    this.height = 120,
    this.width = 120,
    this.selectedOperator = Operator.division,
  });

  ScanState copyWith({
    List<CameraDescription>? cameras,
    bool? isCameraInitialized,
    bool? isCameraPermissionGranted,
    Wrapped<File?>? selectedImage,
    double? top,
    double? left,
    double? height,
    double? width,
    Operator? selectedOperator,
  }) {
    return ScanState(
      cameras: cameras ?? this.cameras,
      isCameraInitialized: isCameraInitialized ?? this.isCameraInitialized,
      isCameraPermissionGranted:
          isCameraPermissionGranted ?? this.isCameraPermissionGranted,
      selectedImage:
          selectedImage != null ? selectedImage.value : this.selectedImage,
      top: top ?? this.top,
      left: left ?? this.left,
      height: height ?? this.height,
      width: width ?? this.width,
      selectedOperator: selectedOperator ?? this.selectedOperator,
    );
  }
}
