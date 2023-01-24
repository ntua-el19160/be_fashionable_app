// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'profile.dart';
import 'main.dart';
import 'calendar.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  void _goToProfile() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ProfileWidget()));
  }

  void _goToMain() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const MyApp()));
  }

  void _goToCalendar() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const CalendarWidget()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 2, 30),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Camera',
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
              ))),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 500, width: 200),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 80),
                child: FloatingActionButton.extended(
                  // ignore: prefer_const_constructors
                  label: Text('Add Location',
                      // ignore: prefer_const_constructors
                      style: TextStyle(color: Colors.black)),
                  backgroundColor: Colors.grey,
                  icon: const Icon(
                    color: Colors.black,
                    Icons.add_location,
                    size: 24.0,
                  ),
                  onPressed: () {},
                ),
              )
            ]),
            const Padding(
                padding: EdgeInsets.only(left: 80),
                child: Text('Add Tags',
                    style: TextStyle(color: Colors.white, fontSize: 28))),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          elevation: 2,
                          backgroundColor: Colors.grey),
                      child: const Text(
                        'Work',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          elevation: 2,
                          backgroundColor: Colors.grey),
                      child: const Text(
                        'Gym',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          elevation: 2,
                          backgroundColor: Colors.grey),
                      child: const Text(
                        'College',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          elevation: 2,
                          backgroundColor: Colors.grey),
                      child: const Text(
                        'Walk',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          elevation: 2,
                          backgroundColor: Colors.grey),
                      child: const Text(
                        'Night Out',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          elevation: 2,
                          backgroundColor: Colors.grey),
                      child: const Text(
                        'Shopping',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          elevation: 2,
                          backgroundColor: Colors.grey),
                      child: const Text(
                        'School',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          elevation: 2,
                          backgroundColor: Colors.grey),
                      child: const Text(
                        'Skirt',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          elevation: 2,
                          backgroundColor: Colors.grey),
                      child: const Text(
                        'Shirt',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          elevation: 2,
                          backgroundColor: Colors.grey),
                      child: const Text(
                        'Jeans',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          elevation: 2,
                          backgroundColor: Colors.grey),
                      child: const Text(
                        'Hoodie',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          elevation: 2,
                          backgroundColor: Colors.grey),
                      child: const Text(
                        'Leggings',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          elevation: 2,
                          backgroundColor: Colors.grey),
                      child: const Text(
                        'Dress',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          elevation: 2,
                          backgroundColor: Colors.grey),
                      child: const Text(
                        'Trousers',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.purple,
                        child: IconButton(
                          tooltip: 'Save Photo',
                          icon: const Icon(color: Colors.white, Icons.check),
                          onPressed: _goToCalendar,
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
