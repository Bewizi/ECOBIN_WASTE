import 'package:ecobin/screens/waste_type/waste_type.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class PickupActionsPanel extends StatefulWidget {
  const PickupActionsPanel({super.key});

  @override
  State<PickupActionsPanel> createState() => _PickupActionsPanelState();
}

class _PickupActionsPanelState extends State<PickupActionsPanel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WasteType()),
                );
              },
              child: PickUpCard(
                iconData: LucideIcons.trash,
                text: 'Request Pickup',
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: PickUpCard(
                iconData: LucideIcons.calendarDays,
                text: 'Schedule Pickup',
              ),
            ),
          ],
        ),

        SizedBox(height: 10),

        //   row two
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: PickUpCard(
                iconData: LucideIcons.mapPin,
                text: 'Dropoff Points',
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: PickUpCard(
                iconData: LucideIcons.history,
                text: 'View History',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PickUpCard extends StatelessWidget {
  const PickUpCard({super.key, required this.iconData, required this.text});

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      decoration: BoxDecoration(
        color: Color.fromRGBO(239, 245, 240, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Icon(iconData, color: Color.fromRGBO(42, 155, 74, 1)),
          SizedBox(width: 20),
          Text(
            text,
            style: TextStyle(
              color: Color.fromRGBO(87, 94, 108, 1),
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
