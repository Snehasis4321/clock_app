import 'package:clock_app/model.dart';
import 'package:flutter/material.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  final bool _isRunning = true;
  final int todayDate = DateTime.now().day;
  var clockdata = ClockData();
  Stream<String> _clockTime() async* {
    while (_isRunning) {
      await Future.delayed(const Duration(seconds: 1));
      DateTime _current = DateTime.now();
      yield "${_current.hour} : ${_current.minute}";
    }
  }

  Stream<String> _mockTime() async* {
    while (_isRunning) {
      await Future.delayed(const Duration(seconds: 1));
      DateTime _current = DateTime.now();
      yield "${_current.day} : ${_current.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pinkAccent,
        body: Center(
          child: StreamBuilder(
            stream: _clockTime(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              return Column(
                children: [
                  Text(
                    snapshot.data!.toString(),
                    style: const TextStyle(fontSize: 50, color: Colors.white),
                  ),
                  Text(todayDate.toString())
                ],
              );
            },
          ),
        ));
  }
}
