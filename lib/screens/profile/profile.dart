import 'package:ecobin/screens/login/login.dart';
import 'package:ecobin/services/api_services.dart';
import 'package:ecobin/shared/button.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // USER FULL NAME, LOCATION AND PROFILE PICTURE
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image using icon for now
                  Icon(Icons.person, size: 50),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Oluwalade Jesutofunmi',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(height: 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on_outlined, size: 20),
                          Text(
                            'Lagos, Nigeria',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 50),

              //Preferences
              Text('Preferences', style: TextStyle(fontSize: 24)),
              SizedBox(height: 5),
              Card(
                elevation: 2,
                color: Color.fromRGBO(193, 200, 214, 0),
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.black, width: 1),
                ),

                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          SizedBox(width: 10),
                          Text(
                            '10 block, Majek Estate, Ibafo, \nLagos State',
                            style: TextStyle(fontSize: 20),
                          ),
                          Spacer(),
                          Icon(Icons.edit),
                          SizedBox(width: 10),
                          Text('Edit', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(),
                      SizedBox(height: 10),

                      Row(
                        children: [
                          Icon(Icons.calendar_month),
                          SizedBox(width: 10),
                          Text(
                            '9AM - Thursdays',
                            style: TextStyle(fontSize: 20),
                          ),
                          Spacer(),
                          Text('Change', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),

              // App Settings
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.settings),
                  SizedBox(width: 10),
                  Text('App Settings', style: TextStyle(fontSize: 20)),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),

              SizedBox(height: 20),

              //   Helps & Support
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.question_mark_outlined),
                  SizedBox(width: 10),
                  Text('Help & Support', style: TextStyle(fontSize: 20)),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),

              SizedBox(height: 20),

              //   Terms & Privacy
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.privacy_tip_outlined),
                  SizedBox(width: 10),
                  Text('Terms & Privacy', style: TextStyle(fontSize: 20)),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),

              SizedBox(height: 10),

              // Logout button
              TextButton(
                onPressed: () async {
                  final api = ApiService();

                  final result = await api.logout();

                  if (result['success']) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => Login()),
                    );
                  } else {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(result['message'])));
                  }
                },
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Logout',
                      style: TextStyle(color: Colors.red, fontSize: 28),
                      textAlign: TextAlign.center,
                    ),
                    Icon(Icons.logout_outlined, color: Colors.red, size: 24),
                  ],
                ),
              ),

              SizedBox(height: 100),
              //   PICK UP HISTORY BUTTON
              SkipButton('Pickup History', onPressed: () {}),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
