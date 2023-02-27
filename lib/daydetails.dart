//import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';
// import 'main.dart';
// import 'photo.dart';
import 'package:intl/intl.dart';
// import 'calendar.dart';
import 'dart:io';

class DayDetails extends StatefulWidget {
  const DayDetails({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DayDetailsState createState() => _DayDetailsState();
}

class _DayDetailsState extends State<DayDetails> {
  late OverlayEntry overlayEntry;
  bool overlayDisplayed = false;

  // List with all the Filters
  final List<String> _strings = [
    'Occasion',
    'Work',
    'Night out',
    'College',
    'Gym',
    'Wedding',
    'Walk',
    'Running',
    'Items',
    'Shirt',
    'Dress',
    'Jeans',
    'Skirt',
    'Hoodie',
    'Leggings',
    'Trousers',
    'Blazer',
    'Coat'
  ];

  // List of booleans with 18 elements that are all "false"
  final List<bool> _tags = List.generate(18, (index) => false);

  void _showOverlay() {
    OverlayState? overlayState = Overlay.of(context);

    setState(() {
      overlayDisplayed = true;
    });

    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
          top: MediaQuery.of(context).size.height * 0.7,
          bottom: 0,
          width: MediaQuery.of(context).size.width,
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
                  Row(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(right: 10),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.width * 0.2,
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/facebook.png'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 10),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.width * 0.2,
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/gmail.png'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 10),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.width * 0.2,
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/instagram.png'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 10),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.width * 0.2,
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/messenger.png'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 10),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.width * 0.2,
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/viber.png'),
                        ),
                      ),
                    ],
                  ),
                  //const Padding(padding: EdgeInsets.all(30.0)),
                ],
              )));
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

  @override
  Widget build(BuildContext context) {
    final _dateDetails =
        ModalRoute.of(context)!.settings.arguments as DateDetails;
    bool needspace = false;
    bool location = false;
    bool emptyImage = false;
    String? latitube;
    String? longitude;

    if (_dateDetails.tags != null) {
      for (int listIndex in _dateDetails.tags!) {
        _tags[listIndex] = true;
        needspace = true;
      }
    }

    if (_dateDetails.lat != ' ') {
      location = true;
      latitube = _dateDetails.lat;
      longitude = _dateDetails.long;
    }

    if (_dateDetails.imagePath == ' ') {
      emptyImage = true;
    }

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
            automaticallyImplyLeading: false,
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: CircleAvatar(
                      radius: 30.0,
                      backgroundColor:
                          const Color.fromARGB(0xFF, 0x67, 0x50, 0xA4),
                      child: IconButton(
                        //onPressed: _goToCalendar,
                        onPressed: () {
                          _removeOverlay();
                          Navigator.pop(context, _dateDetails);
                        },
                        icon: const Icon(Icons.close),
                        color: Colors.white,
                        tooltip: 'Exit',
                      ))),
            ]),
        body: GestureDetector(
          onTap: _removeOverlay,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //const SizedBox(height: 600, width: 200),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: _removeOverlay,
                  child: Container(
                    alignment: const Alignment(0, -0.5),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          emptyImage
                              ? Image.asset('assets/images/image.png', scale: 2)
                              : Image.file(File(_dateDetails.imagePath),
                                  height:
                                      MediaQuery.of(context).size.height * 0.45,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9),
                          emptyImage
                              ? const SizedBox(height: 180)
                              : const SizedBox(height: 30),
                        ]),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Visibility(
                      visible: location,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Lat: $latitube',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          DateFormat('dd/MM/yyyy').format(_dateDetails.date),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Visibility(
                      visible: needspace,
                      child: const SizedBox(height: 30),
                    ),
                    Visibility(
                      visible: location,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Long: $longitude',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                  ]
                ),
                Visibility(
                  visible: needspace,
                  child: const SizedBox(height: 30),
                ),
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      const Padding(padding: EdgeInsets.only(left: 20)),
                      /*Visibility(
                        visible: _tags[0],
                        child: Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side:
                                    const BorderSide(color: Color(0xFF938F99)),
                              ),
                              foregroundColor: const Color(0xFFE6E1E5),
                              backgroundColor: const Color(0xFFB0A7C0),
                            ),
                            child: Text(
                              _strings[0],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),*/
                      Visibility(
                        visible: _tags[1],
                        child: Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side:
                                    const BorderSide(color: Color(0xFF938F99)),
                              ),
                              foregroundColor: const Color(0xFFE6E1E5),
                              backgroundColor: const Color(0xFFB0A7C0),
                            ),
                            child: Text(
                              _strings[1],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _tags[2],
                        child: Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side:
                                    const BorderSide(color: Color(0xFF938F99)),
                              ),
                              foregroundColor: const Color(0xFFE6E1E5),
                              backgroundColor: const Color(0xFFB0A7C0),
                            ),
                            child: Text(
                              _strings[2],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _tags[3],
                        child: Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side:
                                    const BorderSide(color: Color(0xFF938F99)),
                              ),
                              foregroundColor: const Color(0xFFE6E1E5),
                              backgroundColor: const Color(0xFFB0A7C0),
                            ),
                            child: Text(
                              _strings[3],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _tags[4],
                        child: Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side:
                                    const BorderSide(color: Color(0xFF938F99)),
                              ),
                              foregroundColor: const Color(0xFFE6E1E5),
                              backgroundColor: const Color(0xFFB0A7C0),
                            ),
                            child: Text(
                              _strings[4],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _tags[5],
                        child: Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side:
                                    const BorderSide(color: Color(0xFF938F99)),
                              ),
                              foregroundColor: const Color(0xFFE6E1E5),
                              backgroundColor: const Color(0xFFB0A7C0),
                            ),
                            child: Text(
                              _strings[5],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _tags[6],
                        child: Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side:
                                    const BorderSide(color: Color(0xFF938F99)),
                              ),
                              foregroundColor: const Color(0xFFE6E1E5),
                              backgroundColor: const Color(0xFFB0A7C0),
                            ),
                            child: Text(
                              _strings[6],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _tags[7],
                        child: Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side:
                                    const BorderSide(color: Color(0xFF938F99)),
                              ),
                              foregroundColor: const Color(0xFFE6E1E5),
                              backgroundColor: const Color(0xFFB0A7C0),
                            ),
                            child: Text(
                              _strings[7],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      /*Visibility(
                        visible: _tags[8],
                        child: Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side:
                                    const BorderSide(color: Color(0xFF938F99)),
                              ),
                              foregroundColor: const Color(0xFFE6E1E5),
                              backgroundColor: const Color(0xFFB0A7C0),
                            ),
                            child: Text(
                              _strings[8],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),*/
                      Visibility(
                        visible: _tags[9],
                        child: Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side:
                                    const BorderSide(color: Color(0xFF938F99)),
                              ),
                              foregroundColor: const Color(0xFFE6E1E5),
                              backgroundColor: const Color(0xFFB0A7C0),
                            ),
                            child: Text(
                              _strings[9],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _tags[10],
                        child: Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side:
                                    const BorderSide(color: Color(0xFF938F99)),
                              ),
                              foregroundColor: const Color(0xFFE6E1E5),
                              backgroundColor: const Color(0xFFB0A7C0),
                            ),
                            child: Text(
                              _strings[10],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _tags[11],
                        child: Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side:
                                    const BorderSide(color: Color(0xFF938F99)),
                              ),
                              foregroundColor: const Color(0xFFE6E1E5),
                              backgroundColor: const Color(0xFFB0A7C0),
                            ),
                            child: Text(
                              _strings[11],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _tags[12],
                        child: Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side:
                                    const BorderSide(color: Color(0xFF938F99)),
                              ),
                              foregroundColor: const Color(0xFFE6E1E5),
                              backgroundColor: const Color(0xFFB0A7C0),
                            ),
                            child: Text(
                              _strings[12],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _tags[13],
                        child: Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side:
                                    const BorderSide(color: Color(0xFF938F99)),
                              ),
                              foregroundColor: const Color(0xFFE6E1E5),
                              backgroundColor: const Color(0xFFB0A7C0),
                            ),
                            child: Text(
                              _strings[13],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _tags[14],
                        child: Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side:
                                    const BorderSide(color: Color(0xFF938F99)),
                              ),
                              foregroundColor: const Color(0xFFE6E1E5),
                              backgroundColor: const Color(0xFFB0A7C0),
                            ),
                            child: Text(
                              _strings[14],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _tags[15],
                        child: Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side:
                                    const BorderSide(color: Color(0xFF938F99)),
                              ),
                              foregroundColor: const Color(0xFFE6E1E5),
                              backgroundColor: const Color(0xFFB0A7C0),
                            ),
                            child: Text(
                              _strings[15],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _tags[16],
                        child: Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side:
                                    const BorderSide(color: Color(0xFF938F99)),
                              ),
                              foregroundColor: const Color(0xFFE6E1E5),
                              backgroundColor: const Color(0xFFB0A7C0),
                            ),
                            child: Text(
                              _strings[16],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _tags[17],
                        child: Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side:
                                    const BorderSide(color: Color(0xFF938F99)),
                              ),
                              foregroundColor: const Color(0xFFE6E1E5),
                              backgroundColor: const Color(0xFFB0A7C0),
                            ),
                            child: Text(
                              _strings[17],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: needspace,
                  child: const SizedBox(height: 30),
                ),
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
                          } else if (_dateDetails.favorite == false) {
                            _dateDetails.favorite = true;
                          } else {
                            _dateDetails.favorite == true;
                          }
                          Navigator.pop(context, _dateDetails);
                        },
                        label: Text(
                            _dateDetails.favorite == true
                                ? 'Remove from Favorites'
                                : 'Add to Favorites',
                            style: const TextStyle(color: Colors.black)),
                        backgroundColor:
                            const Color.fromARGB(255, 208, 188, 255)),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: FloatingActionButton(
                      onPressed: _showOverlay,
                      backgroundColor:
                          const Color.fromARGB(0xFF, 0x67, 0x50, 0xA4),
                      tooltip: 'Share',
                      child: const Icon(Icons.share),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ));
  }
}

class DateDetails {
  DateTime date;
  bool? favorite;
  List<int>? tags;
  String imagePath;
  String? lat;
  String? long;

  DateDetails({
    required this.date,
    this.favorite,
    this.tags,
    required this.imagePath,
    this.lat,
    this.long,
  });
}
