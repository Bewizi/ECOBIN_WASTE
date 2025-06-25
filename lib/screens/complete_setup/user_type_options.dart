import 'package:ecobin/screens/home/home.dart';
import 'package:ecobin/shared/button.dart';
import 'package:flutter/material.dart';

class UserTypeOptions extends StatefulWidget {
  const UserTypeOptions({super.key});

  @override
  State<UserTypeOptions> createState() => _UserTypeOptionsState();
}

class _UserTypeOptionsState extends State<UserTypeOptions> {
  String selectedOption = '';

  void optionSelected(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => optionSelected('Individual'),
          child: Card(
            color: selectedOption == 'Individual'
                ? Color.fromRGBO(242, 244, 247, 1)
                : Color.fromRGBO(242, 244, 247, 0.5),
            shadowColor: Colors.white,
            surfaceTintColor: Colors.white,
            child: SampleCard(
              cardName: 'Individual',
              icons: Icons.home,
              description: 'Single user managing personal waste',
              isSelected: selectedOption == 'Individual',
            ),
          ),
        ),
        SizedBox(height: 20),

        GestureDetector(
          onTap: () => optionSelected('Business'),
          child: Card(
            color: selectedOption == 'Business'
                ? Color.fromRGBO(242, 244, 247, 1)
                : Color.fromRGBO(242, 244, 247, 0.5),
            shadowColor: Colors.white,
            surfaceTintColor: Colors.white,
            child: SampleCard(
              cardName: 'Business',
              icons: Icons.business,
              description: 'For offices, stores, and commercial space',
              isSelected: selectedOption == 'Business',
            ),
          ),
        ),

        SizedBox(height: 20),

        GestureDetector(
          onTap: () => optionSelected('Household'),
          child: Card(
            color: selectedOption == 'Household'
                ? Color.fromRGBO(242, 244, 247, 1)
                : Color.fromRGBO(242, 244, 247, 0.5),
            shadowColor: Colors.white,
            surfaceTintColor: Colors.white,
            child: SampleCard(
              cardName: 'Household',
              icons: Icons.groups_rounded,
              description: 'Family or shared living space',
              isSelected: selectedOption == 'Household',
            ),
          ),
        ),

        SizedBox(height: 150),

        CompleteButton(
          'Continue',
          onPressed: selectedOption.isNotEmpty
              ? () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (ctx) => Home('')),
                    (route) => false,
                  );
                }
              : null,
        ),
      ],
    );
  }
}

class SampleCard extends StatefulWidget {
  const SampleCard({
    super.key,
    required this.cardName,
    required this.icons,
    required this.description,
    required this.isSelected,
  });

  final String cardName;
  final IconData icons;
  final String description;
  final bool isSelected;

  @override
  State<SampleCard> createState() => _SampleCardState();
}

class _SampleCardState extends State<SampleCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              children: [
                Icon(
                  widget.icons,
                  size: 28,
                  color: widget.isSelected ? Colors.black : Colors.grey,
                ),
                SizedBox(width: 10),
                Text(
                  widget.cardName,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: widget.isSelected ? Colors.black : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Column(
              children: [
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: widget.isSelected
                        ? Colors.black54
                        : Color.fromRGBO(87, 94, 108, 1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
