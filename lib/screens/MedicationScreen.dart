import 'package:flutter/material.dart';

class MedicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medication Reminder"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            profileSection(),
            SizedBox(height: 20),
            medicationScheduleSection(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Automation: For demonstration, we're simply navigating to a new screen.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddMedicationScreen()),
          );
        },
      ),
    );
  }

  Widget profileSection() {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage('URL_TO_PERSON_IMAGE'),
              radius: 40,
            ),
            SizedBox(height: 10),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Age: 32',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Bio: Diagnosed with sickle cell at age 12.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget medicationScheduleSection() {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Medication Schedule:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.medical_services),
                SizedBox(width: 10),
                Text(
                  'Hydroxyurea: Every day at 8 AM',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            // Add more medications similarly...
          ],
        ),
      ),
    );
  }
}

class AddMedicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Medication"),
      ),
      body: Center(child: Text("Add your medication details here")),
    );
  }
}
