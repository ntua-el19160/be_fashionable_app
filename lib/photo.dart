// import 'dart:ui';

import 'package:flutter/material.dart';
import 'camera.dart';
import 'main.dart';
import 'package:camera/camera.dart';

class PhotoWidget extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const PhotoWidget({this.cameras, Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PhotoWidgetState createState() => _PhotoWidgetState();
}

class _PhotoWidgetState extends State<PhotoWidget> {
  late CameraController controller;
  XFile? pictureFile;

  void _goToMain() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const MyApp()));
  }

  void _goToCamera(XFile photo) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => CameraWidget(image: photo)));
  }

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      widget.cameras![0],
      ResolutionPreset.max,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _takePicture() async {
    final pictureFile = await controller.takePicture();
    _goToCamera(pictureFile);
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 2, 30),
      appBar: AppBar(backgroundColor: Colors.transparent,
          /*title: const Text('Calendar',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          automaticallyImplyLeading: false,*/
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: CircleAvatar(
                    radius: 30.0,
                    backgroundColor: const Color.fromARGB(0xFF, 0x67, 0x50, 0xA4),
                    child: IconButton(
                      onPressed: _goToMain,
                      icon: const Icon(Icons.close),
                      color: Colors.white,
                      tooltip: 'Exit',
                    ))),
          ]),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          /*const SizedBox(width: 200, height: 600),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: _goToCamera,
                  icon: const Icon(Icons.radio_button_on),
                  color: Colors.white,
                  tooltip: 'Take Photo',
                ))
          ])*/
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                child: CameraPreview(controller),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: _takePicture,
                  icon: const Icon(Icons.radio_button_on),
                  color: Colors.white,
                  tooltip: 'Take Photo',
                )
              )
            ]
          )
          /*if (pictureFile != null)
            Image.network(
              pictureFile!.path,
              height: 200,
            )*/
        ],
      ),
    );
  }
}
