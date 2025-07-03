import 'package:ecobin/screens/home/home.dart';
import 'package:ecobin/shared/button.dart';
import 'package:ecobin/shared/text_form.dart';
import 'package:ecobin/shared/text_format.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PickupLocationScreen extends StatefulWidget {
  const PickupLocationScreen({super.key, required this.name});

  final String name;

  @override
  State<PickupLocationScreen> createState() => _PickupLocationScreenState();
}

class _PickupLocationScreenState extends State<PickupLocationScreen> {
  final _formKey = GlobalKey<FormState>();

  late final String name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = widget.name;
  }

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderText(
              headingText: 'Where should we collect your\n waste?',
              color: Colors.black,
            ),
            SizedBox(height: 5),
            SubText(
              text:
                  'Enter your primary location for pickups and service-\n related updates.',
              color: Color.fromRGBO(87, 94, 108, 1),
            ),
            SizedBox(height: 20),

            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextForm(
                    'Primary location',
                    controller: _textController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a location';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: 'Use my location',
                      style: TextStyle(
                        color: Colors.green,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ),

                  SizedBox(height: 150),

                  CompleteButton(
                    'Complete',
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => Home(username: name),
                        ),
                        (route) => false,
                      );
                    },
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
