import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custom_dialog_reportsent_model.dart';
export 'custom_dialog_reportsent_model.dart';

class CustomDialogReportsentWidget extends StatefulWidget {
  const CustomDialogReportsentWidget({Key? key}) : super(key: key);

  @override
  _CustomDialogReportsentWidgetState createState() =>
      _CustomDialogReportsentWidgetState();
}

class _CustomDialogReportsentWidgetState
    extends State<CustomDialogReportsentWidget> {
  late CustomDialogReportsentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomDialogReportsentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 1000));
      Navigator.pop(context);
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 55.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 64.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 25.0,
              color: Color(0x19000000),
              offset: Offset(0.0, 12.0),
              spreadRadius: 0.0,
            )
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 14.0, 10.0, 14.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 36.0,
                height: 36.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryText,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Icon(
                  Icons.check_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 22.0,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Report sent! Thank for letting us know',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Libre Franklin',
                          fontSize: 15.0,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
