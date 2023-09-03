import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/report/bottom_report/bottom_report_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_report_post_model.dart';
export 'bottom_report_post_model.dart';

class BottomReportPostWidget extends StatefulWidget {
  const BottomReportPostWidget({
    Key? key,
    this.post,
    this.commentPost,
    this.typeReport,
    this.user,
  }) : super(key: key);

  final DocumentReference? post;
  final DocumentReference? commentPost;
  final String? typeReport;
  final DocumentReference? user;

  @override
  _BottomReportPostWidgetState createState() => _BottomReportPostWidgetState();
}

class _BottomReportPostWidgetState extends State<BottomReportPostWidget> {
  late BottomReportPostModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomReportPostModel());
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
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 13.0, 16.0, 50.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 32.0,
              height: 2.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).dark20,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: BottomReportWidget(
                          commentPost: widget.commentPost,
                          type: widget.typeReport!,
                          post: widget.post,
                          userRef: widget.user,
                        ),
                      );
                    },
                  ).then((value) => setState(() {}));
                },
                text: 'REPORT',
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
