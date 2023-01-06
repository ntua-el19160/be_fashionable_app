import 'package:flutter/material.dart';

import 'profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Be Fashionable',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const TaskListScreenWidget(),
    );
  }
}

class TaskListScreenWidget extends StatefulWidget {
  const TaskListScreenWidget({Key? key}) : super(key:key);

  @override
  _TaskListScreenWidgetState createState() => _TaskListScreenWidgetState();
}

class _TaskListScreenWidgetState extends State<TaskListScreenWidget> {

  void _goToProfile () {
    Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ProfileWidget()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
        actions:[
          IconButton(
            onPressed: _goToProfile, 
            icon: const Icon(Icons.person_outline),
            color: Colors.white,
            tooltip: 'Go to Profile page',
            ),
        ],
      )
    );
  }
} 