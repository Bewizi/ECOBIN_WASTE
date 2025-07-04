import 'package:flutter/material.dart';

// import 'package:intl/intl.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';

class NextPickDate extends StatefulWidget {
  const NextPickDate({super.key});

  @override
  State<NextPickDate> createState() => _NextPickDateState();
}

class _NextPickDateState extends State<NextPickDate> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Next Pickup',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 15),
          HorizontalWeekCalendar(
            minDate: DateTime(2023, 12, 31),
            maxDate: DateTime(2030, 1, 31),
            initialDate: DateTime.now(),
            onDateChange: (date) {
              setState(() {
                selectedDate = date;
              });
            },
            showTopNavbar: false,
            monthFormat: 'MMM yyy',
            showNavigationButtons: true,
            borderRadius: BorderRadius.circular(50),
            activeBackgroundColor: Color.fromRGBO(239, 245, 240, 1),
            activeTextColor: Color.fromRGBO(29, 61, 35, 1),
            inactiveBackgroundColor: Colors.transparent,
            inactiveTextColor: Color.fromRGBO(179, 188, 206, 1),
            disabledTextColor: Colors.grey,
            // disabledBackgroundColor: Colors.white,
            // activeNavigatorColor: Colors.deepPurple,
            // inactiveNavigatorColor: Colors.grey,
            // monthColor: Colors.deepPurple,
            onWeekChange: (List<DateTime> dates) {
              // print("First date: ${dates.first}");
              // print("Last date: ${dates.last}");
            },

            scrollPhysics: const BouncingScrollPhysics(),
          ),
        ],
      ),
    );
  }
}
