import 'package:ecobin/screens/complete_setup/user_type_options.dart';
import 'package:flutter/material.dart';

class ChooseUserTypeScreen extends StatefulWidget {
  const ChooseUserTypeScreen({super.key});

  @override
  State<ChooseUserTypeScreen> createState() => _ChooseUserTypeScreenState();
}

class _ChooseUserTypeScreenState extends State<ChooseUserTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Who’s using EcoBin?',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Choose your user type so we can customize the\n waste services and notifications for you.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(87, 94, 108, 1),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            UserTypeOptions(),
          ],
        ),
      ),
    );
  }
}
