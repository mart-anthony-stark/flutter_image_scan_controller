import 'package:get/instance_manager.dart';
import 'package:cat_dog_classifier_flutter/scan_controller.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanController>(() => ScanController());
  }
}
