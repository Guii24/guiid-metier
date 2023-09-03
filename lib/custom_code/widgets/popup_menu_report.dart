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

class PopupMenuReport extends StatefulWidget {
  const PopupMenuReport({
    Key? key,
    this.width,
    this.height,
    required this.elevation,
    required this.action,
    required this.values,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double elevation;
  final Future<dynamic> Function() action;
  final List<String> values;

  @override
  _PopupMenuReportState createState() => _PopupMenuReportState();
}

enum SampleItem { Edit, Delete, itemThree }

class _PopupMenuReportState extends State<PopupMenuReport> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      elevation: widget.elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      onSelected: (value) async {
        setState(() => {
              FFAppState().popupSelected = ("$value"),
            });
        widget.action.call();
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
            value: 1,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Report',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Libre Franklin',
                        color: Color(0xFFF41F1F),
                        fontSize: 15,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(35, 0, 0, 0),
                  child: Icon(
                    FFIcons.kproperty1report,
                    color: FlutterFlowTheme.of(context).alternate,
                    size: 24,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
