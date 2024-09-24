import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'botton_select_category_model.dart';
export 'botton_select_category_model.dart';

class BottonSelectCategoryWidget extends StatefulWidget {
  const BottonSelectCategoryWidget({super.key});

  @override
  State<BottonSelectCategoryWidget> createState() =>
      _BottonSelectCategoryWidgetState();
}

class _BottonSelectCategoryWidgetState
    extends State<BottonSelectCategoryWidget> {
  late BottonSelectCategoryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottonSelectCategoryModel());
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
      height: MediaQuery.sizeOf(context).height * 0.753,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 34.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 13.0, 0.0, 0.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    width: 41.0,
                    height: 3.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).dark20,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 10.0),
                      child: Text(
                        'Select purpose',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Libre Franklin',
                              color: FlutterFlowTheme.of(context).dark88,
                              fontSize: 17.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        final purpose = FFAppState().ListPurpose.toList();

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: purpose.length,
                          itemBuilder: (context, purposeIndex) {
                            final purposeItem = purpose[purposeIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (FFAppState().choosenPurpose !=
                                    purposeItem) {
                                  FFAppState().choosenPurpose = purposeItem;
                                  safeSetState(() {});
                                } else {
                                  FFAppState().choosenPurpose = '';
                                  safeSetState(() {});
                                }
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 20.0),
                                          child: Text(
                                            purposeItem,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .dark88,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      if (FFAppState().choosenPurpose !=
                                          purposeItem)
                                        Icon(
                                          Icons.check_box_outline_blank,
                                          color: FlutterFlowTheme.of(context)
                                              .dark12,
                                          size: 22.0,
                                        ),
                                      if (FFAppState().choosenPurpose ==
                                          purposeItem)
                                        Icon(
                                          Icons.check_box_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .dark88,
                                          size: 22.0,
                                        ),
                                    ],
                                  ),
                                  Divider(
                                    height: 1.0,
                                    thickness: 1.0,
                                    color: FlutterFlowTheme.of(context).line,
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 10.0),
                      child: Text(
                        'Select category',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Libre Franklin',
                              color: FlutterFlowTheme.of(context).dark88,
                              fontSize: 17.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    Text(
                      'Max of 2',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Libre Franklin',
                            color: FlutterFlowTheme.of(context).dark38,
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Builder(
                      builder: (context) {
                        final category = FFAppState().preference.toList();

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: category.length,
                          itemBuilder: (context, categoryIndex) {
                            final categoryItem = category[categoryIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (FFAppState()
                                    .choosenPreference
                                    .contains(categoryItem)) {
                                  FFAppState().removeFromChoosenPreference(
                                      categoryItem);
                                  safeSetState(() {});
                                } else {
                                  if (FFAppState().choosenPreference.length <
                                      2) {
                                    FFAppState()
                                        .addToChoosenPreference(categoryItem);
                                    safeSetState(() {});
                                  }
                                }
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 20.0),
                                          child: Text(
                                            categoryItem,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .dark88,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      if (!FFAppState()
                                          .choosenPreference
                                          .contains(categoryItem))
                                        Icon(
                                          Icons.check_box_outline_blank,
                                          color: FlutterFlowTheme.of(context)
                                              .dark12,
                                          size: 22.0,
                                        ),
                                      if (FFAppState()
                                          .choosenPreference
                                          .contains(categoryItem))
                                        Icon(
                                          Icons.check_box_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .dark88,
                                          size: 22.0,
                                        ),
                                    ],
                                  ),
                                  Divider(
                                    height: 1.0,
                                    thickness: 1.0,
                                    color: FlutterFlowTheme.of(context).line,
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
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
                        letterSpacing: 1.0,
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
