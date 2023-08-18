import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'report_misinformation10_model.dart';
export 'report_misinformation10_model.dart';

class ReportMisinformation10Widget extends StatefulWidget {
  const ReportMisinformation10Widget({
    Key? key,
    this.post,
  }) : super(key: key);

  final DocumentReference? post;

  @override
  _ReportMisinformation10WidgetState createState() =>
      _ReportMisinformation10WidgetState();
}

class _ReportMisinformation10WidgetState
    extends State<ReportMisinformation10Widget> {
  late ReportMisinformation10Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportMisinformation10Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.37,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 13.0, 16.0, 44.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 32.0,
              height: 3.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).dark20,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 30.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      FFIcons.kchevronLeft,
                      color: FlutterFlowTheme.of(context).dark88,
                      size: 24.0,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Misinformation',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Libre Franklin',
                            color: FlutterFlowTheme.of(context).dark88,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.transparent,
                    size: 24.0,
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Text(
                'False or misleading information presented as factual.',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Libre Franklin',
                      color: FlutterFlowTheme.of(context).dark68,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
            Spacer(),
            FFButtonWidget(
              onPressed: () async {
                Navigator.pop(context);

                await ReportRecord.collection.doc().set(createReportRecordData(
                      reportFrom: currentUserReference,
                      reportTime: getCurrentTimestamp,
                      reportReason: 'Misinformation',
                      reportToPost: widget.post,
                    ));
              },
              text: 'SEND REPORT',
              options: FFButtonOptions(
                width: double.infinity,
                height: 48.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primaryText,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Libre Franklin',
                      color: Colors.white,
                      fontSize: 15.0,
                      letterSpacing: 0.5,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
