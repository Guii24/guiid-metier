import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_job_details_model.dart';
export 'bottom_job_details_model.dart';

class BottomJobDetailsWidget extends StatefulWidget {
  const BottomJobDetailsWidget({
    Key? key,
    required this.jobDoc,
  }) : super(key: key);

  final JobRecord? jobDoc;

  @override
  _BottomJobDetailsWidgetState createState() => _BottomJobDetailsWidgetState();
}

class _BottomJobDetailsWidgetState extends State<BottomJobDetailsWidget> {
  late BottomJobDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomJobDetailsModel());
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
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 13.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 32.0,
                height: 2.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).dark20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 44.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.jobDoc?.jobTittle,
                          'tittle error',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Libre Franklin',
                              color: FlutterFlowTheme.of(context).dark88,
                              fontSize: 21.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.jobDoc?.jobLocation,
                          'location error',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Libre Franklin',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 15.0,
                            ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Container(
                        height: 34.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFDFEAE3),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 5.0, 8.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                FFIcons.kproperty1salary,
                                color: Colors.black,
                                size: 22.0,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    6.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.jobDoc?.jobSalaryRate,
                                    'salary error',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Libre Franklin',
                                        color:
                                            FlutterFlowTheme.of(context).dark88,
                                        fontSize: 14.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 20.0),
                      child: Builder(
                        builder: (context) {
                          final type = widget.jobDoc?.jobType?.toList() ?? [];
                          return Wrap(
                            spacing: 10.0,
                            runSpacing: 10.0,
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.none,
                            children: List.generate(type.length, (typeIndex) {
                              final typeItem = type[typeIndex];
                              return Material(
                                color: Colors.transparent,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Container(
                                  height: 34.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context).line,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 5.0, 8.0, 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 20.0,
                                          height: 20.0,
                                          child: custom_widgets.IconManagers(
                                            width: 20.0,
                                            height: 20.0,
                                            nameOfIcon: typeItem,
                                            size: 20.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            typeItem,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .dark88,
                                                  fontSize: 14.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                    Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).line,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                      child: StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(
                            widget.jobDoc!.companyCreator!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 30.0,
                                height: 30.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          final rowUsersRecord = snapshot.data!;
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 40.0,
                                height: 40.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  rowUsersRecord.photoUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    rowUsersRecord.displayName,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Libre Franklin',
                                          color: FlutterFlowTheme.of(context)
                                              .dark88,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                              Text(
                                dateTimeFormat('relative',
                                    widget.jobDoc!.jobCreationDate!),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Libre Franklin',
                                      color:
                                          FlutterFlowTheme.of(context).dark68,
                                      fontSize: 13.0,
                                    ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).line,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Text(
                        'Job description',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Libre Franklin',
                              color: FlutterFlowTheme.of(context).dark88,
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 20.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.jobDoc?.jobDescription,
                          'description error ',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Libre Franklin',
                              color: FlutterFlowTheme.of(context).dark68,
                              fontSize: 15.0,
                              fontWeight: FontWeight.normal,
                              lineHeight: 1.5,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: Text(
                        'Contact',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Libre Franklin',
                              color: FlutterFlowTheme.of(context).dark88,
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 16.0, 0.0),
                            child: Icon(
                              FFIcons.kproperty1phone,
                              color: Colors.black,
                              size: 24.0,
                            ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.jobDoc?.jobContactPhoneNumber,
                              'phone error',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  color: FlutterFlowTheme.of(context).dark68,
                                  fontSize: 15.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 28.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 16.0, 0.0),
                            child: Icon(
                              FFIcons.kproperty1email,
                              color: Colors.black,
                              size: 24.0,
                            ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget.jobDoc?.jobContactEmail,
                              'email error',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  color: FlutterFlowTheme.of(context).dark68,
                                  fontSize: 15.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                    if (!widget.jobDoc!.jobApplicantsUserList
                        .contains(currentUserReference))
                      FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);

                          context.pushNamed(
                            'JobForm',
                            queryParameters: {
                              'jobDoc': serializeParam(
                                widget.jobDoc,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'jobDoc': widget.jobDoc,
                            },
                          );
                        },
                        text: 'APPLY',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryText,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Libre Franklin',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 15.0,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    if (widget.jobDoc?.jobApplicantsUserList
                            ?.contains(currentUserReference) ??
                        true)
                      FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'You\'ve already applied',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0x07000000),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Libre Franklin',
                                    color: FlutterFlowTheme.of(context).dark52,
                                    fontSize: 15.0,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
