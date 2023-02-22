// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
//import 'profile.dart';
import 'achievement.dart';
import 'main.dart';
import 'calendar.dart';
import 'dart:math';
import 'daydetails.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  /*void _goToProfile() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ProfileWidget()));
  }*/

  String locationMessage = 'Add Location';
  late String lat;
  late String long;

  void _goToMain() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition();
  }

  void _goToCalendar() {
    var rng = Random().nextInt(100);
    if (rng % 3 == 0) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AchievementWidget()));
    } else {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const CalendarWidget()));
    }
  }

  void _liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();

      setState(() {
        locationMessage = 'Latitude: $lat , Longitude: $long';
      });
    });
  }

  Future<void> _openMap(String lat, String long) async {
    String googleURL =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';

    await canLaunchUrlString(googleURL)
        ? await launchUrlString(googleURL)
        : throw 'Could not launch $googleURL';
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
                padding: const EdgeInsets.only(left: 40),
                child: FloatingActionButton.extended(
                  // ignore: prefer_const_constructors
                  label: Text(locationMessage,
                      // ignore: prefer_const_constructors
                      style: TextStyle(color: Colors.black)),
                  backgroundColor: Colors.grey,
                  icon: const Icon(
                    color: Colors.black,
                    Icons.add_location,
                    size: 24.0,
                  ),
                  onPressed: () {
                    _getCurrentLocation().then((value) {
                      lat = '${value.latitude}';
                      long = '${value.longitude}';
                      setState(() {
                        locationMessage = 'Latitude: $lat , Longitude: $long';
                      });
                      _liveLocation();
                      _openMap(lat, long);
                    });
                  },
                ),
              )
            ]),
            const SizedBox(height: 20),
            const Padding(
                padding: EdgeInsets.only(left: 80),
                child: Text('Add Tags',
                    style: TextStyle(color: Colors.white, fontSize: 28))),
            const SizedBox(height: 20),
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
                            onPressed: () {
                              final details = DateDetails(
                                date: DateTime.now(),
                                completed: true,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CalendarWidget(),
                                  settings: RouteSettings(arguments: details),
                                ),
                              );
                            }))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
