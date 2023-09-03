import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/company_pages/bottom_editor_delete_job/bottom_editor_delete_job_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'component_sourcing_model.dart';
export 'component_sourcing_model.dart';

class ComponentSourcingWidget extends StatefulWidget {
  const ComponentSourcingWidget({
    Key? key,
    required this.jobDoc,
  }) : super(key: key);

  final JobRecord? jobDoc;

  @override
  _ComponentSourcingWidgetState createState() =>
      _ComponentSourcingWidgetState();
}

class _ComponentSourcingWidgetState extends State<ComponentSourcingWidget> {
  late ComponentSourcingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentSourcingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).line,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.jobDoc?.jobTittle,
                        'tittle error',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Libre Franklin',
                            color: FlutterFlowTheme.of(context).dark88,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    if (widget.jobDoc?.companyCreator == currentUserReference)
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: FlutterFlowTheme.of(context).dark38,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: BottomEditorDeleteJobWidget(
                                  jobDoc: widget.jobDoc,
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: Icon(
                          FFIcons.kproperty1more,
                          color: Colors.black,
                          size: 24.0,
                        ),
                      ),
                  ],
                ),
              ),
              Text(
                valueOrDefault<String>(
                  widget.jobDoc?.jobLocation,
                  'location error',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Libre Franklin',
                      color: FlutterFlowTheme.of(context).dark88,
                      fontSize: 14.0,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 16.0),
                child: Builder(
                  builder: (context) {
                    final salaryJobTypes = functions
                        .returnJobType(widget.jobDoc!.jobSalaryRate,
                            widget.jobDoc!.jobType.toList())
                        .toList();
                    return Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: List.generate(salaryJobTypes.length,
                          (salaryJobTypesIndex) {
                        final salaryJobTypesItem =
                            salaryJobTypes[salaryJobTypesIndex];
                        return Material(
                          color: Colors.transparent,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Container(
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFDFEAE3),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 5.0, 8.0, 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    FFIcons.kproperty1salary,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 20.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        6.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.jobDoc?.jobSalaryRate,
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Libre Franklin',
                                            color: FlutterFlowTheme.of(context)
                                                .dark88,
                                            fontSize: 13.0,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: StreamBuilder<UsersRecord>(
                  stream:
                      UsersRecord.getDocument(widget.jobDoc!.companyCreator!),
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
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl: valueOrDefault<String>(
                              rowUsersRecord.photoUrl,
                              'https://firebasestorage.googleapis.com/v0/b/guiid-metier.appspot.com/o/Photo.png?alt=media&token=06d1ab4a-f642-4092-b1a7-9176c3b62d2f',
                            ),
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
                                    color: FlutterFlowTheme.of(context).dark88,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              dateTimeFormat(
                                  'relative', widget.jobDoc!.jobCreationDate!),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    color: FlutterFlowTheme.of(context).dark68,
                                    fontSize: 13.0,
                                  ),
                            ),
                            if (widget.jobDoc?.companyCreator ==
                                currentUserReference)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 3.0, 0.0, 0.0),
                                child: Text(
                                  '${valueOrDefault<String>(
                                    widget.jobDoc?.jobApplicantsUserList?.length
                                        ?.toString(),
                                    '0',
                                  )} Applicants',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Libre Franklin',
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        fontSize: 13.0,
                                      ),
                                ),
                              ),
                          ],
                        ),
                      ],
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
