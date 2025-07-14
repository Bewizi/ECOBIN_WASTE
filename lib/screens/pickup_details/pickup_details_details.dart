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

                SizedBox(height: 20),
                //   Form
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //   input pickup  address
                      Text(
                        'Pickup Address',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(height: 10),

                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter your address',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(193, 200, 214, 1),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(193, 200, 214, 1),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
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

                      SizedBox(height: 25),

                      //row for pickup date and pickup time
                      Row(
                        children: [
                          // pickup date
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pickup Date',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                SizedBox(height: 10),

                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter date',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(193, 200, 214, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(193, 200, 214, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: 25),

                          // pickup time
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pickup Time',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                SizedBox(height: 10),

                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter time',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(193, 200, 214, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(193, 200, 214, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 25),

                      //   Add Notes
                      Text(
                        'Additional Notes',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(height: 10),

                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter notes',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(193, 200, 214, 1),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(193, 200, 214, 1),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
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
