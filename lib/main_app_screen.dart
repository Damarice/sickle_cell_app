import 'package:flutter/material.dart';
import 'package:sickle_cell_app/screens/HealthJournalScreen.dart';
import 'package:sickle_cell_app/screens/HydrationScreen.dart';
import 'package:sickle_cell_app/screens/MedicationScreen.dart';
import 'package:sickle_cell_app/screens/PainLevelTrackerScreen.dart';


class MainAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sickle Cell Management"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            FeatureCard(
              title: "Pain Level Tracker",
              subtitle: "Tap to input your pain level.",
              icon: Icons.arrow_forward,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PainLevelTrackerScreen()),
                );
              },
            ),
            FeatureCard(
              title: "Medication Reminder",
              subtitle: "Next medication: Paracetamol, 500mg at 2:00 PM",
              icon: Icons.alarm,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MedicationScreen()),
                );
              },
            ),
            FeatureCard(
              title: "Hydration Reminder",
              subtitle: "Remember to drink water today!",
              icon: Icons.local_drink,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HydrationReminderScreen()),
                );
              },
            ),
            FeatureCard(
              title: "Health Journal",
              subtitle: "Tap to view or add entries.",
              icon: Icons.book,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SickleCellJournalScreen()),
                );
              },
            ),
             FeatureCard(
              title: "emergency services",
              subtitle: "call an emergency contact or proffesional",
              icon: Icons.call,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SickleCellJournalScreen()),
                );
              },
            ),
            // ... Add more cards for other features
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Function onTap;

  FeatureCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(icon),
        onTap: () => onTap(),
      ),
    );
  }
}
