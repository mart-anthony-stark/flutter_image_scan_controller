import 'package:cat_dog_classifier_flutter/camera/camera_viewer.dart';
import 'package:cat_dog_classifier_flutter/camera/capture_button.dart';
import 'package:cat_dog_classifier_flutter/scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CameraScreen extends GetView<ScanController> {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [const CameraViewer(), CaptureButton()],
    );
  }
}
