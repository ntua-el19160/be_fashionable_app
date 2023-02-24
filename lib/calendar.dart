//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';
import 'profile.dart';
import 'main.dart';
import 'photo.dart';
import 'package:intl/intl.dart';
import 'daydetails.dart';
import 'package:camera/camera.dart';


class CalendarWidget extends StatefulWidget {
  //const CalendarWidget({Key? key}) : super(key: key);
  final String routeName;
  const CalendarWidget({super.key, required this.routeName});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late OverlayEntry overlayEntry;
  bool overlayDisplayed = false;
  bool applyFilters = false;
  // ignore: non_constant_identifier_names
  bool FromCamera = false;

  //kenh lista apo Datedetails
  final List<DateDetails> _details = <DateDetails>[];
  final Map<DateTime, Color> _colors = {};

  @override
    void initState() {
      super.initState();
      if ((widget.routeName == 'achievements') || (widget.routeName == 'camera')) {
        FromCamera = true;
          debugPrint('Route camera');
      }
    }

  void _updateDetails(DateTime day) async {
    bool favorite = false;
    if (_colors[day] == const Color.fromARGB(205, 130, 28, 148)) {
      favorite = true;
    }
    final details = DateDetails(
      date: day,
      favorite: favorite
    );
    DateDetails newdetails = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DayDetails(),
        settings: RouteSettings(
        arguments: details),),);
    if (newdetails.favorite == true){
      //_details.add(newdetails);
      _colors[day] = const Color.fromARGB(205, 130, 28, 148);
    }
    else {
      _colors[day] = Colors.transparent;
    }
    //Redraw the widget
    setState(() {
    });
  }

  final List<Filter> _filters = [
        Filter(id:0, title: 'Occasion'),
        Filter(id:1, title: 'Work'),
        Filter(id:2, title: 'Night out'),
        Filter(id:3, title: 'College'),
        Filter(id:4, title: 'Gym'),
        Filter(id:5, title: 'Wedding'),
        Filter(id:6, title: 'Walk'),
        Filter(id:7, title: 'Running'),
        Filter(id:8, title: 'Items'),
        Filter(id:9, title: 'Shirt'),
        Filter(id:10, title: 'Dress'),
        Filter(id:11, title: 'Jeans'),
        Filter(id:12, title: 'Skirt'),
        Filter(id:13, title: 'Hoodie'),
        Filter(id:14, title: 'Leggings'),
        Filter(id:15, title: 'Trousers'),
        Filter(id:16, title: 'Blazer'),
        Filter(id:17, title: 'Coat'),
        Filter(id:18, title: 'Favorites only'),
      ];

  void _showOverlay() {
    OverlayState? overlayState = Overlay.of(context);
    
    applyFilters = false;
    
    setState(() {
      overlayDisplayed = true;
    });
    
    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        width : MediaQuery.of(context).size.width * 0.5,
        left: MediaQuery.of(context).size.width * 0.5,
        top: AppBar().preferredSize.height,
        bottom: 0,
        child: Material(
          color: const Color(0xFF1C1B1F),
          child: SingleChildScrollView(
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text('Occasion', style: TextStyle(color: Colors.white))
              ),
              Row(
                children: [
                  IconButton(
                    color: Colors.white, 
                    onPressed: () {
                      setState(() {_filters[1].selected = !_filters[1].selected; applyFilters = true;});
                      _removeOverlay();
                      _showOverlay();          
                    }, 
                    icon: _filters[1].selected ? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank_outlined),
                    tooltip:  _filters[1].selected ? 'Unselect filter' : 'Select filter',
                  ),
                  const Text('Work', style: TextStyle(color: Colors.white))
                ],
              ),
              Row(
                children: [
                  IconButton(
                    color: Colors.white, 
                    onPressed: () {
                      setState(() {_filters[2].selected = !_filters[2].selected; applyFilters = true;});
                      _removeOverlay();
                      _showOverlay();          
                    }, 
                    icon: _filters[2].selected ? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank_outlined),
                    tooltip:  _filters[2].selected ? 'Unselect filter' : 'Select filter',
                  ),
                  const Text('Night out', style: TextStyle(color: Colors.white))
                ],
              ),
              Row(
                children: [
                  IconButton(
                    color: Colors.white, 
                    onPressed: () {
                      setState(() {_filters[3].selected = !_filters[3].selected; applyFilters = true;});
                      _removeOverlay();
                      _showOverlay();          
                    }, 
                    icon: _filters[3].selected ? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank_outlined),
                    tooltip:  _filters[3].selected ? 'Unselect filter' : 'Select filter',
                  ),
                  const Text('College', style: TextStyle(color: Colors.white))
                ],
              ),
              Row(
                children: [
                  IconButton(
                    color: Colors.white, 
                    onPressed: () {
                      setState(() {_filters[4].selected = !_filters[4].selected; applyFilters = true;});
                      _removeOverlay();
                      _showOverlay();          
                    }, 
                    icon: _filters[4].selected ? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank_outlined),
                    tooltip:  _filters[4].selected ? 'Unselect filter' : 'Select filter',
                  ),
                  const Text('Gym', style: TextStyle(color: Colors.white))
                ],
              ),
              Row(
                children: [
                  IconButton(
                    color: Colors.white, 
                    onPressed: () {
                      setState(() {_filters[5].selected = !_filters[5].selected; applyFilters = true;});
                      _removeOverlay();
                      _showOverlay();          
                    }, 
                    icon: _filters[5].selected ? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank_outlined),
                    tooltip:  _filters[5].selected ? 'Unselect filter' : 'Select filter',
                  ),
                  const Text('Wedding', style: TextStyle(color: Colors.white))
                ],
              ),
              Row(
                children: [
                  IconButton(
                    color: Colors.white, 
                    onPressed: () {
                      setState(() {_filters[6].selected = !_filters[6].selected; applyFilters = true;});
                      _removeOverlay();
                      _showOverlay();          
                    }, 
                    icon: _filters[6].selected ? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank_outlined),
                    tooltip:  _filters[6].selected ? 'Unselect filter' : 'Select filter',
                  ),
                  const Text('Walk', style: TextStyle(color: Colors.white))
                ],
              ),
              Row(
                children: [
                  IconButton(
                    color: Colors.white, 
                    onPressed: () {
                      setState(() {_filters[7].selected = !_filters[7].selected; applyFilters = true;});
                      _removeOverlay();
                      _showOverlay();          
                    }, 
                    icon: _filters[7].selected ? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank_outlined),
                    tooltip:  _filters[7].selected ? 'Unselect filter' : 'Select filter',
                  ),
                  const Text('Running', style: TextStyle(color: Colors.white))
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text('Items', style: TextStyle(color: Colors.white))
              ),
              Row(
                children: [
                  IconButton(
                    color: Colors.white, 
                    onPressed: () {
                      setState(() {_filters[9].selected = !_filters[9].selected; applyFilters = true;});
                      _removeOverlay();
                      _showOverlay();          
                    }, 
                    icon: _filters[9].selected ? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank_outlined),
                    tooltip:  _filters[9].selected ? 'Unselect filter' : 'Select filter',
                  ),
                  const Text('Shirt', style: TextStyle(color: Colors.white))
                ],
              ),
              Row(
                children: [
                  IconButton(
                    color: Colors.white, 
                    onPressed: () {
                      setState(() {_filters[10].selected = !_filters[10].selected; applyFilters = true;});
                      _removeOverlay();
                      _showOverlay();          
                    }, 
                    icon: _filters[10].selected ? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank_outlined),
                    tooltip:  _filters[10].selected ? 'Unselect filter' : 'Select filter',
                  ),
                  const Text('Dress', style: TextStyle(color: Colors.white))
                ],
              ),
              Row(
                children: [
                  IconButton(
                    color: Colors.white, 
                    onPressed: () {
                      setState(() {_filters[11].selected = !_filters[11].selected; applyFilters = true;});
                      _removeOverlay();
                      _showOverlay();          
                    }, 
                    icon: _filters[11].selected ? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank_outlined),
                    tooltip:  _filters[11].selected ? 'Unselect filter' : 'Select filter',
                  ),
                  const Text('Jeans', style: TextStyle(color: Colors.white))
                ],
              ),
              Row(
                children: [
                  IconButton(
                    color: Colors.white, 
                    onPressed: () {
                      setState(() {_filters[12].selected = !_filters[12].selected; applyFilters = true;});
                      _removeOverlay();
                      _showOverlay();          
                    }, 
                    icon: _filters[12].selected ? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank_outlined),
                    tooltip:  _filters[12].selected ? 'Unselect filter' : 'Select filter',
                  ),
                  const Text('Skirt', style: TextStyle(color: Colors.white))
                ],
              ),
              Row(
                children: [
                  IconButton(
                    color: Colors.white, 
                    onPressed: () {
                      setState(() {_filters[13].selected = !_filters[13].selected; applyFilters = true;});
                      _removeOverlay();
                      _showOverlay();          
                    }, 
                    icon: _filters[13].selected ? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank_outlined),
                    tooltip:  _filters[13].selected ? 'Unselect filter' : 'Select filter',
                  ),
                  const Text('Hoodie', style: TextStyle(color: Colors.white))
                ],
              ),
              Row(
                children: [
                  IconButton(
                    color: Colors.white, 
                    onPressed: () {
                      setState(() {_filters[14].selected = !_filters[14].selected; applyFilters = true;});
                      _removeOverlay();
                      _showOverlay();          
                    }, 
                    icon: _filters[14].selected ? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank_outlined),
                    tooltip:  _filters[14].selected ? 'Unselect filter' : 'Select filter',
                  ),
                  const Text('Leggings', style: TextStyle(color: Colors.white))
                ],
              ),
              Row(
                children: [
                  IconButton(
                    color: Colors.white, 
                    onPressed: () {
                      setState(() {_filters[15].selected = !_filters[15].selected; applyFilters = true;});
                      _removeOverlay();
                      _showOverlay();          
                    }, 
                    icon: _filters[15].selected ? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank_outlined),
                    tooltip:  _filters[15].selected ? 'Unselect filter' : 'Select filter',
                  ),
                  const Text('Trousers', style: TextStyle(color: Colors.white))
                ],
              ),
              Row(
                children: [
                  IconButton(
                    color: Colors.white, 
                    onPressed: () {
                      setState(() {_filters[16].selected = !_filters[16].selected; applyFilters = true;});
                      _removeOverlay();
                      _showOverlay();          
                    }, 
                    icon: _filters[16].selected ? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank_outlined),
                    tooltip:  _filters[16].selected ? 'Unselect filter' : 'Select filter',
                  ),
                  const Text('Blazer', style: TextStyle(color: Colors.white))
                ],
              ),
              Row(
                children: [
                  IconButton(
                    color: Colors.white, 
                    onPressed: () {
                      setState(() {_filters[17].selected = !_filters[17].selected; applyFilters = true;});
                      _removeOverlay();
                      _showOverlay();          
                    }, 
                    icon: _filters[17].selected ? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank_outlined),
                    tooltip:  _filters[17].selected ? 'Unselect filter' : 'Select filter',
                  ),
                  const Text('Coat', style: TextStyle(color: Colors.white))
                ],
              ),
              const Padding(padding: EdgeInsets.all(12)),
              Row(
                children: [
                  IconButton(
                    color: Colors.white, 
                    onPressed: () {
                      setState(() {_filters[18].selected = !_filters[18].selected; applyFilters = true;});
                      _removeOverlay();
                      _showOverlay();          
                    }, 
                    icon: _filters[18].selected ? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank_outlined),
                    tooltip:  _filters[18].selected ? 'Unselect filter' : 'Select filter',
                  ),
                  const Text('Favorites only', style: TextStyle(color: Colors.white))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: FloatingActionButton.extended(
                      extendedPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      tooltip: 'Apply selected filters',
                      label: const Text('Apply Filter',
                      style: TextStyle(color: Color.fromARGB(0xFF, 0x38, 0x1E, 0x72))),
                      backgroundColor: const Color.fromARGB(0xFF, 0xD0, 0xBC, 0xFF),
                      onPressed: () {
                        for (var i = 0; i < 19; i++ ) {
                          _filters[i].initiallySelected = _filters[i].selected;
                        }
                        applyFilters = true;
                        _removeOverlay();
                        // Must also pass filters to calendar / render new state 
                      },
                    ),
                  )
                ],
              )  
            ]
          ),
        ),        
      ), 
     );
  });

    overlayState?.insert(overlayEntry);
  }

  void _removeOverlay() {
    if (overlayDisplayed) {
      if (!applyFilters) {
        for (var i = 0; i < 19; i++ ) {
          _filters[i].selected = _filters[i].initiallySelected;
        }
      }
      overlayEntry.remove();
      setState(() {
        overlayDisplayed = false;
      });
    }
  }

  void _goToProfile() {
    _removeOverlay();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ProfileWidget()));
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

Widget weekText(String text) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        text,
        style: const TextStyle(color: Colors.grey, fontSize: 10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {  
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

    Color color ;
    if (overlayDisplayed) {
      color = const Color(0xFF1C1B1F).withOpacity(0.75);
    }
    else {
      color = const Color(0xFF1C1B1F);
    }

    return Scaffold(
        backgroundColor: color,
        appBar: AppBar(
            backgroundColor: color,
            title: const Text('Calendar',
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
                    onPressed: _showOverlay,
                    icon: const Icon(Icons.menu),
                    tooltip: 'Filter',
                  )),
            ]),
        body: GestureDetector(
          onTap: _removeOverlay,
          child: PagedVerticalCalendar(
            monthBuilder: (context, month, year) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                    //padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      DateFormat('MMMM yyyy').format(DateTime(year, month)),
                      style: const TextStyle(color: Colors.white, fontSize: 23),
                    ),
                  ),

                  Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: weekText("Mo")),
                        Expanded(child: weekText("Tu")),
                        Expanded(child: weekText("We")),
                        Expanded(child: weekText("Th")),
                        Expanded(child: weekText("Fri")),
                        Expanded(child: weekText("Sat")),
                        Expanded(child: weekText("Su")),
                      ],
                    ),
                ],
              );
            },

            dayBuilder: (context, date) {
              return Column(
                children: [
                  Container(
                    //padding: const EdgeInsets.only(top: 50.0),
                    
                    //we need to use a boolean 
                    //filled box if a photo was taken this day
                    //padding: const EdgeInsets.symmetric(vertical: 39, horizontal: 30),
                    margin: const EdgeInsets.all(1),
                    padding: EdgeInsets.symmetric(vertical: width *0.04),
                    decoration: BoxDecoration(
                      color: _colors[date] ?? Colors.transparent,
                      //color: Color.fromARGB(255, 190, 150, 199),
                    ),
                    alignment: Alignment.center,
                    //padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
                    child: Center(
                      child: Text(
                      DateFormat('d').format(date),
                      style: const TextStyle(color: Colors.white),
                    ),),
                  ),
                ],
              );
            },
            onDayPressed: (day) {
              _removeOverlay();
              DateTime now = DateTime.now();
              DateTime todaysDate = DateTime(now.year, now.month, now.day);
              if (!day.isAfter(todaysDate)) {
                _updateDetails(day);
              }
            }
          ),
        ),
        /*
          dayBuilder: (context, date) => Container(
            alignment: Alignment.center,
            /*decoration: BoxDecoration(
              color: const Color.fromARGB(255, 169, 141, 174), 
            ),*/
            child: Text(
              date.day.toString(),
              style: TextStyle(color: Colors.white),
            ),

          ),*/
        bottomNavigationBar: BottomAppBar(
            color: color,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: CircleAvatar(
                      radius: 30.0,
                      // backgroundColor: Colors.purple,
                      backgroundColor: const Color.fromARGB(0xFF, 0x67, 0x50, 0xA4),
                      child: IconButton(
                        tooltip: 'Calendar',
                        icon: const Icon(color: Colors.white, Icons.today),
                        onPressed: () {},
                      ))),
              Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: CircleAvatar(
                      radius: 30.0,
                      // backgroundColor: Colors.purple,
                      backgroundColor: const Color.fromARGB(0xFF, 0x67, 0x50, 0xA4),
                      child: IconButton(
                        tooltip: 'Profile',
                        icon: const Icon(
                            color: Colors.white, Icons.person_outline),
                        onPressed: _goToProfile,
                      ))),
              CircleAvatar(
                  radius: 30.0,
                  // backgroundColor: Colors.purple,
                  backgroundColor: const Color.fromARGB(0xFF, 0x67, 0x50, 0xA4),
                  child: IconButton(
                    tooltip: 'Camera',
                    icon: const Icon(
                        color: Colors.white, Icons.camera_alt_outlined
                    ),
                    onPressed: _goToPhoto,
                  )
              ),
            ]
          )
        )
      );
  }
}

class Filter {
  int? id;
  String title;
  bool selected;
  bool initiallySelected;

  Filter(
      {this.id,
      required this.title,
      this.selected = false,
      this.initiallySelected = false}
  );
}
