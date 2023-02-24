import 'package:flutter/material.dart';
import 'dart:async';
import 'profile.dart';
import 'calendar.dart';
import 'photo.dart';
import 'package:camera/camera.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Be Fashionable',
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF1C1B1F)),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String time = "";

  @override
  void initState() {
    // ignore: unused_local_variable
    Timer mytimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      DateTime timenow = DateTime.now(); //get current date and time
      // ignore: prefer_interpolation_to_compose_strings
      time = (23 - timenow.hour).toString().padLeft(2, '0') +
          ":" +
          (59 - timenow.minute).toString().padLeft(2, '0') +
          ":" +
          (59 - timenow.second).toString().padLeft(2, '0');
      setState(() {});
      //mytimer.cancel() //to terminate this timer
    });
    super.initState();
  }

  void _goToProfile() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ProfileWidget()));
  }

  void _goToCalendar() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const CalendarWidget(routeName: 'main')));
  }

  void _goToPhoto() async {
    await availableCameras().then(
      (value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PhotoWidget(
            cameras: value,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: [
            const SizedBox(height: 50),
            Center(
                child: Text(
              time,
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
            const SizedBox(height: 100),
            const Center(
                child: Text(
              "Time remaining for",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
            const Center(
                child: Text(
              "today's snap!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
            const SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset('assets/images/icon.png', scale: 3))
          ],
        ),
        // backgroundColor: const Color.fromARGB(255, 11, 2, 30),
        bottomNavigationBar: BottomAppBar(
            color: const Color(0xFF1C1B1F),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: CircleAvatar(
                      radius: 30.0,
                      backgroundColor:
                          const Color.fromARGB(0xFF, 0x67, 0x50, 0xA4),
                      child: IconButton(
                        tooltip: 'Calendar',
                        icon: const Icon(color: Colors.white, Icons.today),
                        onPressed: _goToCalendar,
                      ))),
              Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: CircleAvatar(
                      radius: 30.0,
                      backgroundColor:
                          const Color.fromARGB(0xFF, 0x67, 0x50, 0xA4),
                      child: IconButton(
                        tooltip: 'Profile',
                        icon: const Icon(
                            color: Colors.white, Icons.person_outline),
                        onPressed: _goToProfile,
                      ))),
              CircleAvatar(
                  radius: 30.0,
                  backgroundColor: const Color.fromARGB(0xFF, 0x67, 0x50, 0xA4),
                  child: IconButton(
                    tooltip: 'Camera',
                    icon: const Icon(
                        color: Colors.white, Icons.camera_alt_outlined),
                    onPressed: _goToPhoto,
                  )),
            ])));
  }
}
