// ignore: unused_import, avoid_web_libraries_in_flutter
// import 'dart:html';
import 'main.dart';
import 'package:flutter/material.dart';
import 'calendar.dart';
import 'photo.dart';
import 'package:camera/camera.dart';

//Dot for the list
class MyBullet extends StatelessWidget {
  const MyBullet({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Container(
      height: 20.0,
      width: 20.0,
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 132, 98, 98),
        shape: BoxShape.circle,
      ),
    );
  }
}

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late OverlayEntry overlayEntry;
  bool overlayDisplayed = false;

  void _showOverlay() {
    OverlayState? overlayState = Overlay.of(context);

    setState(() {
      overlayDisplayed = true;
    });

    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
          top: MediaQuery.of(context).size.height * 0.5,
          bottom: 0,
          child: Material(
              color: const Color(0xFF1C1B1F),
              child: Column(
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.topRight,
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10.0, 20.0, 0),
                          child: CircleAvatar(
                              radius: 30.0,
                              backgroundColor:
                                  const Color.fromARGB(0xFF, 0x67, 0x50, 0xA4),
                              child: IconButton(
                                onPressed: () {
                                  _removeOverlay();
                                },
                                icon: const Icon(Icons.close),
                                color: Colors.white,
                                tooltip: 'Close',
                              )))),
                  const Padding(padding: EdgeInsets.all(10.0)),
                  Text(
                      'Το BeFashionable δημιουργήθηκε από:\n\nΑνδρέας Λεβής\nandlevis2001@gmail.com\n\nΘεοδώρα Βερναρδάκη\ntheodvern@gmail.com\n\nΧρυσούλα Πανηγυράκη\nchrysoulapan@gmail.com',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          color: Colors.white)),
                  const Padding(padding: EdgeInsets.all(30.0)),
                ],
              )));
    });

    overlayState.insert(overlayEntry);
  }

  void _removeOverlay() {
    if (overlayDisplayed) {
      overlayEntry.remove();
      setState(() {
        overlayDisplayed = false;
      });
    }
  }

  TextEditingController _usernameController = TextEditingController();

  var _username;

  void _updateText() {
    setState(() {
      _username = _usernameController.text;
    });
  }

  @override
  void initState() {
    super.initState();

    _usernameController.addListener((_updateText));
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _goToCalendar() {
    _removeOverlay();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const CalendarWidget(routeName: 'profile')));
  }

  void _goToMain() {
    _removeOverlay();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const MyApp()));
  }

  void _goToPhoto() async {
    _removeOverlay();
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
    Color color;
    if (overlayDisplayed) {
      color = const Color(0xFF1C1B1F).withOpacity(0.75);
    } else {
      color = const Color(0xFF1C1B1F);
    }

    return Scaffold(
        backgroundColor: color,
        appBar: AppBar(
            backgroundColor: color,
            title: const Text('Profile',
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
                )),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: IconButton(
                    // Θέλουμε να εμφανίζεται το Info Overlay στο κάτω μέρος
                    onPressed: _showOverlay,
                    icon: const Icon(Icons.info_outline),
                    tooltip: 'About',
                  )),
            ]),
        body: GestureDetector(
            onTap: () {
              _removeOverlay();
            },
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                      decoration: const InputDecoration(
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 93, 54, 165),
                              fontSize: 15),
                          hintText: 'Username',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Colors.white))),
                      onChanged: (val) {
                        _updateText();
                      },
                      controller: _usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username cannot be empty!';
                        }
                        return null;
                      },
                    )),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: FloatingActionButton.extended(
                      // ignore: prefer_const_constructors
                      label: Text('Submit',
                          // ignore: prefer_const_constructors
                          style: const TextStyle(
                              color: Color.fromARGB(0xFF, 0x38, 0x1E, 0x72))),
                      backgroundColor:
                          const Color.fromARGB(0xFF, 0xD0, 0xBC, 0xFF),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              // Retrieve the text that the user has entered by using the
                              // TextEditingController.
                              content: Text(
                                  'Your User Name is ${_usernameController.text}'),
                            );
                          },
                        );
                      }),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'Achievements',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Column(children: const <Widget>[
                  ListTile(
                      leading: MyBullet(),
                      title: Text('Upload 5 days in a row',
                          style: TextStyle(color: Colors.white))),
                  ListTile(
                      leading: MyBullet(),
                      title: Text('Uplaod 10 days in a row',
                          style: TextStyle(color: Colors.white))),
                  ListTile(
                      leading: MyBullet(),
                      title: Text('Uplaod 50 days in a row',
                          style: TextStyle(color: Colors.white))),
                  ListTile(
                      leading: MyBullet(),
                      title: Text('Uplaod 100 days in a row',
                          style: TextStyle(color: Colors.white))),
                  ListTile(
                      leading: MyBullet(),
                      title: Text('Uplaod 5 days in total',
                          style: TextStyle(color: Colors.white))),
                  ListTile(
                      leading: MyBullet(),
                      title: Text('Uplaod 10 days in total',
                          style: TextStyle(color: Colors.white))),
                  ListTile(
                      leading: MyBullet(),
                      title: Text('Uplaod 50 days in total',
                          style: TextStyle(color: Colors.white))),
                  ListTile(
                      leading: MyBullet(),
                      title: Text('Uplaod 100 days in total',
                          style: TextStyle(color: Colors.white))),
                  ListTile(
                      leading: MyBullet(),
                      title: Text('Upload 1 outfit for every occasion',
                          style: TextStyle(color: Colors.white))),
                  ListTile(
                      leading: MyBullet(),
                      title: Text('Upload 1 outfit with each item',
                          style: TextStyle(color: Colors.white))),
                  ListTile(
                      leading: MyBullet(),
                      title: Text('Share 1 outfit with your friends',
                          style: TextStyle(color: Colors.white))),
                  ListTile(
                      leading: MyBullet(),
                      title: Text('Share 5 outfits with your friends',
                          style: TextStyle(color: Colors.white))),
                  ListTile(
                      leading: MyBullet(),
                      title: Text('Upload 5 different outfits',
                          style: TextStyle(color: Colors.white))),
                  ListTile(
                      leading: MyBullet(),
                      title: Text('Upload 10 different outfits',
                          style: TextStyle(color: Colors.white))),
                ]),
                const Center(
                  child: Text(
                    'Streak',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                const Center(
                  child: Text(
                    'You have X days Streak!',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                //const SizedBox(height: 200.0, width: 100.0),
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset('assets/images/fire.png', scale: 3))
              ],
            ))),
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
              // ignore: prefer_const_constructors
              Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: const CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Color.fromARGB(0xFF, 0x67, 0x50, 0xA4),
                    child: Icon(color: Colors.white, Icons.person_outline),
                  )),
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
