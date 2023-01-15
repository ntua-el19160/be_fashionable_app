import 'package:flutter/material.dart';
import 'camera.dart';
import 'main.dart';

class PhotoWidget extends StatefulWidget {
  const PhotoWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PhotoWidgetState createState() => _PhotoWidgetState();
}

class _PhotoWidgetState extends State<PhotoWidget> {
  void _goToMain() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const MyApp()));
  }

  void _goToCamera() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const CameraWidget()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 2, 30),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Calendar',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.purple,
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
          const SizedBox(width: 200, height: 600),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: _goToCamera,
                  icon: const Icon(Icons.radio_button_on),
                  color: Colors.white,
                  tooltip: 'Take Photo',
                ))
          ])
        ],
      ),
    );
  }
}
