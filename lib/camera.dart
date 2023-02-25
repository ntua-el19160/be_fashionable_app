// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'profile.dart';
import 'achievement.dart';
import 'main.dart';
import 'calendar.dart';
// import 'dart:math';
import 'daydetails.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:io';

class CameraWidget extends StatefulWidget {
  const CameraWidget({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final imagePath;

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

  void _goToNext() {
    // list of the tags that has been selected
    // false --> selected, true --> not selected

    // List.generate creates a new list of the same length as _clicks
    // Then we use .where to filter out the -1 values, which corresponds to 'true' values of _clicks
    // .toList method is used to convert the iterable to a list
    // 'selectedTags' list contains the positions of the 'false' booleans from _clicks
    List<int> selectedTags = List.generate(_clicks.length, (index) {
      if (_clicks[index] == false) {
        return index;
      }
      return -1;
    }).where((value) => value != -1).toList();
    final details = DateDetails(
      date: DateTime.now(),
      completed: true,
      tags: selectedTags,
      imagePath: widget.imagePath
    );
    //var rng = Random().nextInt(100);
    var rng = 3;
    if (rng % 3 == 0) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const AchievementWidget(),
        settings: RouteSettings(arguments: details),
      ));
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const CalendarWidget(routeName: 'camera'),
          settings: RouteSettings(arguments: details),
        ),
      );
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
        locationMessage = 'Lat: $lat , Long: $long';
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

// List of booleans with 18 elements that are all "true" 
final List<bool> _clicks = List.generate(18, (index) => true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1B1F),
      appBar: AppBar(
          backgroundColor: const Color(0xFF1C1B1F),
          title: const Text('Camera',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: CircleAvatar(
              radius: 30.0,
              backgroundColor: const Color.fromARGB(0xFF, 0x67, 0x50, 0xA4),
              child: IconButton(
                onPressed: _goToMain,
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                tooltip: 'Back',
              ))),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.file(
              File(widget.imagePath),
              height: MediaQuery.of(context).size.height * 0.45,
              width:MediaQuery.of(context).size.width * 0.9
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start, 
              children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: FloatingActionButton.extended(
                  // ignore: prefer_const_constructors
                  label: Text(locationMessage,
                      // ignore: prefer_const_constructors
                      style: const TextStyle(color: Color.fromARGB(0xFF, 0x38, 0x1E, 0x72))),
                  backgroundColor: const Color.fromARGB(0xFF, 0xD0, 0xBC, 0xFF),
                  icon: const Icon(
                    color: Color.fromARGB(0xFF, 0x38, 0x1E, 0x72),
                    Icons.add_location,
                    size: 24.0,
                  ),
                  onPressed: () {
                    _getCurrentLocation().then((value) {
                      lat = '${value.latitude}';
                      long = '${value.longitude}';
                      setState(() {
                        locationMessage = 'Lat: $lat , Long: $long';
                      });
                      _liveLocation();
                      // _openMap(lat, long);
                    });
                  },
                ),
              )
            ]),
            const SizedBox(height: 30),
            Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('Add Tags',
                    //textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.white, fontSize: 28)
                    )
                  ),
                )
              ]
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 60),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _clicks[0] = !_clicks[0];
                        });
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xFF938F99)),
                          ),
                          foregroundColor: const Color(0xFFE6E1E5),
                          backgroundColor: (_clicks[0] == false) ? const Color(0xFFB0A7C0) : const Color(0xFF1C1B1F),
                      ),
                      child: const Text(
                        'Occasion',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _clicks[1] = !_clicks[1];
                        });
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xFF938F99)),
                          ),
                          foregroundColor: const Color(0xFFE6E1E5),
                          backgroundColor: (_clicks[1] == false) ? const Color(0xFFB0A7C0) : const Color(0xFF1C1B1F),
                      ),
                      child: const Text(
                        'Work',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _clicks[2] = !_clicks[2];
                        });
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xFF938F99)),
                          ),
                          foregroundColor: const Color(0xFFE6E1E5),
                          backgroundColor: (_clicks[2] == false) ? const Color(0xFFB0A7C0) : const Color(0xFF1C1B1F),
                      ),
                      child: const Text(
                        'Night Out',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _clicks[3] = !_clicks[3];
                        });
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xFF938F99)),
                          ),
                          foregroundColor: const Color(0xFFE6E1E5),
                          backgroundColor: (_clicks[3] == false) ? const Color(0xFFB0A7C0) : const Color(0xFF1C1B1F),
                      ),
                      child: const Text(
                        'College',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _clicks[4] = !_clicks[4];
                        });
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xFF938F99)),
                          ),
                          foregroundColor: const Color(0xFFE6E1E5),
                          backgroundColor: (_clicks[4] == false) ? const Color(0xFFB0A7C0) : const Color(0xFF1C1B1F),
                      ),
                      child: const Text(
                        'Gym',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _clicks[5] = !_clicks[5];
                        });
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xFF938F99)),
                          ),
                          foregroundColor: const Color(0xFFE6E1E5),
                          backgroundColor: (_clicks[5] == false) ? const Color(0xFFB0A7C0) : const Color(0xFF1C1B1F),
                          ),
                      child: const Text(
                        'Wedding',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _clicks[6] = !_clicks[6];
                        });
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xFF938F99)),
                          ),
                          foregroundColor: const Color(0xFFE6E1E5),
                          backgroundColor: (_clicks[6] == false) ? const Color(0xFFB0A7C0) : const Color(0xFF1C1B1F),
                      ),
                      child: const Text(
                        'Walk',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _clicks[7] = !_clicks[7];
                        });
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xFF938F99)),
                          ),
                          foregroundColor: const Color(0xFFE6E1E5),
                          backgroundColor: (_clicks[7] == false) ? const Color(0xFFB0A7C0) : const Color(0xFF1C1B1F),
                      ),
                      child: const Text(
                        'Running',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _clicks[8] = !_clicks[8];
                        });
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xFF938F99)),
                          ),
                          foregroundColor: const Color(0xFFE6E1E5),
                          backgroundColor: (_clicks[8] == false) ? const Color(0xFFB0A7C0) : const Color(0xFF1C1B1F),
                      ),
                      child: const Text(
                        'Items',
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
                    padding: const EdgeInsets.only(left: 20, right: 60),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _clicks[9] = !_clicks[9];
                        });
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xFF938F99)),
                          ),
                          foregroundColor: const Color(0xFFE6E1E5),
                          backgroundColor: (_clicks[9] == false) ? const Color(0xFFB0A7C0) : const Color(0xFF1C1B1F),
                      ),
                      child: const Text(
                        'Shirt',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _clicks[10] = !_clicks[10];
                        });
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xFF938F99)),
                          ),
                          foregroundColor: const Color(0xFFE6E1E5),
                          backgroundColor: (_clicks[10] == false) ? const Color(0xFFB0A7C0) : const Color(0xFF1C1B1F),
                      ),
                      child: const Text(
                        'Dress',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _clicks[11] = !_clicks[11];
                        });
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xFF938F99)),
                          ),
                          foregroundColor: const Color(0xFFE6E1E5),
                          backgroundColor: (_clicks[11] == false) ? const Color(0xFFB0A7C0) : const Color(0xFF1C1B1F),
                      ),
                      child: const Text(
                        'Jeans',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _clicks[12] = !_clicks[12];
                        });
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xFF938F99)),
                          ),
                          foregroundColor: const Color(0xFFE6E1E5),
                          backgroundColor: (_clicks[12] == false) ? const Color(0xFFB0A7C0) : const Color(0xFF1C1B1F),  
                      ),
                      child: const Text(
                        'Skirt',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _clicks[13] = !_clicks[13];
                        });
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xFF938F99)),
                          ),
                          foregroundColor: const Color(0xFFE6E1E5),
                          backgroundColor: (_clicks[13] == false) ? const Color(0xFFB0A7C0) : const Color(0xFF1C1B1F),
                      ),
                      child: const Text(
                        'Hoodie',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _clicks[14] = !_clicks[14];
                        });
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xFF938F99)),
                          ),
                          foregroundColor: const Color(0xFFE6E1E5),
                          backgroundColor: (_clicks[14] == false) ? const Color(0xFFB0A7C0) : const Color(0xFF1C1B1F),
                      ),
                      child: const Text(
                        'Leggings',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _clicks[15] = !_clicks[15];
                        });
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xFF938F99)),
                          ),
                          foregroundColor: const Color(0xFFE6E1E5),
                          backgroundColor: (_clicks[15] == false) ? const Color(0xFFB0A7C0) : const Color(0xFF1C1B1F),
                      ),
                      child: const Text(
                        'Trousers',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _clicks[16] = !_clicks[16];
                        });
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xFF938F99)),
                          ),
                          foregroundColor: const Color(0xFFE6E1E5),
                          backgroundColor: (_clicks[16] == false) ? const Color(0xFFB0A7C0) : const Color(0xFF1C1B1F),
                      ),
                      child: const Text(
                        'Blazer',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _clicks[17] = !_clicks[17];
                        });
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xFF938F99)),
                          ),
                          foregroundColor: const Color(0xFFE6E1E5),
                          backgroundColor: (_clicks[17] == false) ? const Color(0xFFB0A7C0) : const Color(0xFF1C1B1F),
                      ),
                      child: const Text(
                        'Coat',
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
                        backgroundColor:
                            const Color.fromARGB(0xFF, 0x67, 0x50, 0xA4),
                        child: IconButton(
                          tooltip: 'Save Photo',
                          icon: const Icon(color: Colors.white, Icons.check),
                          onPressed: _goToNext,
                          /*
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
                            }
                            */
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
