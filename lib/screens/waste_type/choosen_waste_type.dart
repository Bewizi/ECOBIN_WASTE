import 'package:ecobin/screens/pickup_details/pickup_details_details.dart';
import 'package:ecobin/shared/button.dart';
import 'package:ecobin/shared/text_format.dart';
import 'package:flutter/material.dart';

enum SingingCharacter { food, recyclables, organic, electronic, medical }

class ChoosenWasteType extends StatefulWidget {
  const ChoosenWasteType({super.key});

  @override
  State<ChoosenWasteType> createState() => _ChoosenWasteTypeState();
}

class _ChoosenWasteTypeState extends State<ChoosenWasteType> {
  SingingCharacter? _character = SingingCharacter.food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderText(
                  headingText: 'Household Waste Details',
                  color: Color.fromRGBO(28, 32, 42, 1),
                ),
                SubText(
                  text:
                      'Help us understand what you\'re disposing of\nso we can come prepared with the right tools\nand team',
                  color: Color.fromRGBO(87, 94, 108, 1),
                ),

                SizedBox(height: 16),
                // radio button
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(' Food wrappers'),
                      titleTextStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.food,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),

                    ListTile(
                      title: Text('Used tissues or napkins'),
                      titleTextStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.recyclables,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),

                    ListTile(
                      title: Text('Damaged household items'),
                      titleTextStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.organic,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),

                    ListTile(
                      title: Text('Old clothes or fabrics'),
                      titleTextStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.electronic,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),

                    ListTile(
                      title: Text('All kind of household waste'),
                      titleTextStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),

                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.medical,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 120),

                CompleteButton(
                  'Next',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PickupDetailsDetails();
                        },
                      ),
                    );
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
