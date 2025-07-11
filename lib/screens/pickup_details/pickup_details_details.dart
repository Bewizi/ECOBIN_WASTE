import 'package:ecobin/shared/button.dart';
import 'package:ecobin/shared/modal.dart';
import 'package:ecobin/shared/text_format.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PickupDetailsDetails extends StatefulWidget {
  const PickupDetailsDetails({super.key});

  @override
  State<PickupDetailsDetails> createState() => _PickupDetailsDetailsState();
}

class _PickupDetailsDetailsState extends State<PickupDetailsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderText(
                  headingText: 'Pickup Details',
                  color: Color.fromRGBO(28, 32, 42, 1),
                ),
                SizedBox(height: 10),
                SubText(
                  text:
                      'Let us know where and when to pick up your\nwaste. This helps us plan accordingly.',
                  color: Color.fromRGBO(87, 94, 108, 1),
                ),

                //   Form
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //   input pickup  address
                      Text('Pickup Address'),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter your address',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),

                      //change location
                      RichText(
                        text: TextSpan(
                          text: 'Change Location',
                          style: TextStyle(
                            color: Colors.green,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ),

                      //row for pickup date and pickup time
                      Row(
                        children: [
                          // pickup date
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Pickup Date'),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter date',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: 10),

                          // pickup time
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Pickup Time'),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter time',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                      //   Add Notes
                      Text('Additional Notes'),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter notes',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 240),

                CompleteButton(
                  'Confirm Pickup',
                  onPressed: () {
                    ShowModal.pickUpDetailsModal(context, name: '');
                    try {} catch (e) {}
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
