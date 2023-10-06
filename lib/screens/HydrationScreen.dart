// lib/screens/HydrationReminderScreen.dart

import 'package:flutter/material.dart';

class HydrationReminderScreen extends StatefulWidget {
  @override
  _HydrationReminderScreenState createState() => _HydrationReminderScreenState();
}

class _HydrationReminderScreenState extends State<HydrationReminderScreen> {
  final double dailyGoal = 2000.0;  // in milliliters (ml), adjust as needed
  double currentIntake = 0.0;  // start at 0 ml each day

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Hydration Reminder"),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _hydrationMeter(),
            SizedBox(height: 30),
            _hydrationButton(),
          ],
        ),
      ),
    );
  }

  Widget _hydrationMeter() {
    double percentage = (currentIntake / dailyGoal) * 100;
    return Column(
      children: [
        CircularProgressIndicator(
          value: currentIntake / dailyGoal,
          strokeWidth: 10,
          backgroundColor: Colors.blueGrey[200],
          valueColor: AlwaysStoppedAnimation<Color>(const Color.fromARGB(255, 24, 116, 192)),
        ),
        SizedBox(height: 20),
        Text("$currentIntake ml / $dailyGoal ml",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey[700])),
        SizedBox(height: 5),
        Text("${percentage.toStringAsFixed(1)}% of daily goal",
            style: TextStyle(fontSize: 16, color: Colors.blueGrey[500])),
      ],
    );
  }

  Widget _hydrationButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.blue[400],
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: _updateHydration,
      child: Text("I Drank Water", style: TextStyle(fontSize: 18)),
    );
  }

  void _updateHydration() {
    setState(() {
      currentIntake += 250;  // Assuming user drinks 250ml at a time, adjust as needed
      if (currentIntake > dailyGoal) currentIntake = dailyGoal;
    });
  }
}
