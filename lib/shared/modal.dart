import 'package:ecobin/screens/complete_setup/upload_photo.dart';
import 'package:ecobin/screens/home/home.dart';
import 'package:ecobin/shared/button.dart';
import 'package:ecobin/shared/navbar.dart';
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

  static void pickUpDetailsModal(BuildContext context, {required String name}) {
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
                  'Pickup Request\nConfirmed',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 20),

                Text(
                  'Thanks! Your request has been successfully\nsubmitted. Here are the details',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    width: double.infinity,
                    color: Color.fromRGBO(249, 249, 249, 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Address:',
                              style: TextStyle(
                                color: Color.fromRGBO(87, 94, 108, 1),
                                fontSize: 20,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '03, Adekunmi Estate,\nOjota, Lagos',
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),

                        SizedBox(height: 10),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Date & Time:',
                              style: TextStyle(
                                color: Color.fromRGBO(87, 94, 108, 1),
                                fontSize: 20,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '10th of May, 2025.\n12PM',
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Waste Type:',
                              style: TextStyle(
                                color: Color.fromRGBO(87, 94, 108, 1),
                                fontSize: 20,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Household Waste',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Notes:',
                              style: TextStyle(
                                color: Color.fromRGBO(87, 94, 108, 1),
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'Bins are behind the gate',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                CompleteButton(
                  'Go to Dashboard',
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (ctx) => Navbar(username: '')),
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
