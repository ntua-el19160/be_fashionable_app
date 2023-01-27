import 'package:flutter/material.dart';
import 'calendar.dart';

class AchievementWidget extends StatefulWidget {
  const AchievementWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AchievementWidgetState createState() => _AchievementWidgetState();
}

class _AchievementWidgetState extends State<AchievementWidget> {
  
  void _goToCalendar() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const CalendarWidget()));
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children : const <Widget>[
          // Κάποιο γραφιστικό
          Text('CONGRATULATIONS'),
          Text('You unlocked x Achievement')
        ]
      ),
    );
  }
}
