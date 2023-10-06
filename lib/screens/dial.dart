import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DialPage extends StatelessWidget {
  final String phoneNumber = "tel:+1234567890";  // Replace with the doctor's or emergency service's number

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Dial'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchURL,
          child: Text("Dial Emergency Number"),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            textStyle: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }
}
