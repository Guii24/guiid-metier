import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/post/bottom_delete_comment_post/bottom_delete_comment_post_widget.dart';
import '/post/bottom_report_post/bottom_report_post_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comment_post_model.dart';
export 'comment_post_model.dart';

class CommentPostWidget extends StatefulWidget {
  const CommentPostWidget({
    super.key,
    this.commentPostref,
    this.postref,
  });

  final DocumentReference? commentPostref;
  final DocumentReference? postref;

  @override
  State<CommentPostWidget> createState() => _CommentPostWidgetState();
}

class _CommentPostWidgetState extends State<CommentPostWidget> {
  late CommentPostModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentPostModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CommentPostRecord>(
      stream: CommentPostRecord.getDocument(widget!.commentPostref!),
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

        final containerCommentPostRecord = snapshot.data!;

        return Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: StreamBuilder<UsersRecord>(
            stream: UsersRecord.getDocument(
                containerCommentPostRecord.commentPostUser!),
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

              final columnUsersRecord = snapshot.data!;

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40.0,
                        height: 40.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          valueOrDefault<String>(
                            columnUsersRecord.photoUrl,
                            'https://firebasestorage.googleapis.com/v0/b/guiid-metier-9e72a.appspot.com/o/Photo.png?alt=media&token=5b0e8f6e-7128-4456-a7d5-373cb8fa901b&_gl=1*rkimyz*_ga*MTM0NzUzNDc1NS4xNjg4NDU4OTk3*_ga_CW55HF8NVT*MTY5NjA5NDAyMC4xNzguMS4xNjk2MDk0MDc0LjYuMC4w',
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 3.0),
                                child: Text(
                                  columnUsersRecord.displayName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Libre Franklin',
                                        color:
                                            FlutterFlowTheme.of(context).dark88,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Text(
                                dateTimeFormat(
                                          "yMd",
                                          containerCommentPostRecord
                                              .commentPostTime,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ) ==
                                        dateTimeFormat(
                                          "yMd",
                                          getCurrentTimestamp,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        )
                                    ? 'Today at ${dateTimeFormat(
                                        "jm",
                                        containerCommentPostRecord
                                            .commentPostTime,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )}'
                                    : '${dateTimeFormat(
                                        "d/M/y",
                                        containerCommentPostRecord
                                            .commentPostTime,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )} at ${dateTimeFormat(
                                        "jm",
                                        containerCommentPostRecord
                                            .commentPostTime,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Libre Franklin',
                                      color:
                                          FlutterFlowTheme.of(context).dark68,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (currentUserReference ==
                              containerCommentPostRecord.commentPostUser) {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Color(0x01000000),
                              barrierColor: FlutterFlowTheme.of(context).dark38,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: BottomDeleteCommentPostWidget(
                                    commentref:
                                        containerCommentPostRecord.reference,
                                    postref: widget!.postref,
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          } else {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Color(0x01000000),
                              barrierColor: FlutterFlowTheme.of(context).dark38,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: BottomReportPostWidget(
                                    commentPost:
                                        containerCommentPostRecord.reference,
                                    typeReport: 'CommentPost',
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          }
                        },
                        child: Icon(
                          FFIcons.kproperty1more,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Text(
                      containerCommentPostRecord.commentPostText,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Libre Franklin',
                            color: FlutterFlowTheme.of(context).dark88,
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                            lineHeight: 1.4,
                          ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
