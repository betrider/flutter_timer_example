import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TimerCountSamplePage(),
    );
  }
}

class TimerCountSamplePage extends StatefulWidget {
  const TimerCountSamplePage({super.key});

  @override
  TimerCountSamplePageState createState() => TimerCountSamplePageState();
}

class TimerCountSamplePageState extends State<TimerCountSamplePage> {
  Timer? _timer;
  bool _isRunning = false;
  int _timerCount = 0;
  String _buttonText = 'Start';

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Application'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(_buttonText),
              onPressed: () {
                _isRunning = !_isRunning;
                if (_isRunning) {
                  setState(() {
                    _timerCount = 0;

                    _buttonText = 'Stop';
                  });

                  _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
                    setState(() {
                      _timerCount++;
                    });
                    if (_timerCount == 100) {
                      _timer?.cancel();
                    }
                  });
                } else {
                  _timer?.cancel();

                  setState(() {
                    _buttonText = 'Start';
                  });
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text("$_timerCount"),
            ),
          ],
        ),
      ),
    );
  }
}