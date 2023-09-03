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

import 'package:guiid_metier/flutter_flow/custom_icons.dart';

class IconManagers extends StatefulWidget {
  const IconManagers({
    Key? key,
    this.width,
    this.height,
    required this.nameOfIcon,
    required this.size,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String nameOfIcon;
  final double size;

  @override
  _IconManagersState createState() => _IconManagersState();
}

Map icons = {
  'salary': FFIcons.kproperty1salary,
  'Hybrid': FFIcons.kproperty1job,
  'Full-time': FFIcons.kproperty1time,
  'Project based': FFIcons.kproperty1time,
};

class _IconManagersState extends State<IconManagers> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      icons[widget.nameOfIcon],
      // json1['icon'],
      // iconWidget,
      color: Colors.black,
      size: widget.size,
    );
  }
}
