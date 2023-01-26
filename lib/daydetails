import 'dart:html';

import 'package:flutter/material.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';
import 'main.dart';
import 'photo.dart';
import 'package:intl/intl.dart';
import 'calendar.dart';

class DayDetails extends StatefulWidget {
  const DayDetails({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DayDetailsState createState() => _DayDetailsState();
}

class _DayDetailsState extends State<DayDetails> {
  void _goToCalendar() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const CalendarWidget()));
  }

  @override
  Widget build(BuildContext context) {
  final location = ModalRoute.of(context)!.settings.arguments as LocationDetails; 

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 2, 30),
      appBar: AppBar(backgroundColor: Colors.transparent,
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.purple,
                    child: IconButton(
                      onPressed: _goToCalendar,
                      icon: const Icon(Icons.close),
                      color: Colors.white,
                      tooltip: 'Exit',
                    ))),
          ]),
      body: Container(
        alignment: const Alignment(0, -0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Image.asset('assets/images/image.png', scale: 2),
            Padding( padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                DateFormat('dd/MM/yyyy').format(location.date),
                style: const TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
          ]
          
        ),
      ),
    floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.purple,
        tooltip: 'Share',
        child: const Icon(Icons.share),
      ),
    );
  }
}

class LocationDetails {
  DateTime date;

  LocationDetails ({
    required this.date,
  });
}
