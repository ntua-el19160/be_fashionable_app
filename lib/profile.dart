import 'dart:html';

import 'package:flutter/material.dart';

// import 'main.dart';

class MyList extends StatelessWidget {
  const MyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[
        const ListTile(
          leading: MyBullet(),
          title: Text('My first line'),
        ),
        const ListTile(
          leading: MyBullet(),
          title: Text('My second line'),
        )
      ],
    );
  }
}

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
  final _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 11, 2, 30),
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text('Profile',
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
                    icon: const Icon(Icons.info_outline),
                    tooltip: 'About',
                  )),
            ]),
        body: Column(
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
                              style: BorderStyle.solid, color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid, color: Colors.white))),
                  controller: _usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username cannot be empty!';
                    }
                    return null;
                  },
                )),
            const Center(
              child: Text(
                'Achievements',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
            ),

            //Achievement List...Start
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                const ListTile(
                  leading: MyBullet(),
                  title: Text('My first line',
                      style: TextStyle(color: Colors.white)),
                ),
                const ListTile(
                  leading: MyBullet(),
                  title: Text('My second line',
                      style: TextStyle(color: Colors.white)),
                )
              ],
            ),
            //Achievement List...End

            const Center(
              child: Text(
                'Streak',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
            ),
            // Κείμενο για τρέχον streak
            // Κάποιο γραφικό
          ],
        ),
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
              // ignore: prefer_const_constructors
              Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: const CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.purple,
                    child: Icon(color: Colors.white, Icons.person_outline),
                  )),
              CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.purple,
                  child: IconButton(
                    tooltip: 'Camera',
                    icon: const Icon(
                        color: Colors.white, Icons.camera_alt_outlined),
                    onPressed: () {},
                  )),
            ])));
  }
}
