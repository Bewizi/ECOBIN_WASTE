import 'package:ecobin/screens/waste_type/choosen_waste_type.dart';
import 'package:flutter/material.dart';

class WasteType extends StatefulWidget {
  const WasteType({super.key});

  @override
  State<WasteType> createState() => _WasteTypeState();
}

class _WasteTypeState extends State<WasteType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What type of waste would\nyou like us to pick up?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(28, 32, 42, 1),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Choose the waste category below. This helps\nus prepare the right team and equipment.',
                style: TextStyle(color: Color.fromRGBO(87, 94, 108, 1)),
              ),

              SizedBox(height: 0),

              SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChoosenWasteType(),
                          ),
                        );
                      },
                      child: WasteCard(
                        headingText: 'Household Waste',
                        text:
                            'Everyday non-recyclable\nitems like food wrappers, tissues, etc',
                        image: 'assets/images/household_waste.png',
                      ),
                    ),

                    SizedBox(height: 10),

                    WasteCard(
                      headingText: 'Recyclables',
                      text:
                          'Plastic bottles, cans, glass, paper,\nand other recyclable items.',
                      image: 'assets/images/recyclables_waste.png',
                    ),

                    SizedBox(height: 10),

                    WasteCard(
                      headingText: 'Organic Waste',
                      text:
                          'Food scraps, garden waste —\ngreat for composting!',
                      image: 'assets/images/organic_waste.png',
                    ),

                    SizedBox(height: 10),

                    WasteCard(
                      headingText: 'Electronic Waste',
                      text:
                          'Food scraps, garden waste —\ngreat for composting!',
                      image: 'assets/images/electronic_waste.png',
                    ),

                    SizedBox(height: 10),

                    WasteCard(
                      headingText: 'Medical Waste',
                      text:
                          'Used masks, gloves, syringes. Must\nbe safely handled.',
                      image: 'assets/images/medical_waste.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WasteCard extends StatelessWidget {
  const WasteCard({
    super.key,
    required this.headingText,
    required this.text,
    required this.image,
  });

  final String headingText;
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Color.fromRGBO(246, 247, 249, 1),
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headingText,
                  style: TextStyle(
                    fontSize: 32,
                    color: Color.fromRGBO(28, 32, 42, 1),
                  ),
                ),
                SizedBox(height: 10),

                Text(
                  text,
                  style: TextStyle(color: Color.fromRGBO(87, 94, 108, 1)),
                ),
              ],
            ),
            Spacer(),
            Image.asset(image, width: 100),
          ],
        ),
      ),
    );
  }
}
