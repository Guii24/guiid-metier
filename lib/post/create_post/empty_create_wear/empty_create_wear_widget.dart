import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_create_wear_model.dart';
export 'empty_create_wear_model.dart';

class EmptyCreateWearWidget extends StatefulWidget {
  const EmptyCreateWearWidget({Key? key}) : super(key: key);

  @override
  _EmptyCreateWearWidgetState createState() => _EmptyCreateWearWidgetState();
}

class _EmptyCreateWearWidgetState extends State<EmptyCreateWearWidget> {
  late EmptyCreateWearModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyCreateWearModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Please add a photo to continue',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Libre Franklin',
                color: FlutterFlowTheme.of(context).dark68,
                fontSize: 15.0,
              ),
        ),
      ],
    );
  }
}
