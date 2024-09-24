import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'component_follow_model.dart';
export 'component_follow_model.dart';

class ComponentFollowWidget extends StatefulWidget {
  const ComponentFollowWidget({
    super.key,
    required this.userRef,
  });

  final DocumentReference? userRef;

  @override
  State<ComponentFollowWidget> createState() => _ComponentFollowWidgetState();
}

class _ComponentFollowWidgetState extends State<ComponentFollowWidget> {
  late ComponentFollowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentFollowModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget!.userRef!),
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

        final containerUsersRecord = snapshot.data!;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              if (currentUserReference != widget!.userRef) {
                if (containerUsersRecord.userType == 'User') {
                  context.pushNamed(
                    'OtherProfile',
                    queryParameters: {
                      'userRef': serializeParam(
                        widget!.userRef,
                        ParamType.DocumentReference,
                      ),
                    }.withoutNulls,
                  );
                } else {
                  context.pushNamed(
                    'OtherProfileCompany',
                    queryParameters: {
                      'userRef': serializeParam(
                        widget!.userRef,
                        ParamType.DocumentReference,
                      ),
                    }.withoutNulls,
                  );
                }
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CachedNetworkImage(
                    fadeInDuration: Duration(milliseconds: 500),
                    fadeOutDuration: Duration(milliseconds: 500),
                    imageUrl: valueOrDefault<String>(
                      containerUsersRecord.photoUrl,
                      'https://firebasestorage.googleapis.com/v0/b/guiid-metier-9e72a.appspot.com/o/Photo.png?alt=media&token=5b0e8f6e-7128-4456-a7d5-373cb8fa901b&_gl=1*rkimyz*_ga*MTM0NzUzNDc1NS4xNjg4NDU4OTk3*_ga_CW55HF8NVT*MTY5NjA5NDAyMC4xNzguMS4xNjk2MDk0MDc0LjYuMC4w',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: Text(
                              containerUsersRecord.displayName,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    color: FlutterFlowTheme.of(context).dark88,
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                        Text(
                          containerUsersRecord.userLocation,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Libre Franklin',
                                    color: FlutterFlowTheme.of(context).dark68,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (!(currentUserDocument?.userFollowing?.toList() ?? [])
                        .contains(widget!.userRef) &&
                    (widget!.userRef != currentUserReference))
                  AuthUserStreamWidget(
                    builder: (context) => FFButtonWidget(
                      onPressed: () async {
                        await currentUserReference!.update({
                          ...mapToFirestore(
                            {
                              'user_following':
                                  FieldValue.arrayUnion([widget!.userRef]),
                            },
                          ),
                        });

                        await widget!.userRef!.update({
                          ...mapToFirestore(
                            {
                              'user_followers':
                                  FieldValue.arrayUnion([currentUserReference]),
                            },
                          ),
                        });

                        await NotificationRecord.collection
                            .doc()
                            .set(createNotificationRecordData(
                              notificationFrom: currentUserReference,
                              notificationType: 'following',
                              notificationCreationDate: getCurrentTimestamp,
                              notificationTo: containerUsersRecord.reference,
                            ));
                        if (containerUsersRecord.userNotification) {
                          triggerPushNotification(
                            notificationTitle: currentUserDisplayName,
                            notificationText: 'started following you',
                            userRefs: [containerUsersRecord.reference],
                            initialPageName: 'MainPage',
                            parameterData: {},
                          );
                        }
                      },
                      text: 'FOLLOW',
                      options: FFButtonOptions(
                        width: 112.0,
                        height: 33.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).customColorBottomSh,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Libre Franklin',
                                  color: FlutterFlowTheme.of(context).dark88,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).dark52,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                if ((currentUserDocument?.userFollowing?.toList() ?? [])
                        .contains(widget!.userRef) &&
                    (widget!.userRef != currentUserReference))
                  AuthUserStreamWidget(
                    builder: (context) => FFButtonWidget(
                      onPressed: () async {
                        await currentUserReference!.update({
                          ...mapToFirestore(
                            {
                              'user_following':
                                  FieldValue.arrayRemove([widget!.userRef]),
                            },
                          ),
                        });

                        await widget!.userRef!.update({
                          ...mapToFirestore(
                            {
                              'user_followers': FieldValue.arrayRemove(
                                  [currentUserReference]),
                            },
                          ),
                        });
                      },
                      text: 'FOLLOWING',
                      options: FFButtonOptions(
                        width: 112.0,
                        height: 33.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).dark6,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Libre Franklin',
                                  color: FlutterFlowTheme.of(context).dark68,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
