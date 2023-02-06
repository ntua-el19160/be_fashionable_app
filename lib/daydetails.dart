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
  late OverlayEntry overlayEntry;
  bool overlayDisplayed = false;

  void _showOverlay() {
    OverlayState? overlayState = Overlay.of(context);
    
    setState(() {
      overlayDisplayed = true;
    });
    
    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        top: MediaQuery.of(context).size.height * 0.7,
        child: Material(
          color: const Color.fromARGB(255, 11, 2, 30),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10.0, 20.0, 0),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.purple,
                    child: Material(
                      color: Colors.purple,
                      child: IconButton(
                        onPressed: _removeOverlay,
                        icon: const Icon(Icons.close),
                        color: Colors.white,
                        tooltip: 'Close',
                      )
                    )
                  )
                )
              ),
              const Padding(
                padding: EdgeInsets.all(10.0)
              ),
              Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(right: 40),
                    width: 100,
                    height: 100,
                    child:IconButton(
                        onPressed: () {}, 
                        icon: Image.asset('assets/images/facebook.png'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 40),
                    width: 100,
                    height: 100,
                    child:IconButton(
                        onPressed: () {}, 
                        icon: Image.asset('assets/images/gmail.png'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 40),
                    width: 100,
                    height: 100,
                    child:IconButton(
                        onPressed: () {}, 
                        icon: Image.asset('assets/images/instagram.png'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 40),
                    width: 100,
                    height: 100,
                    child:IconButton(
                        onPressed: () {}, 
                        icon: Image.asset('assets/images/messenger.png'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 40),
                    width: 100,
                    height: 100,
                    child:IconButton(
                        onPressed: () {}, 
                        icon: Image.asset('assets/images/viber.png'),
                    ),
                  ),
                  
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(30.0)
              ),
            ],
          )
        )
      );
    });

    overlayState?.insert(overlayEntry);
  }

  void _removeOverlay() {
    if (overlayDisplayed) {
      overlayEntry.remove();
      setState(() {
        overlayDisplayed = false;
      });
    }
  }
  
  void _goToCalendar() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const CalendarWidget()));
  }

  @override
  Widget build(BuildContext context) {
  final location = ModalRoute.of(context)!.settings.arguments as LocationDetails; 

  Color color ;
    if (overlayDisplayed) {
      color = const Color.fromARGB(255, 11, 2, 30).withOpacity(0.75);
    }
    else {
      color = const Color.fromARGB(255, 11, 2, 30);
    }

    return Scaffold(
      backgroundColor: color,
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
      floatingActionButton: FloatingActionButton(
        onPressed: _showOverlay,
        backgroundColor: Colors.purple,
        tooltip: 'Share',
        child: const Icon(Icons.share),
      ),
      body: GestureDetector(
        onTap: _removeOverlay,
        child: Container(
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
