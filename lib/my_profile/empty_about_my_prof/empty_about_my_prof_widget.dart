import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_about_my_prof_model.dart';
export 'empty_about_my_prof_model.dart';

class EmptyAboutMyProfWidget extends StatefulWidget {
  const EmptyAboutMyProfWidget({Key? key}) : super(key: key);

  @override
  _EmptyAboutMyProfWidgetState createState() => _EmptyAboutMyProfWidgetState();
}

class _EmptyAboutMyProfWidgetState extends State<EmptyAboutMyProfWidget> {
  late EmptyAboutMyProfModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyAboutMyProfModel());
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
      children: [
        Container(
          width: 56.0,
          height: 56.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).dark6,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Icon(
              FFIcons.kproperty1aboutUs,
              color: Colors.black,
              size: 26.0,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 0.0),
          child: Text(
            'Information is not available',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Libre Franklin',
                  color: FlutterFlowTheme.of(context).dark68,
                  fontSize: 15.0,
                ),
          ),
        ),
      ],
    );
  }
}
