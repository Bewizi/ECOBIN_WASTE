import 'package:ecobin/screens/home/home.dart';
import 'package:ecobin/screens/home/home_content.dart';
import 'package:ecobin/shared/button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class UploadPhoto extends StatefulWidget {
  const UploadPhoto(this.username, {super.key});

  final String username;

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Upload Photo'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add a profile Picture',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 8),

            RichText(
              text: TextSpan(
                text:
                    'Your photo helps us personalize your experience and\n'
                    'allows our pickup team to easily identify you. You\n'
                    'can',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  height: 1.3,
                ),
                children: [
                  TextSpan(
                    text: ' skip this for now.',
                    style: TextStyle(color: Colors.green),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => Home(widget.username),
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),

            SizedBox(height: 100),

            // Icon for profile picture
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: Icon(Icons.person, size: 50, color: Colors.grey[600]),
              ),
            ),

            SizedBox(height: 150),

            SizedBox(
              width: double.infinity,
              child: CompleteButton('Upload Photo', onPressed: () {}),
            ),

            SizedBox(height: 20),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color.fromRGBO(239, 245, 240, 1),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.question_mark_rounded),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kindly note',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color.fromRGBO(29, 61, 35, 1),
                        ),
                      ),
                      Text(
                        'You can always update your photo later\n from settings.',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
