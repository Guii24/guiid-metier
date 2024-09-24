import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_support_messages_model.dart';
export 'empty_support_messages_model.dart';

class EmptySupportMessagesWidget extends StatefulWidget {
  const EmptySupportMessagesWidget({super.key});

  @override
  State<EmptySupportMessagesWidget> createState() =>
      _EmptySupportMessagesWidgetState();
}

class _EmptySupportMessagesWidgetState
    extends State<EmptySupportMessagesWidget> {
  late EmptySupportMessagesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptySupportMessagesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 56.0,
          height: 56.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).dark6,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Icon(
              FFIcons.kproperty1comments,
              color: Colors.black,
              size: 26.0,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 0.0),
          child: Text(
            'There are no messages yet',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Libre Franklin',
                  color: FlutterFlowTheme.of(context).dark68,
                  fontSize: 15.0,
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ],
    );
  }
}
