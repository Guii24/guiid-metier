import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_post_my_prof_model.dart';
export 'empty_post_my_prof_model.dart';

class EmptyPostMyProfWidget extends StatefulWidget {
  const EmptyPostMyProfWidget({super.key});

  @override
  State<EmptyPostMyProfWidget> createState() => _EmptyPostMyProfWidgetState();
}

class _EmptyPostMyProfWidgetState extends State<EmptyPostMyProfWidget> {
  late EmptyPostMyProfModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyPostMyProfModel());
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
              FFIcons.kicons1,
              color: Colors.black,
              size: 26.0,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 0.0),
          child: Text(
            'There are no uploaded posts',
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
