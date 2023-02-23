//import 'dart:html';

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
                    child: IconButton(
                        onPressed: () {_removeOverlay();},
                        icon: const Icon(Icons.close),
                        color: Colors.white,
                        tooltip: 'Close',
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
        .push(MaterialPageRoute(builder: (context) => const CalendarWidget(routeName: 'daydetails')));
  }

  @override
  Widget build(BuildContext context) {
  final _dateDetails = ModalRoute.of(context)!.settings.arguments as DateDetails; 

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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //const SizedBox(height: 600, width: 200),
            const SizedBox(height: 100, width: 200),
            GestureDetector(
              onTap: _removeOverlay,
              child: Container(
              alignment: const Alignment(0, -0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  //to image.asset prepei na mpei se sxolia
                  Image.asset('assets/images/image.png', scale: 2),
                  const SizedBox(height: 200),
                  ]
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(left: 20),
                child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Location',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ), 
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  DateFormat('dd/MM/yyyy').format(_dateDetails.date),
                  style: const TextStyle(color: Colors.white, fontSize: 20.0),
                  ), 
                ),
              ),
              
              ],
            ),   
            const SizedBox(height: 50),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 60),
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
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    //add this photo to favorites
                    //metefere sto calendar to context mazi me to updated date_details
                    if (_dateDetails.favorite == true) {
                    _dateDetails.favorite = false;
                    }
                    else if (_dateDetails.favorite == false) {
                    _dateDetails.favorite = true;
                    }
                    else {
                      _dateDetails.favorite == true;
                    }
                    Navigator.pop(context, _dateDetails);
                  }, 
                  label: Text(
                    _dateDetails.favorite == true ? 'Remove from Favorites' : 'Add to Favorites',
                    style: const TextStyle(color: Colors.black)
                    ),
                  backgroundColor: const Color.fromARGB(255, 190, 150, 199),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: FloatingActionButton(
                  onPressed: _showOverlay,
                  backgroundColor: Colors.purple,
                  tooltip: 'Share',
                  child: const Icon(Icons.share),
                ),
              ),
            ),
            const SizedBox(height: 10),   
          ],
        ),
      ),
    );
  }
}

class DateDetails {
  DateTime date;
  bool? completed;
  bool? favorite; 

  DateDetails ({
    required this.date,
    this.completed,
    this.favorite,
  });
}
