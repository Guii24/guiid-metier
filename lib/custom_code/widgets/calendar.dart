// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class Calendar extends StatefulWidget {
  const Calendar({
    Key? key,
    this.width,
    this.height,
    required this.nowTime,
  }) : super(key: key);

  final double? width;
  final double? height;
  final DateTime nowTime;

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker(
      firstDate: DateTime(1920),
      lastDate: widget.nowTime,
      initialDate: widget.nowTime,
      onDateChanged: (date) {
        setState(() {
          FFAppState().bornDate = date;
          FFAppState().activeCalendar = true;
        });
      },
    );
  }
}
