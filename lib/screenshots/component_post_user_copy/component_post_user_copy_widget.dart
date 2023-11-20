import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/subscription_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/post/bottom_editop_delete_post/bottom_editop_delete_post_widget.dart';
import '/post/bottom_report_post/bottom_report_post_widget.dart';
import '/post/bottom_share_post/bottom_share_post_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'component_post_user_copy_model.dart';
export 'component_post_user_copy_model.dart';

class ComponentPostUserCopyWidget extends StatefulWidget {
  const ComponentPostUserCopyWidget({
    Key? key,
    required this.postDoc,
  }) : super(key: key);

  final DocumentReference? postDoc;

  @override
  _ComponentPostUserCopyWidgetState createState() =>
      _ComponentPostUserCopyWidgetState();
}

class _ComponentPostUserCopyWidgetState
    extends State<ComponentPostUserCopyWidget> {
  late ComponentPostUserCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentPostUserCopyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<PostRecord>(
      stream: PostRecord.getDocument(widget.postDoc!),
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
        final containerPostRecord = snapshot.data!;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: StreamBuilder<UsersRecord>(
            stream: UsersRecord.getDocument(containerPostRecord.postCreator!),
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
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.55,
                    child: Stack(
                      children: [
                        Builder(
                          builder: (context) {
                            final images = containerPostRecord.postImagesList
                                .toList()
                                .take(5)
                                .toList();
                            return Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.55,
                              child: PageView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                controller: _model.pageViewController ??=
                                    PageController(
                                        initialPage: min(0, images.length - 1)),
                                scrollDirection: Axis.horizontal,
                                itemCount: images.length,
                                itemBuilder: (context, imagesIndex) {
                                  final imagesItem = images[imagesIndex];
                                  return ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0),
                                    ),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        imagesItem,
                                        'https://images.unsplash.com/photo-1566206091558-7f218b696731?auto=format&fit=crop&q=80&w=2864&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                      ),
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      fit: BoxFit.cover,
                                      alignment: Alignment(0.00, 0.00),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 12.0),
                    child: Row(
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
                            valueOrDefault<String>(
                              columnUsersRecord.photoUrl,
                              'https://plus.unsplash.com/premium_photo-1675034393381-7e246fc40755?auto=format&fit=crop&q=80&w=1587&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                            ),
                            fit: BoxFit.cover,
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
                                    'Lila Martinez',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Libre Franklin',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 3.0),
                                  child: Text(
                                    '29 min ago',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Libre Franklin',
                                          color: FlutterFlowTheme.of(context)
                                              .dark68,
                                          fontSize: 14.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (valueOrDefault(currentUserDocument?.userType, '') ==
                            'User')
                          AuthUserStreamWidget(
                            builder: (context) => Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (!(currentUserDocument?.userFollowing
                                                ?.toList() ??
                                            [])
                                        .contains(
                                            columnUsersRecord.reference) &&
                                    (containerPostRecord.postCreator !=
                                        currentUserReference))
                                  FFButtonWidget(
                                    onPressed: () async {
                                      await currentUserReference!.update({
                                        ...mapToFirestore(
                                          {
                                            'user_following':
                                                FieldValue.arrayUnion([
                                              columnUsersRecord.reference
                                            ]),
                                          },
                                        ),
                                      });

                                      await columnUsersRecord.reference.update({
                                        ...mapToFirestore(
                                          {
                                            'user_followers':
                                                FieldValue.arrayUnion(
                                                    [currentUserReference]),
                                          },
                                        ),
                                      });
                                      await actions.updatePage(
                                        context,
                                      );

                                      await NotificationRecord.collection
                                          .doc()
                                          .set(createNotificationRecordData(
                                            notificationFrom:
                                                currentUserReference,
                                            notificationTo:
                                                columnUsersRecord.reference,
                                            notificationType: 'following',
                                            notificationCreationDate:
                                                getCurrentTimestamp,
                                          ));
                                      if (columnUsersRecord.userNotification) {
                                        triggerPushNotification(
                                          notificationTitle:
                                              currentUserDisplayName,
                                          notificationText:
                                              'started following you',
                                          userRefs: [
                                            columnUsersRecord.reference
                                          ],
                                          initialPageName: 'MainPage',
                                          parameterData: {},
                                        );
                                      }
                                    },
                                    text: 'FOLLOW',
                                    options: FFButtonOptions(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 6.0, 10.0, 6.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0x00FFFFFF),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Libre Franklin',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                                if ((currentUserDocument?.userFollowing
                                                ?.toList() ??
                                            [])
                                        .contains(
                                            columnUsersRecord.reference) &&
                                    (containerPostRecord.postCreator !=
                                        currentUserReference))
                                  FFButtonWidget(
                                    onPressed: () async {
                                      await currentUserReference!.update({
                                        ...mapToFirestore(
                                          {
                                            'user_following':
                                                FieldValue.arrayRemove([
                                              columnUsersRecord.reference
                                            ]),
                                          },
                                        ),
                                      });

                                      await columnUsersRecord.reference.update({
                                        ...mapToFirestore(
                                          {
                                            'user_followers':
                                                FieldValue.arrayRemove(
                                                    [currentUserReference]),
                                          },
                                        ),
                                      });
                                      await actions.updatePage(
                                        context,
                                      );
                                    },
                                    text: 'FOLLOWING',
                                    options: FFButtonOptions(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 6.0, 10.0, 6.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0x0A000000),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Libre Franklin',
                                            color: FlutterFlowTheme.of(context)
                                                .dark52,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (currentUserReference ==
                                  containerPostRecord.postCreator) {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Color(0x01000000),
                                  barrierColor:
                                      FlutterFlowTheme.of(context).dark38,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: BottomEditopDeletePostWidget(
                                        post: containerPostRecord,
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              } else {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Color(0x01000000),
                                  barrierColor:
                                      FlutterFlowTheme.of(context).dark38,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: BottomReportPostWidget(
                                        post: containerPostRecord.reference,
                                        typeReport: 'Post',
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              }
                            },
                            child: Icon(
                              FFIcons.kproperty1more,
                              color: Colors.black,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wrapped up an incredible photoshoot today with a team that truly understands the essence of fashion. The energy on set was electric, and I\'m eager to share the final looks with everyone. Fashion, to me, is as much about collaboration as it is about individual creativity.',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Libre Franklin',
                                    color: FlutterFlowTheme.of(context).dark88,
                                    fontSize: 14.0,
                                    lineHeight: 1.4,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 15.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Trends・Style・Designers',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Libre Franklin',
                                      color:
                                          FlutterFlowTheme.of(context).dark52,
                                      fontSize: 14.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (containerPostRecord.postActivities
                                .contains(currentUserReference))
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await containerPostRecord.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'post_activities':
                                            FieldValue.arrayRemove(
                                                [currentUserReference]),
                                      },
                                    ),
                                  });
                                },
                                child: Icon(
                                  FFIcons.kbatteryActivityFill,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 25.0,
                                ),
                              ),
                            if (!containerPostRecord.postActivities
                                .contains(currentUserReference))
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (valueOrDefault<bool>(
                                      currentUserDocument?.userSubscription,
                                      false)) {
                                    await containerPostRecord.reference.update({
                                      ...mapToFirestore(
                                        {
                                          'post_activities':
                                              FieldValue.arrayUnion(
                                                  [currentUserReference]),
                                        },
                                      ),
                                    });

                                    await NotificationRecord.collection
                                        .doc()
                                        .set(createNotificationRecordData(
                                          notificationFrom:
                                              currentUserReference,
                                          notificationTo:
                                              columnUsersRecord.reference,
                                          notificationType: 'liked',
                                          notificationCreationDate:
                                              getCurrentTimestamp,
                                          notificationPost:
                                              containerPostRecord.reference,
                                        ));
                                    if (columnUsersRecord.userNotification) {
                                      triggerPushNotification(
                                        notificationTitle:
                                            currentUserDisplayName,
                                        notificationText: 'activated your post',
                                        userRefs: [columnUsersRecord.reference],
                                        initialPageName: 'MainPage',
                                        parameterData: {},
                                      );
                                    }
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
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: SubscriptionWidget(),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }
                                },
                                child: Icon(
                                  FFIcons.kbatteryactivity,
                                  color: FlutterFlowTheme.of(context).dark88,
                                  size: 24.0,
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 0.0, 0.0),
                              child: Text(
                                '256 activities',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Libre Franklin',
                                      color:
                                          FlutterFlowTheme.of(context).dark68,
                                      fontSize: 14.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                FFIcons.kproperty1comments,
                                color: FlutterFlowTheme.of(context).dark88,
                                size: 24.0,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '128 comments',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Libre Franklin',
                                        color:
                                            FlutterFlowTheme.of(context).dark68,
                                        fontSize: 14.0,
                                      ),
                                ),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                FFIcons.kproperty1share,
                                color: FlutterFlowTheme.of(context).dark88,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                if (valueOrDefault<bool>(
                                    currentUserDocument?.userSubscription,
                                    false)) {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Color(0x01000000),
                                    barrierColor:
                                        FlutterFlowTheme.of(context).dark38,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: BottomSharePostWidget(
                                          repostpost:
                                              containerPostRecord.reference,
                                          user: columnUsersRecord.reference,
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
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
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SubscriptionWidget(),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                }
                              },
                            ),
                          ],
                        ),
                      ],
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
