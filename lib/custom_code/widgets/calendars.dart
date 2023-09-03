// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class Calendars extends StatefulWidget {
  const Calendars({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _CalendarsState createState() => _CalendarsState();
}

class _CalendarsState extends State<Calendars> {
  // Private state variable
  List<DateTime?> _selectedDates = [DateTime.now()];

  @override
  Widget build(BuildContext context) {
    final config = CalendarDatePicker2Config(
      centerAlignModePicker: true,
      selectedDayHighlightColor: Colors.black,
      weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
      firstDayOfWeek: 1,
      controlsHeight: 65,
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
      ),
      dayBorderRadius: BorderRadius.all(Radius.circular(3)),
      dayTextStyle: const TextStyle(
        color: Colors.black,
      ),
      disabledDayTextStyle: const TextStyle(
        color: Colors.grey,
      ),
      selectableDayPredicate: (day) =>
          day.isBefore(DateTime.now().subtract(const Duration(days: 1))),
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CalendarDatePicker2(
            config: config,
            value: _selectedDates,
            onValueChanged: (dates) {
              setState(() {
                _selectedDates = dates;
                FFAppState().bornDate = dates[0];
                FFAppState().activeCalendar = true;
              });
              Future.delayed(Duration(milliseconds: 100), () {
                Navigator.pop(context); // Close the current screen
              });
            }),
        const SizedBox(height: 10),
      ],
    );
  }
}
