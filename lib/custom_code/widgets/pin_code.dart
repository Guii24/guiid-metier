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

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:pin_code_fields/pin_code_fields.dart'; // Import the package

class PinCode extends StatefulWidget {
  const PinCode({
    Key? key,
    this.width,
    this.height,
    required this.code,
    required this.onCompleted,
    required this.onChange,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String code;
  final Future<dynamic> Function() onCompleted;
  final Future<dynamic> Function() onChange;

  @override
  _PinCodeState createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
  TextEditingController? _pinCodeController;
  String? _remoteCode; // This will hold the fetched remote config value

  @override
  void initState() {
    super.initState();
    _pinCodeController = TextEditingController();
    _loadRemoteConfigValue(); // Fetch the remote config value
  }

  Future<void> _loadRemoteConfigValue() async {
    _remoteCode = await getRemoteConfigString('code');
    setState(() {});
  }

  Future<String> getRemoteConfigString(String key) async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetchAndActivate();
    String value = remoteConfig.getString(key);
    return value;
  }

  @override
  void dispose() {
    _pinCodeController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(75.0, 25.0, 75.0, 0.0),
          child: PinCodeTextField(
            appContext: context,
            length: 4,
            textStyle: TextStyle(
              fontFamily: 'Libre Franklin',
              color: FlutterFlowTheme.of(context)
                  .dark88, // Assuming FlutterFlowTheme is defined elsewhere
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            enableActiveFill: false,
            autoFocus: true,
            enablePinAutofill: true,
            errorTextSpace: 16.0,
            keyboardType: TextInputType.number,
            showCursor: true,
            cursorColor: Color(0xFFE5E9EF),
            obscureText: false,
            pinTheme: PinTheme(
              fieldHeight: 62.0,
              fieldWidth: 52.0,
              borderWidth: 1.0,
              borderRadius: BorderRadius.circular(4.0),
              shape: PinCodeFieldShape.box,
              activeColor: Color(0xFFE5E9EF),
              inactiveColor: Color(0xFFE5E9EF),
              selectedColor: Color(0xFFE5E9EF),
              activeFillColor: Color(0xFFE5E9EF),
              inactiveFillColor: Color(0xFFE5E9EF),
              selectedFillColor: Color(0xFFE5E9EF),
            ),
            controller: _pinCodeController,
            onChanged: (value) {
              setState(() {});
            }, // Add your onChanged logic if needed
            onCompleted: (pin) async {
              // Check against the remote config value as well
              if (pin == widget.code ||
                  (pin == _remoteCode && _remoteCode != null)) {
                await widget.onCompleted();
              }
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              // Add your validation logic here
            },
          ),
        ),
        if ((_pinCodeController!.text != widget.code ||
                (_pinCodeController!.text != _remoteCode &&
                    _remoteCode != null)) &&
            (_pinCodeController.text.length == 4))
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Text(
              'Wrong code, please try again',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Libre Franklin',
                    color: FlutterFlowTheme.of(context).alternate,
                    fontSize: 14,
                  ),
            ),
          ),
      ],
    );
  }
}
