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
// import 'dart:io';

class CameraWidget extends StatefulWidget {
  const CameraWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  final image;

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
    final details = DateDetails(
      date: DateTime.now(),
      completed: true,
    );
    //var rng = Random().nextInt(100);
    //final List<Filter> tags = _tags;
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
    /*Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CalendarWidget(routeName: 'tags'),
        settings: RouteSettings(arguments: tags),
      ),
    );*/
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

  bool click1 = true;
  bool click2 = true;
  bool click3 = true;
  bool click4 = true;
  bool click5 = true;
  bool click6 = true;
  bool click7 = true;
  bool click8 = true;
  bool click9 = true;
  bool click10 = true;
  bool click11 = true;
  bool click12 = true;
  bool click13 = true;
  bool click14 = true;

  final List<Filter> _tags = [
    Filter(id: 1, title: 'Work'),
    Filter(id: 2, title: 'Night out'),
    Filter(id: 3, title: 'College'),
    Filter(id: 4, title: 'Gym'),
    Filter(id: 5, title: 'Wedding'),
    Filter(id: 6, title: 'Walk'),
    Filter(id: 7, title: 'Running'),
    Filter(id: 9, title: 'Shirt'),
    Filter(id: 10, title: 'Dress'),
    Filter(id: 11, title: 'Jeans'),
    Filter(id: 12, title: 'Skirt'),
    Filter(id: 13, title: 'Hoodie'),
    Filter(id: 14, title: 'Leggings'),
    Filter(id: 15, title: 'Trousers'),
  ];

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
            Image.network(
              widget.image.path,
              // height: MediaQuery.of(context).size.height * 0.4,
              // width:MediaQuery.of(context).size.width * 0.8
            ),
            const SizedBox(height: 30),
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
            const SizedBox(height: 30),
            const Padding(
                padding: EdgeInsets.only(left: 80),
                child: Text('Add Tags',
                    style: TextStyle(color: Colors.white, fontSize: 28))),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          click1 = !click1;
                        });
                        if (click1 == false) {
                          _tags[1].selected = true;
                        }
                      },
                      style: TextButton.styleFrom(
                          foregroundColor:
                              (click1 == false) ? Colors.black : Colors.white,
                          //elevation: 2,
                          backgroundColor:
                              (click1 == false) ? Colors.grey : Colors.black,
                          side: const BorderSide(color: Colors.white)),
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
                          click2 = !click2;
                        });
                        if (click2 == false) {
                          _tags[2].selected = true;
                        }
                      },
                      style: TextButton.styleFrom(
                          foregroundColor:
                              (click2 == false) ? Colors.black : Colors.white,
                          //elevation: 2,
                          backgroundColor:
                              (click2 == false) ? Colors.grey : Colors.black,
                          side: const BorderSide(color: Colors.white)),
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
                          click3 = !click3;
                        });
                        if (click3 == false) {
                          _tags[3].selected = true;
                        }
                      },
                      style: TextButton.styleFrom(
                          foregroundColor:
                              (click3 == false) ? Colors.black : Colors.white,
                          //elevation: 2,
                          backgroundColor:
                              (click3 == false) ? Colors.grey : Colors.black,
                          side: const BorderSide(color: Colors.white)),
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
                          click4 = !click4;
                        });
                        if (click4 == false) {
                          _tags[4].selected = true;
                        }
                      },
                      style: TextButton.styleFrom(
                          foregroundColor:
                              (click4 == false) ? Colors.black : Colors.white,
                          //elevation: 2,
                          backgroundColor:
                              (click4 == false) ? Colors.grey : Colors.black,
                          side: const BorderSide(color: Colors.white)),
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
                          click5 = !click5;
                        });
                        if (click5 == false) {
                          _tags[5].selected = true;
                        }
                      },
                      style: TextButton.styleFrom(
                          foregroundColor:
                              (click5 == false) ? Colors.black : Colors.white,
                          //elevation: 2,
                          backgroundColor:
                              (click5 == false) ? Colors.grey : Colors.black,
                          side: const BorderSide(color: Colors.white)),
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
                          click6 = !click6;
                        });
                        if (click6 == false) {
                          _tags[6].selected = true;
                        }
                      },
                      style: TextButton.styleFrom(
                          foregroundColor:
                              (click6 == false) ? Colors.black : Colors.white,
                          //elevation: 2,
                          backgroundColor:
                              (click6 == false) ? Colors.grey : Colors.black,
                          side: const BorderSide(color: Colors.white)),
                      child: const Text(
                        'Shopping',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          click7 = !click7;
                        });
                        if (click7 == false) {
                          _tags[7].selected = true;
                        }
                      },
                      style: TextButton.styleFrom(
                          foregroundColor:
                              (click7 == false) ? Colors.black : Colors.white,
                          //elevation: 2,
                          backgroundColor:
                              (click7 == false) ? Colors.grey : Colors.black,
                          side: const BorderSide(color: Colors.white)),
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
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          click8 = !click8;
                        });
                        if (click8 == false) {
                          _tags[9].selected = true;
                        }
                      },
                      style: TextButton.styleFrom(
                          foregroundColor:
                              (click8 == false) ? Colors.black : Colors.white,
                          //elevation: 2,
                          backgroundColor:
                              (click8 == false) ? Colors.grey : Colors.black,
                          side: const BorderSide(color: Colors.white)),
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
                          click9 = !click9;
                        });
                        if (click9 == false) {
                          _tags[10].selected = true;
                        }
                      },
                      style: TextButton.styleFrom(
                          foregroundColor:
                              (click9 == false) ? Colors.black : Colors.white,
                          //elevation: 2,
                          backgroundColor:
                              (click9 == false) ? Colors.grey : Colors.black,
                          side: const BorderSide(color: Colors.white)),
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
                          click10 = !click10;
                        });
                        if (click10 == false) {
                          _tags[11].selected = true;
                        }
                      },
                      style: TextButton.styleFrom(
                          foregroundColor:
                              (click10 == false) ? Colors.black : Colors.white,
                          //elevation: 2,
                          backgroundColor:
                              (click10 == false) ? Colors.grey : Colors.black,
                          side: const BorderSide(color: Colors.white)),
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
                          click11 = !click11;
                        });
                        if (click11 == false) {
                          _tags[12].selected = true;
                        }
                      },
                      style: TextButton.styleFrom(
                          foregroundColor:
                              (click11 == false) ? Colors.black : Colors.white,
                          //elevation: 2,
                          backgroundColor:
                              (click11 == false) ? Colors.grey : Colors.black,
                          side: const BorderSide(color: Colors.white)),
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
                          click12 = !click12;
                        });
                        if (click12 == false) {
                          _tags[13].selected = true;
                        }
                      },
                      style: TextButton.styleFrom(
                          foregroundColor:
                              (click12 == false) ? Colors.black : Colors.white,
                          //elevation: 2,
                          backgroundColor:
                              (click12 == false) ? Colors.grey : Colors.black,
                          side: const BorderSide(color: Colors.white)),
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
                          click13 = !click13;
                        });
                        if (click13 == false) {
                          _tags[14].selected = true;
                        }
                      },
                      style: TextButton.styleFrom(
                          foregroundColor:
                              (click13 == false) ? Colors.black : Colors.white,
                          //elevation: 2,
                          backgroundColor:
                              (click13 == false) ? Colors.grey : Colors.black,
                          side: const BorderSide(color: Colors.white)),
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
                          click14 = !click14;
                        });
                        if (click14 == false) {
                          _tags[15].selected = true;
                        }
                      },
                      style: TextButton.styleFrom(
                          foregroundColor:
                              (click14 == false) ? Colors.black : Colors.white,
                          //elevation: 2,
                          backgroundColor:
                              (click14 == false) ? Colors.grey : Colors.black,
                          side: const BorderSide(color: Colors.white)),
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
