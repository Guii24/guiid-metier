import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'job_type_model.dart';
export 'job_type_model.dart';

class JobTypeWidget extends StatefulWidget {
  const JobTypeWidget({super.key});

  @override
  State<JobTypeWidget> createState() => _JobTypeWidgetState();
}

class _JobTypeWidgetState extends State<JobTypeWidget> {
  late JobTypeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JobTypeModel());
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
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if ((FFAppState().choosenjobtype1 != null &&
                              FFAppState().choosenjobtype1 != '') ||
                          (FFAppState().choosenjobType2 != null &&
                              FFAppState().choosenjobType2 != '')) {
                        setState(() {
                          FFAppState().choosenjobType2 = '';
                          FFAppState().choosenjobtype1 = '';
                          FFAppState().jobType3 = 'Not applicable';
                        });
                      } else {
                        setState(() {
                          FFAppState().jobType3 = 'Not applicable';
                        });
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 19.0, 0.0, 19.0),
                          child: Text(
                            'Not applicable',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  color: FlutterFlowTheme.of(context).dark88,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                        if (FFAppState().jobType3 != 'Not applicable')
                          Icon(
                            Icons.check_box_outline_blank_outlined,
                            color: FlutterFlowTheme.of(context).dark12,
                            size: 24.0,
                          ),
                        if (FFAppState().jobType3 == 'Not applicable')
                          Icon(
                            Icons.check_box_rounded,
                            color: FlutterFlowTheme.of(context).dark88,
                            size: 24.0,
                          ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1.0,
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).line,
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 30.0),
                child: Text(
                  'Work Location',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Libre Franklin',
                        color: FlutterFlowTheme.of(context).dark88,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
            Builder(
              builder: (context) {
                final jobTypes = FFAppState().jobTypeList.toList();
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: jobTypes.length,
                  itemBuilder: (context, jobTypesIndex) {
                    final jobTypesItem = jobTypes[jobTypesIndex];
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setState(() {
                              FFAppState().choosenjobtype1 = jobTypesItem;
                              FFAppState().jobType3 = '';
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 19.0, 0.0, 19.0),
                                child: Text(
                                  jobTypesItem,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Libre Franklin',
                                        color:
                                            FlutterFlowTheme.of(context).dark88,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              if (FFAppState().choosenjobtype1 != jobTypesItem)
                                Icon(
                                  Icons.check_box_outline_blank_outlined,
                                  color: FlutterFlowTheme.of(context).dark12,
                                  size: 24.0,
                                ),
                              if (FFAppState().choosenjobtype1 == jobTypesItem)
                                Icon(
                                  Icons.check_box_rounded,
                                  color: FlutterFlowTheme.of(context).dark88,
                                  size: 24.0,
                                ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).line,
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 30.0),
                child: Text(
                  'Employment Type',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Libre Franklin',
                        color: FlutterFlowTheme.of(context).dark88,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
            Builder(
              builder: (context) {
                final jobTypes2 = FFAppState().jobTypelist2.toList();
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: jobTypes2.length,
                  itemBuilder: (context, jobTypes2Index) {
                    final jobTypes2Item = jobTypes2[jobTypes2Index];
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setState(() {
                              FFAppState().choosenjobType2 = jobTypes2Item;
                              FFAppState().jobType3 = '';
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 19.0, 0.0, 19.0),
                                child: Text(
                                  jobTypes2Item,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Libre Franklin',
                                        color:
                                            FlutterFlowTheme.of(context).dark88,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              if (FFAppState().choosenjobType2 != jobTypes2Item)
                                Icon(
                                  Icons.check_box_outline_blank_outlined,
                                  color: FlutterFlowTheme.of(context).dark12,
                                  size: 24.0,
                                ),
                              if (FFAppState().choosenjobType2 == jobTypes2Item)
                                Icon(
                                  Icons.check_box_rounded,
                                  color: FlutterFlowTheme.of(context).dark88,
                                  size: 24.0,
                                ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).line,
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if ((FFAppState().choosenjobtype1 == null ||
                          FFAppState().choosenjobtype1 == '') ||
                      (FFAppState().choosenjobType2 == null ||
                          FFAppState().choosenjobType2 == '')) {
                    setState(() {
                      FFAppState().selectedJobType = FFAppState().jobType3;
                    });
                  } else {
                    setState(() {
                      FFAppState().selectedJobType =
                          '${FFAppState().choosenjobtype1}, ${FFAppState().choosenjobType2}';
                    });
                  }

                  Navigator.pop(context);
                },
                text: 'DONE',
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
