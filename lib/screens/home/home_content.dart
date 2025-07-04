import 'package:ecobin/component/next_pick_date.dart';
import 'package:ecobin/component/pickup_actions_panel.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key, required this.username});

  final String username;

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  late String greeting;

  @override
  void initState() {
    super.initState();

    final now = DateTime.now();
    final hour = now.hour;

    if (hour < 12) {
      greeting = "Good Morning";
    } else if (hour < 17) {
      greeting = "Good Afternoon";
    } else {
      greeting = "Good Evening";
    }
  }

  String capitalizeName(String name) {
    return name.isEmpty ? '' : name[0].toUpperCase() + name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                // padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$greeting ${capitalizeName(widget.username)}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 5),

                        Text(
                          'it\'s sunny 🌞, perfect day to take\n out your bin,',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.person, size: 50, color: Colors.black),
                  ],
                ),
              ),
            ],
          ),
          NextPickDate(),

          SizedBox(height: 20),

          PickupActionsPanel(),
        ],
      ),
    );
  }
}
