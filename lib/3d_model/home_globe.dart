import 'package:flutter/material.dart';
import 'package:flutter_earth_globe/flutter_earth_globe.dart';
import 'package:flutter_earth_globe/rotating_globe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Earth Globe'),
        ),
        body: EarthGlobe(),
      ),
    );
  }
}

class EarthGlobe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300, // Adjust as needed
          height: 300, // Adjust as needed
          child: FlutterEarthGlobe(),
        ),
      ),
    );
  }
}

class FlutterEarthGlobe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTapDown: (TapDownDetails details) {
            // Handle tap event
            // Access details.localPosition to determine the position of the tap
          },
          child: Container(
            width: 300, // Adjust as needed
            height: 300, // Adjust as needed
            child: FlutterEarthGlobe(),
          ),
        ),
      ),
    );
  }
}

//TODO:"make a logout from app button plus a button a for globe view and also try to remove the news by newsapi.org from the base and load a summary of whole of description in under 100 words"