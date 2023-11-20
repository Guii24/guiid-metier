import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/subscription_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'articles_component_model.dart';
export 'articles_component_model.dart';

class ArticlesComponentWidget extends StatefulWidget {
  const ArticlesComponentWidget({
    Key? key,
    this.articleDoc,
  }) : super(key: key);

  final DocumentReference? articleDoc;

  @override
  _ArticlesComponentWidgetState createState() =>
      _ArticlesComponentWidgetState();
}

class _ArticlesComponentWidgetState extends State<ArticlesComponentWidget> {
  late ArticlesComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArticlesComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<ArticlesRecord>(
      stream: ArticlesRecord.getDocument(widget.articleDoc!),
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
        final containerArticlesRecord = snapshot.data!;
        return Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.45,
                child: Stack(
                  children: [
                    if (getJsonField(
                          functions
                              .newCustomFunction(
                                  containerArticlesRecord.articleImageList
                                      .toList(),
                                  containerArticlesRecord.videos.toList())
                              .first,
                          r'''$.type''',
                        ) ==
                        getJsonField(
                          FFAppState().videoJson,
                          r'''$.type''',
                        ))
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: FlutterFlowVideoPlayer(
                            path: getJsonField(
                              functions
                                  .newCustomFunction(
                                      containerArticlesRecord.articleImageList
                                          .toList(),
                                      containerArticlesRecord.videos.toList())
                                  .first,
                              r'''$.url''',
                            ),
                            videoType: VideoType.network,
                            width: double.infinity,
                            height: double.infinity,
                            autoPlay: false,
                            looping: false,
                            showControls: false,
                            allowFullScreen: true,
                            allowPlaybackSpeedMenu: false,
                          ),
                        ),
                      ),
                    if (getJsonField(
                          functions
                              .newCustomFunction(
                                  containerArticlesRecord.articleImageList
                                      .toList(),
                                  containerArticlesRecord.videos.toList())
                              .first,
                          r'''$.type''',
                        ) ==
                        getJsonField(
                          FFAppState().imageJson,
                          r'''$.type''',
                        ))
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(
                          getJsonField(
                            functions
                                .newCustomFunction(
                                    containerArticlesRecord.articleImageList
                                        .toList(),
                                    containerArticlesRecord.videos.toList())
                                .first,
                            r'''$.url''',
                          ),
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    Align(
                      alignment: AlignmentDirectional(1.00, 1.00),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 0.0,
                        child: Container(
                          width: double.infinity,
                          height: 109.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'assets/images/34567.png',
                              ).image,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.00, 1.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 36.0, 16.0),
                        child: Text(
                          containerArticlesRecord.articleTitle,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Libre Franklin',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 15.0,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 1.4,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(13.0, 0.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (!containerArticlesRecord.articleActivities
                        .contains(currentUserReference))
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (valueOrDefault<bool>(
                              currentUserDocument?.userBlockedUserByAdmin,
                              false)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Your account has been suspended. Contact support for further info.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Libre Franklin',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 14.0,
                                      ),
                                ),
                                duration: Duration(milliseconds: 3000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          } else {
                            if (valueOrDefault<bool>(
                                currentUserDocument?.userSubscription, false)) {
                              await containerArticlesRecord.reference.update({
                                ...mapToFirestore(
                                  {
                                    'article_activities': FieldValue.arrayUnion(
                                        [currentUserReference]),
                                  },
                                ),
                              });
                              await actions.updatePage(
                                context,
                              );
                            } else {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                barrierColor: FlutterFlowTheme.of(context)
                                    .customColorBottomSh,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: SubscriptionWidget(),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            }
                          }
                        },
                        child: Icon(
                          FFIcons.kbatteryactivity,
                          color: FlutterFlowTheme.of(context).dark88,
                          size: 24.0,
                        ),
                      ),
                    if (containerArticlesRecord.articleActivities
                        .contains(currentUserReference))
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await containerArticlesRecord.reference.update({
                            ...mapToFirestore(
                              {
                                'article_activities': FieldValue.arrayRemove(
                                    [currentUserReference]),
                              },
                            ),
                          });
                          await actions.updatePage(
                            context,
                          );
                        },
                        child: Icon(
                          FFIcons.kbatteryActivityFill,
                          color: FlutterFlowTheme.of(context).alternate,
                          size: 25.0,
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(7.0, 20.0, 0.0, 20.0),
                      child: Text(
                        '${containerArticlesRecord.articleActivities.length.toString()} activities',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Libre Franklin',
                              color: FlutterFlowTheme.of(context).dark88,
                              fontSize: 14.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                      child: Icon(
                        FFIcons.kproperty1comments,
                        color: FlutterFlowTheme.of(context).dark88,
                        size: 24.0,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(7.0, 20.0, 0.0, 20.0),
                      child: Text(
                        '${containerArticlesRecord.articleCommentsList.length.toString()} comments',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Libre Franklin',
                              color: FlutterFlowTheme.of(context).dark88,
                              fontSize: 14.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
