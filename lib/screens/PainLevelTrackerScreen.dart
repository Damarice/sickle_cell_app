// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PainLevelTrackerScreen extends StatefulWidget {
  @override
  _PainLevelTrackerScreenState createState() => _PainLevelTrackerScreenState();
}

class _PainLevelTrackerScreenState extends State<PainLevelTrackerScreen> {
  double _painLevel = 0;
  String? _selectedBodyPart;
  String? _painDescription;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  final List<String> _bodyParts = ["Head", "Chest", "Back", "Legs", "Arms"];
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();

    var initializationSettingsAndroid = AndroidInitializationSettings('app_icon'); 
    var initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null && pickedDate != _selectedDate)
      setState(() {
        _selectedDate = pickedDate;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != _selectedTime)
      setState(() {
        _selectedTime = pickedTime;
      });
  }

  void scheduleNotification(int hoursInterval) async {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(hours: hoursInterval));
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'pain_level_id',
      'pain_level',
      importance: Importance.high,
      priority: Priority.high,
    );
    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pain Level Tracker"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Text("Select your pain level:"),
            Slider(
              value: _painLevel,
              onChanged: (newValue) {
                setState(() {
                  _painLevel = newValue;
                });
              },
              divisions: 10,
              label: _painLevel.round().toString(),
              min: 0,
              max: 10,
            ),
            ListTile(
              title:
                  Text(_selectedDate?.toLocal().toString() ?? "Select a date"),
              trailing: Icon(Icons.calendar_today),
              onTap: () {
                _selectDate(context);
              },
            ),
            ListTile(
              title: Text(_selectedTime?.format(context) ?? "Select a time"),
              trailing: Icon(Icons.access_time),
              onTap: () {
                _selectTime(context);
              },
            ),
            DropdownButton<String>(
              hint: Text("Select body part"),
              value: _selectedBodyPart,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedBodyPart = newValue;
                });
              },
              items: _bodyParts.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Describe your pain',
                hintText: 'E.g. sharp, dull, throbbing',
              ),
              onChanged: (value) {
                _painDescription = value;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Pain Level: $_painLevel");
                print("Body Part: $_selectedBodyPart");
                print("Pain Description: $_painDescription");
                scheduleNotification(3);
              },
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: PainLevelTrackerScreen()));
