import 'package:camera/camera.dart';
import 'package:cat_dog_classifier_flutter/scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CameraViewer extends GetView<ScanController> {
  const CameraViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ScanController>(
      builder: (controller) {
        if (!controller.isInitialized) {
          return Container();
        }
        return SizedBox(
          height: Get.height,
          width: Get.width,
          child: CameraPreview(controller.cameraController),
        );
      },
    );
  }
}
