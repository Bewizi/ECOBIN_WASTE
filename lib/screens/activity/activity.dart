import 'package:ecobin/shared/navbar.dart';
import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Activity',
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      // bottomNavigationBar: Navbar(''),
    );
  }
}
