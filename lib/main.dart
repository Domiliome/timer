import "package:flutter/material.dart";
import "ui.dart";
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Timer",
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: HomeScreen()
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {

    int desiredLength = 2;
    return Scaffold(
      body:Center(
        child: Column(
          children: [
            TimePickerSpinner(
              is24HourMode: true,
              isShowSeconds: true,
              normalTextStyle: Theme.of(context).textTheme.bodyMedium,
              highlightedTextStyle: Theme.of(context).textTheme.bodyMedium,
              spacing: 50,
              itemHeight: 80,
              isForce2Digits: true,
              onTimeChange: (time) {
              setState(() {
                _dateTime = time;
                });
              },
            ),
            Text('${_dateTime.hour.toString().padLeft(desiredLength,'0')}:${_dateTime.minute.toString().padLeft(desiredLength,'0')}:${_dateTime.second.toString().padLeft(desiredLength,'0')}')
          ],
        ),
      )
    );
  }
}

