import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;

class ScanController extends GetxController {
  final RxBool _isInitialized = RxBool(false);
  late CameraController _cameraController;

  late List<CameraDescription> _cameras;
  late CameraImage _cameraImage;

  bool get isInitialized => _isInitialized.value;
  CameraController get cameraController => _cameraController;

  Future<void> _initCamera() async {
    try {
      _cameras = await availableCameras();
      _cameraController = CameraController(_cameras[0], ResolutionPreset.high);

      _cameraController.initialize().then((_) {
        _isInitialized.value = true;
        _cameraController.startImageStream((image) => _cameraImage = image);
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              // Handle access errors here.
              break;
            default:
              // Handle other errors here.
              break;
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    _initCamera();
    super.onInit();
  }

  void capture() {
    try {
      Uint8List cameraBytes = _cameraImage.planes[0].bytes;
      ByteBuffer byteBuffer = cameraBytes.buffer;

      img.Image image = img.Image.fromBytes(
          width: _cameraImage.width,
          height: _cameraImage.height,
          bytes: byteBuffer,
          format: img.Format.uint8);

      int desiredWidth = 800; // Adjust the width as needed
      int desiredHeight = (desiredWidth * image.height ~/ image.width);
      img.Image resizedImage =
          img.copyResize(image, width: desiredWidth, height: desiredHeight);

      // Uint8List jpeg = Uint8List.fromList(img.encodeJpg(image));
      Uint8List jpeg = img.encodeJpg(resizedImage);
      print(jpeg);
    } catch (e) {
      print(e);
    }
  }
}
