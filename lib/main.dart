import 'package:cat_dog_classifier_flutter/camera/camera_screen.dart';
import 'package:cat_dog_classifier_flutter/global_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Camera App",
      initialBinding: GlobalBindings(),
      home: const CameraScreen(),
    );

    // return MaterialApp(
    //   home: Scaffold(
    //       appBar: AppBar(
    //         title: const Text("Image Classifier"),
    //       ),
    //       body: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.stretch,
    //         children: <Widget>[
    //           Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 20),
    //             child: ElevatedButton(
    //                 onPressed: () {},
    //                 child: const Text(
    //                   "Open Camera",
    //                   style: TextStyle(fontSize: 16),
    //                 )),
    //           ),
    //           const SizedBox(
    //             height: 10,
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 20),
    //             child: ElevatedButton(
    //                 onPressed: () {},
    //                 child: const Text(
    //                   "Pick From Gallery",
    //                   style: TextStyle(fontSize: 16),
    //                 )),
    //           ),
    //         ],
    //       )),
    // );
  }
}
