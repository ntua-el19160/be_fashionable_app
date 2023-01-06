import 'dart:html';

import 'package:flutter/material.dart';

// import 'main.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key:key);
  
  @override
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
      // backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Profile'),
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
          )
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              // Θέλουμε να εμφανίζεται το Info Overlay στο κάτω μέρος
              onPressed: () {}, 
              icon: const Icon(Icons.info_outline),
              tooltip: 'About',
            )
          ),
        ]
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Username',
                border: OutlineInputBorder(
                borderSide: BorderSide()
                )
              ),
              controller: _usernameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Username cannot be empty!';
                }
                return null;
              },
            )
          ),
          const Center(
            child: Text('Achievements'),
          ),
          // Λίστα με τα achievements
          const Center(
            child: Text('Streak'),
          ),
          // Κείμενο για τρέχον streak
          // Κάποιο γραφικό
        ],
      )
      // Bottom nav bar ίδια με Homepage
    );
  }
}