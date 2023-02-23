import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'calendar.dart';

class AchievementWidget extends StatefulWidget {
  const AchievementWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AchievementWidgetState createState() => _AchievementWidgetState();
}

class _AchievementWidgetState extends State<AchievementWidget> {
  
  void _goToCalendar() {
    final details = ModalRoute.of(context)!.settings.arguments;
    Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CalendarWidget(routeName: 'achievements'),
            settings: RouteSettings(arguments: details),
           ),
        );
  }

  @override
  Widget build(BuildContext context) {
    HapticFeedback.vibrate();
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
        mainAxisAlignment: MainAxisAlignment.center,
        children : <Widget>[
          // Κάποιο γραφιστικό
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text('CONGRATULATIONS', style: TextStyle(
                  color: Colors.white
                  )
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text('You unlocked x Achievement', style: TextStyle(
                  color: Colors.white
                  )
                ),
              )
            ],
          )
        ]
      )
    );
  }
}
