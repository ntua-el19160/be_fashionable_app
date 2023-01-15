import 'package:flutter/material.dart';
import 'profile.dart';
import 'main.dart';
import 'photo.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  void _goToProfile() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ProfileWidget()));
  }

  void _goToMain() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const MyApp()));
  }

  void _goToPhoto() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PhotoWidget()));
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
            leading: CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.purple,
                child: IconButton(
                  onPressed: _goToMain,
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  tooltip: 'Back',
                )),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: IconButton(
                    // Θέλουμε να εμφανίζεται το Info Overlay στο κάτω μέρος
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                    tooltip: 'Filter',
                  )),
            ]),
        bottomNavigationBar: BottomAppBar(
            color: const Color.fromARGB(255, 5, 0, 17),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.purple,
                      child: IconButton(
                        tooltip: 'Calendar',
                        icon: const Icon(color: Colors.white, Icons.today),
                        onPressed: () {},
                      ))),
              Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.purple,
                      child: IconButton(
                        tooltip: 'Profile',
                        icon: const Icon(
                            color: Colors.white, Icons.person_outline),
                        onPressed: _goToProfile,
                      ))),
              CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.purple,
                  child: IconButton(
                    tooltip: 'Camera',
                    icon: const Icon(
                        color: Colors.white, Icons.camera_alt_outlined),
                    onPressed: _goToPhoto,
                  )),
            ])));
  }
}
