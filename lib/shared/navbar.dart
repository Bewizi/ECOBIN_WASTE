import 'package:ecobin/screens/activity/activity.dart';
import 'package:ecobin/screens/home/home_content.dart';
import 'package:ecobin/screens/profile/profile.dart';
import 'package:ecobin/screens/waste_type/waste_type.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key, required this.username});

  final String username;

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentIndex = 0;

  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      HomeContent(username: widget.username),
      Activity(),
      WasteType(),
      UserProfile(),
    ];
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.white,
        selectedLabelStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.green,
        showUnselectedLabels: true,
        selectedIconTheme: IconThemeData(color: Colors.green),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.moving), label: 'Activity'),
          BottomNavigationBarItem(icon: Icon(Icons.delete), label: 'Requests'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
