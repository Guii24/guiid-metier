import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/report/report_misleading1/report_misleading1_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_report_model.dart';
export 'bottom_report_model.dart';

class BottomReportWidget extends StatefulWidget {
  const BottomReportWidget({
    super.key,
    this.post,
    this.commentPost,
    required this.type,
    this.userRef,
    this.job,
  });

  final DocumentReference? post;
  final DocumentReference? commentPost;
  final String? type;
  final DocumentReference? userRef;
  final DocumentReference? job;

  @override
  State<BottomReportWidget> createState() => _BottomReportWidgetState();
}

class _BottomReportWidgetState extends State<BottomReportWidget> {
  late BottomReportModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomReportModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
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
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 13.0, 16.0, 53.0),
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 6.0),
                child: Text(
                  'Report',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Libre Franklin',
                        color: FlutterFlowTheme.of(context).dark88,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Text(
                  'Your report is anonymous',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Libre Franklin',
                        color: FlutterFlowTheme.of(context).dark68,
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    final listreport = FFAppState().listTypeReport.toList();
                    return ListView.builder(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        0,
                        0,
                        20.0,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listreport.length,
                      itemBuilder: (context, listreportIndex) {
                        final listreportItem = listreport[listreportIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context);
                            setState(() {
                              FFAppState().choosenListReport = listreportItem;
                            });
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Color(0x01000000),
                              barrierColor: FlutterFlowTheme.of(context).dark38,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: ReportMisleading1Widget(
                                    post: widget.post,
                                    type: widget.type,
                                    commentpost: widget.commentPost,
                                    reportType: () {
                                      if (FFAppState().choosenListReport ==
                                          'Misleading Promotions') {
                                        return 'Misleading Promotions';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Counterfeit or Unauthentic Products') {
                                        return 'Counterfeit or Unauthentic Products';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Violence, Abuse & Criminal Activity') {
                                        return 'Violence, Abuse & Criminal Activity';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Hate Speech & Harassment') {
                                        return 'Hate Speech & Harassment';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Self-harm & Suicidal Content') {
                                        return 'Self-harm & Suicidal Content';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Body Image & Eating Disorders') {
                                        return 'Body Image & Eating Disorders';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Dangerous Challenges & Activities') {
                                        return 'Dangerous Challenges & Activities';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Nudity & Sexual Content') {
                                        return 'Nudity & Sexual Content';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Graphic or Shocking Content') {
                                        return 'Graphic or Shocking Content';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Misinformation') {
                                        return 'Misinformation';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Spam & Deceptive Behavior') {
                                        return 'Spam & Deceptive Behavior';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Illegal or Regulated Goods') {
                                        return 'Illegal or Regulated Goods';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Fraud & Scams') {
                                        return 'Fraud & Scams';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Unauthorized Personal Information Sharing') {
                                        return 'Unauthorized Personal Information Sharing';
                                      } else {
                                        return 'Other';
                                      }
                                    }(),
                                    textType: () {
                                      if (FFAppState().choosenListReport ==
                                          'Misleading Promotions') {
                                        return 'Posts that falsely represent products, services, or offers to deceive viewers.';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Counterfeit or Unauthentic Products') {
                                        return 'Promotion or sale of fake products or unauthorized replicas.';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Violence, Abuse & Criminal Activity') {
                                        return 'Content that promotes, glorifies, or depicts harmful actions, crimes, or threats.';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Hate Speech & Harassment') {
                                        return 'Posts that target individuals or groups based on identity, causing distress or hatred.';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Self-harm & Suicidal Content') {
                                        return 'Material that promotes or showcases self-inflicted harm or suicidal tendencies.';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Body Image & Eating Disorders') {
                                        return 'Content that promotes unhealthy body standards or glorifies eating disorders.';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Dangerous Challenges & Activities') {
                                        return 'Posts encouraging or showcasing risky behaviors or challenges that may cause harm.';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Nudity & Sexual Content') {
                                        return 'Explicit or suggestive material inappropriate for a professional audience.';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Graphic or Shocking Content') {
                                        return 'Disturbing visuals or descriptions that may upset or shock viewers.';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Misinformation') {
                                        return 'False or misleading information presented as factual.';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Spam & Deceptive Behavior') {
                                        return 'Unwanted promotional content or attempts to deceive viewers for gain.';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Illegal or Regulated Goods') {
                                        return 'Promotion or sale of items that violate laws or regulations.';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Fraud & Scams') {
                                        return 'Attempts to deceive viewers out of money or personal information.';
                                      } else if (FFAppState()
                                              .choosenListReport ==
                                          'Unauthorized Personal Information Sharing') {
                                        return 'Distribution of someone\'s private info without their consent.';
                                      } else {
                                        return 'Any other content concerns not specified in the other categories.';
                                      }
                                    }(),
                                    userRef: widget.userRef,
                                    job: widget.job,
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Divider(
                                  height: 1.0,
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).line,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 17.0, 0.0, 17.0),
                                        child: Text(
                                          listreportItem,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Libre Franklin',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .dark88,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).dark88,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
