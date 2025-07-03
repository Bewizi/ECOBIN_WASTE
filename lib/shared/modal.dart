import 'package:ecobin/screens/complete_setup/upload_photo.dart';
import 'package:ecobin/screens/home/home.dart';
import 'package:ecobin/screens/home/home_content.dart';
import 'package:ecobin/shared/button.dart';
import 'package:flutter/material.dart';

class ShowModal {
  // static get result => null;

  // final String result;

  // modal
  static void showModal(BuildContext context, {required String name}) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 500,
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check, color: Colors.white),
                ),

                SizedBox(height: 20),

                Text(
                  'Success! Your\'re \n Almost There 🎉',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 20),

                Text(
                  'Thanks for signing up. Let\'s set up your account so\n'
                  ' we can tailor your EcoBin experience to you!',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),

                SizedBox(height: 20),

                SkipButton(
                  'Skip for now',
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (ctx) => Home(username: name)),
                      (route) => false,
                    );
                  },
                ),

                SizedBox(height: 20),

                CompleteButton(
                  'Complete Registration',
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (ctx) => UploadPhoto('')),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
