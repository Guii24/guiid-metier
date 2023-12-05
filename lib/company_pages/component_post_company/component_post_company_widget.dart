import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/subscription_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/post/bottom_comment/bottom_comment_widget.dart';
import '/post/bottom_editop_delete_post/bottom_editop_delete_post_widget.dart';
import '/post/bottom_report_post/bottom_report_post_widget.dart';
import '/post/bottom_share_post/bottom_share_post_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'component_post_company_model.dart';
export 'component_post_company_model.dart';

class ComponentPostCompanyWidget extends StatefulWidget {
  const ComponentPostCompanyWidget({
    Key? key,
    this.postCompany,
  }) : super(key: key);

  final DocumentReference? postCompany;

  @override
  _ComponentPostCompanyWidgetState createState() =>
      _ComponentPostCompanyWidgetState();
}

class _ComponentPostCompanyWidgetState
    extends State<ComponentPostCompanyWidget> {
  late ComponentPostCompanyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentPostCompanyModel());
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
      stream: PostRecord.getDocument(widget.postCompany!),
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
            borderRadius: BorderRadius.circular(0.0),
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
                    height: MediaQuery.sizeOf(context).height * 0.69,
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
                              height: double.infinity,
                              child: PageView.builder(
                                controller: _model.pageViewController ??=
                                    PageController(
                                        initialPage: min(0, images.length - 1)),
                                onPageChanged: (_) => setState(() {}),
                                scrollDirection: Axis.horizontal,
                                itemCount: images.length,
                                itemBuilder: (context, imagesIndex) {
                                  final imagesItem = images[imagesIndex];
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.network(
                                      imagesItem,
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                      alignment: Alignment(0.00, 0.00),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        if (containerPostRecord.postImagesList.length > 1)
                          Align(
                            alignment: AlignmentDirectional(1.00, 1.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 16.0, 16.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Container(
                                  width: 35.0,
                                  height: 28.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).dark20,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Text(
                                      '${(_model.pageViewCurrentIndex + 1).toString()}/${containerPostRecord.postImagesList.length.toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Libre Franklin',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 13.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
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
                                    'https://firebasestorage.googleapis.com/v0/b/guiid-metier-9e72a.appspot.com/o/Photo.png?alt=media&token=5b0e8f6e-7128-4456-a7d5-373cb8fa901b&_gl=1*rkimyz*_ga*MTM0NzUzNDc1NS4xNjg4NDU4OTk3*_ga_CW55HF8NVT*MTY5NjA5NDAyMC4xNzguMS4xNjk2MDk0MDc0LjYuMC4w',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 3.0),
                                        child: Text(
                                          dateTimeFormat(
                                              'relative',
                                              containerPostRecord
                                                  .postTimePosted!),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Libre Franklin',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .dark68,
                                                fontSize: 14.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (valueOrDefault(
                                      currentUserDocument?.userType, '') ==
                                  'User')
                                AuthUserStreamWidget(
                                  builder: (context) => Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (!(currentUserDocument?.userFollowing
                                                      ?.toList() ??
                                                  [])
                                              .contains(columnUsersRecord
                                                  .reference) &&
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
                                            await actions.updatePage(
                                              context,
                                            );

                                            await NotificationRecord.collection
                                                .doc()
                                                .set(
                                                    createNotificationRecordData(
                                                  notificationFrom:
                                                      currentUserReference,
                                                  notificationType: 'following',
                                                  notificationCreationDate:
                                                      getCurrentTimestamp,
                                                  notificationTo:
                                                      columnUsersRecord
                                                          .reference,
                                                ));
                                            if (columnUsersRecord
                                                .userNotification) {
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 6.0, 10.0, 6.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0x00FFFFFF),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                      if ((currentUserDocument?.userFollowing
                                                      ?.toList() ??
                                                  [])
                                              .contains(columnUsersRecord
                                                  .reference) &&
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

                                            await columnUsersRecord.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'user_followers':
                                                      FieldValue.arrayRemove([
                                                    currentUserReference
                                                  ]),
                                                },
                                              ),
                                            });
                                            await actions.updatePage(
                                              context,
                                            );
                                          },
                                          text: 'FOLLOWING',
                                          options: FFButtonOptions(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 6.0, 10.0, 6.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0x0A000000),
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .dark52,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(4.0),
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
                                        columnUsersRecord.reference) {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Color(0x01000000),
                                        barrierColor:
                                            FlutterFlowTheme.of(context).dark38,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
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
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: BottomReportPostWidget(
                                              post:
                                                  containerPostRecord.reference,
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
                        Text(
                          containerPostRecord.postText.maybeHandleOverflow(
                            maxChars: 84,
                            replacement: '…',
                          ),
                          maxLines: 2,
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
                          child: Builder(
                            builder: (context) {
                              final listcat = containerPostRecord.postCategory
                                  .toList()
                                  .take(3)
                                  .toList();
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(listcat.length,
                                    (listcatIndex) {
                                  final listcatItem = listcat[listcatIndex];
                                  return Text(
                                    listcatIndex ==
                                            (containerPostRecord
                                                    .postCategory.length -
                                                1)
                                        ? listcatItem
                                        : '${listcatItem}・',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Libre Franklin',
                                          color: FlutterFlowTheme.of(context)
                                              .dark52,
                                          fontSize: 14.0,
                                        ),
                                  );
                                }),
                              );
                            },
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
                                      currentUserDocument
                                          ?.userBlockedUserByAdmin,
                                      false)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Your account has been suspended. Please, contact support.',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Libre Franklin',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 14.0,
                                              ),
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  } else {
                                    if (valueOrDefault<bool>(
                                        currentUserDocument?.userSubscription,
                                        false)) {
                                      await containerPostRecord.reference
                                          .update({
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
                                            notificationType: 'liked',
                                            notificationCreationDate:
                                                getCurrentTimestamp,
                                            notificationTo:
                                                columnUsersRecord.reference,
                                            notificationPost:
                                                containerPostRecord.reference,
                                          ));
                                      if (columnUsersRecord.userNotification) {
                                        triggerPushNotification(
                                          notificationTitle:
                                              currentUserDisplayName,
                                          notificationText:
                                              'activated your post',
                                          userRefs: [
                                            columnUsersRecord.reference
                                          ],
                                          initialPageName: 'MainPage',
                                          parameterData: {},
                                        );
                                      }
                                    } else {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor:
                                            FlutterFlowTheme.of(context)
                                                .customColorBottomSh,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 0.0, 0.0),
                              child: Text(
                                '${formatNumber(
                                  containerPostRecord.postActivities.length,
                                  formatType: FormatType.compact,
                                )} activities',
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
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (valueOrDefault<bool>(
                                        currentUserDocument
                                            ?.userBlockedUserByAdmin,
                                        false)) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Your account has been suspended. Please, contact support.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 14.0,
                                                ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                    } else {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Color(0x01000000),
                                        barrierColor:
                                            FlutterFlowTheme.of(context).dark38,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: BottomCommentWidget(
                                              post:
                                                  containerPostRecord.reference,
                                              userRef: columnUsersRecord,
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    }
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Color(0x01000000),
                                            barrierColor:
                                                FlutterFlowTheme.of(context)
                                                    .dark38,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: BottomCommentWidget(
                                                  post: containerPostRecord
                                                      .reference,
                                                  userRef: columnUsersRecord,
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Icon(
                                          FFIcons.kproperty1comments,
                                          color: FlutterFlowTheme.of(context)
                                              .dark88,
                                          size: 24.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Color(0x01000000),
                                              barrierColor:
                                                  FlutterFlowTheme.of(context)
                                                      .dark38,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: BottomCommentWidget(
                                                    post: containerPostRecord
                                                        .reference,
                                                    userRef: columnUsersRecord,
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Text(
                                            '${formatNumber(
                                              containerPostRecord
                                                  .postCommentsList.length,
                                              formatType: FormatType.compact,
                                            )} comments',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .dark68,
                                                  fontSize: 14.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
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
                                    currentUserDocument?.userBlockedUserByAdmin,
                                    false)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Your account has been suspended. Please, contact support.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 14.0,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 3000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                } else {
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
