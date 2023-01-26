import 'dart:html';

import 'package:flutter/material.dart';
import 'profile.dart';
import 'main.dart';
import 'photo.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';
import 'package:intl/intl.dart';
import 'daydetails.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late OverlayEntry overlayEntry;
  bool overlayDisplayed = false;

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
    
    setState(() {
      overlayDisplayed = true;
    });
    
    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        //left: MediaQuery.of(context).size.width * 0.6,
        //right: MediaQuery.of(context).size.width,
        left: 100,
        right: 200,
        top: AppBar().preferredSize.height,
        child: Material(
          color: const Color.fromARGB(255, 11, 2, 30),
          child: SingleChildScrollView(
            child:
            Column(children: <Widget>[
              //const Flexible(child: Text('Occasion', style:TextStyle(color: Colors.white))),
              Row(
                children: [
                  IconButton(
                    color: Colors.white, 
                    onPressed: () {
                      _filters[1].selected = !_filters[1].selected;
                      setState(() {});          
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
                      _filters[2].selected = !_filters[2].selected;
                      setState(() {});          
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
                      _filters[3].selected = !_filters[3].selected;
                      setState(() {});          
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
                      _filters[4].selected = !_filters[4].selected;
                      setState(() {});          
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
                      _filters[5].selected = !_filters[5].selected;
                      setState(() {});          
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
                      _filters[6].selected = !_filters[6].selected;
                      setState(() {});          
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
                      _filters[7].selected = !_filters[7].selected;
                      setState(() {});          
                    }, 
                    icon: _filters[7].selected ? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank_outlined),
                    tooltip:  _filters[7].selected ? 'Unselect filter' : 'Select filter',
                  ),
                  const Text('Running', style: TextStyle(color: Colors.white))
                ],
              ),
              // Items header
              Row(
                children: [
                  IconButton(
                    color: Colors.white, 
                    onPressed: () {
                      _filters[9].selected = !_filters[9].selected;
                      setState(() {});          
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
                      _filters[10].selected = !_filters[10].selected;
                      setState(() {});          
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
                      _filters[11].selected = !_filters[11].selected;
                      setState(() {});          
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
                      _filters[12].selected = !_filters[12].selected;
                      setState(() {});          
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
                      _filters[13].selected = !_filters[13].selected;
                      setState(() {});          
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
                      _filters[14].selected = !_filters[14].selected;
                      setState(() {});          
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
                      _filters[15].selected = !_filters[15].selected;
                      setState(() {});          
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
                      _filters[16].selected = !_filters[16].selected;
                      setState(() {});          
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
                      _filters[17].selected = !_filters[17].selected;
                      setState(() {});          
                    }, 
                    icon: _filters[17].selected ? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank_outlined),
                    tooltip:  _filters[17].selected ? 'Unselect filter' : 'Select filter',
                  ),
                  const Text('Coat', style: TextStyle(color: Colors.white))
                ],
              ),
              Row(
                children: [
                  IconButton(
                    color: Colors.white, 
                    onPressed: () {
                      _filters[18].selected = !_filters[18].selected;
                      setState(() {});          
                    }, 
                    icon: _filters[18].selected ? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank_outlined),
                    tooltip:  _filters[18].selected ? 'Unselect filter' : 'Select filter',
                  ),
                  const Text('Favorites only', style: TextStyle(color: Colors.white))
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

  void _goToPhoto() {
      _removeOverlay();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const PhotoWidget()));
  }
  
  Widget weekText(String text) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        text,
        style: TextStyle(color: Colors.grey, fontSize: 10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    Color color ;
    if (overlayDisplayed) {
      color = const Color.fromARGB(255, 11, 2, 30).withOpacity(0.75);
    }
    else {
      color = const Color.fromARGB(255, 11, 2, 30);
    }

    return Scaffold(
        backgroundColor: color,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text('Calendar',
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
                    alignment: Alignment.centerLeft,
                    child: Text(
                      DateFormat('MMMM yyyy').format(DateTime(year, month)),
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        weekText('Mon'),
                        weekText('Tue'),
                        weekText('Wed'),
                        weekText('Thu'),
                        weekText('Fri'),
                        weekText('Sat'),
                        weekText('Sun'),
                      ],
                    ),
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
                    padding: const EdgeInsets.symmetric(vertical: 39, horizontal: 30),
                    margin: const EdgeInsets.all(1),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 153, 115, 160),
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
              final details = LocationDetails(
                date: day,
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DayDetails(),
                  settings: RouteSettings(
                  arguments: details),),);
            }
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
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
              Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.purple,
                      child: IconButton(
                        tooltip: 'Profile',
                        icon: const Icon(
                            color: Colors.white, Icons.person_outline),
                        onPressed: _goToProfile,
                      ))),
              CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.purple,
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

  Filter(
      {this.id,
      required this.title,
      this.selected = false}
  );
}
