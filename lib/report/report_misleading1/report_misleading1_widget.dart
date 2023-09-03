import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/report/bottom_report/bottom_report_widget.dart';
import '/report/custom_dialog_reportsent/custom_dialog_reportsent_widget.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'report_misleading1_model.dart';
export 'report_misleading1_model.dart';

class ReportMisleading1Widget extends StatefulWidget {
  const ReportMisleading1Widget({
    Key? key,
    this.post,
    this.type,
    this.commentpost,
    this.reportType,
    this.textType,
    this.userRef,
  }) : super(key: key);

  final DocumentReference? post;
  final String? type;
  final DocumentReference? commentpost;
  final String? reportType;
  final String? textType;
  final DocumentReference? userRef;

  @override
  _ReportMisleading1WidgetState createState() =>
      _ReportMisleading1WidgetState();
}

class _ReportMisleading1WidgetState extends State<ReportMisleading1Widget> {
  late ReportMisleading1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportMisleading1Model());
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
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: BottomReportWidget(
                              commentPost: widget.commentpost,
                              type: widget.type!,
                              post: widget.post,
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    child: Icon(
                      FFIcons.kchevronLeft,
                      color: FlutterFlowTheme.of(context).dark88,
                      size: 24.0,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.reportType!,
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
                widget.textType!,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Libre Franklin',
                      color: FlutterFlowTheme.of(context).dark68,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
            Spacer(),
            Builder(
              builder: (context) => FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                  showAlignedDialog(
                    barrierColor: Color(0x02000000),
                    barrierDismissible: false,
                    context: context,
                    isGlobal: true,
                    avoidOverflow: false,
                    targetAnchor: AlignmentDirectional(0.0, 0.0)
                        .resolve(Directionality.of(context)),
                    followerAnchor: AlignmentDirectional(0.0, -1.0)
                        .resolve(Directionality.of(context)),
                    builder: (dialogContext) {
                      return Material(
                        color: Colors.transparent,
                        child: CustomDialogReportsentWidget(),
                      );
                    },
                  ).then((value) => setState(() {}));

                  await ReportRecord.collection
                      .doc()
                      .set(createReportRecordData(
                        reportFrom: currentUserReference,
                        reportTime: getCurrentTimestamp,
                        reportReason: widget.reportType,
                        reportToCommPost: widget.commentpost,
                        reportToPost: widget.post,
                        reportToUser: widget.userRef,
                      ));
                },
                text: 'SEND REPORT',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 48.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
            ),
          ],
        ),
      ),
    );
  }
}
