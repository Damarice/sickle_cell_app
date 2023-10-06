import 'package:flutter/material.dart';

class SickleCellJournalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], 
      appBar: AppBar(
        title: Text("Sickle Cell Health Journal"),
        elevation: 0, 
        backgroundColor: Colors.blueGrey[900], 
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildSectionTitle("Pain Assessment"),
              _buildPainAssessment(context),
              SizedBox(height: 20),
              _buildSectionTitle("Mood Tracker"),
              _buildMoodButtons(context),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey[800], 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), 
                    ),
                  ),
                  onPressed: () {
                    // TODO: Navigate to a detailed journal entry page
                  },
                  child: Text("Add Detailed Journal Entry"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey[700]),
      ),
    );
  }

  Widget _buildPainAssessment(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _painAssessmentQuestion(context, "On a scale from 0 to 10, how would you rate your pain right now?"),
        _painAssessmentQuestion(context, "Where is the pain located?"),
        _painAssessmentQuestion(context, "What words would you use to describe the pain (e.g., sharp, dull, throbbing)?"),
        // Add more questions as needed
      ],
    );
  }

  Widget _painAssessmentQuestion(BuildContext context, String question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          question,
          style: TextStyle(fontSize: 16, color: Colors.blueGrey[700]),
        ),
        SizedBox(height: 10),
        // TODO: Add input fields for the user to answer the questions
      ],
    );
  }

  Widget _buildMoodButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _moodButton(context, Icons.sentiment_very_dissatisfied, "Sad"),
        _moodButton(context, Icons.sentiment_dissatisfied, "Okay"),
        _moodButton(context, Icons.sentiment_satisfied, "Good"),
        _moodButton(context, Icons.sentiment_very_satisfied, "Great"),
      ],
    );
  }

  Widget _moodButton(BuildContext context, IconData icon, String label) {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(icon, color: Colors.blueGrey[700]),
          onPressed: () {
            // TODO: Implement mood selection logic
          },
        ),
        Text(label, style: TextStyle(color: Colors.blueGrey[700])),
      ],
    );
  }
}
