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
import '/post/comment_post/comment_post_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'post_page_model.dart';
export 'post_page_model.dart';

class PostPageWidget extends StatefulWidget {
  const PostPageWidget({
    Key? key,
    required this.postRef,
  }) : super(key: key);

  final DocumentReference? postRef;

  @override
  _PostPageWidgetState createState() => _PostPageWidgetState();
}

class _PostPageWidgetState extends State<PostPageWidget> {
  late PostPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.commentShoePost = false;
      });
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<PostRecord>(
      stream: PostRecord.getDocument(widget.postRef!)
        ..listen((postPagePostRecord) async {
          if (_model.postPagePreviousSnapshot != null &&
              !PostRecordDocumentEquality().equals(
                  postPagePostRecord, _model.postPagePreviousSnapshot)) {
            _model.getCountCommentCopy = await queryCommentPostRecordCount(
              parent: widget.postRef,
            );

            setState(() {});
          }
          _model.postPagePreviousSnapshot = postPagePostRecord;
        }),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFF4F3EC),
            body: Center(
              child: SizedBox(
                width: 30.0,
                height: 30.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final postPagePostRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFF4F3EC),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                buttonSize: 45.0,
                icon: Icon(
                  FFIcons.kbiArrowLeft,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              actions: [
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: FlutterFlowIconButton(
                    borderRadius: 100.0,
                    buttonSize: 45.0,
                    icon: Icon(
                      FFIcons.kproperty1more,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      if (currentUserReference ==
                          postPagePostRecord.postCreator) {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Color(0x01000000),
                          barrierColor: FlutterFlowTheme.of(context).dark38,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () => _model.unfocusNode.canRequestFocus
                                  ? FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode)
                                  : FocusScope.of(context).unfocus(),
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: BottomEditopDeletePostWidget(
                                  post: postPagePostRecord,
                                ),
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
                            return GestureDetector(
                              onTap: () => _model.unfocusNode.canRequestFocus
                                  ? FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode)
                                  : FocusScope.of(context).unfocus(),
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: BottomReportPostWidget(
                                  post: postPagePostRecord.reference,
                                  typeReport: 'Post',
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      }
                    },
                  ),
                ),
              ],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: StreamBuilder<UsersRecord>(
              stream: UsersRecord.getDocument(postPagePostRecord.postCreator!),
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
                final stackUsersRecord = snapshot.data!;
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 24.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.69,
                                        child: Stack(
                                          children: [
                                            Builder(
                                              builder: (context) {
                                                final images =
                                                    postPagePostRecord
                                                        .postImagesList
                                                        .toList();
                                                return Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  child: PageView.builder(
                                                    controller: _model
                                                            .pageViewController ??=
                                                        PageController(
                                                            initialPage: min(
                                                                0,
                                                                images.length -
                                                                    1)),
                                                    onPageChanged: (_) =>
                                                        setState(() {}),
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: images.length,
                                                    itemBuilder:
                                                        (context, imagesIndex) {
                                                      final imagesItem =
                                                          images[imagesIndex];
                                                      return CachedNetworkImage(
                                                        fadeInDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        fadeOutDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        imageUrl:
                                                            valueOrDefault<
                                                                String>(
                                                          imagesItem,
                                                          'https://firebasestorage.googleapis.com/v0/b/guiid-metier-9e72a.appspot.com/o/users%2FQeM058wKO7gqEAgyByaBxHbGNKC3%2Fuploads%2Fcropped-1695291591591353_0.jpg?alt=media&token=0bc7ce18-f5e2-406d-b6cd-9e3529854676',
                                                        ),
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                            if (postPagePostRecord
                                                    .postImagesList.length >
                                                1)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.00, 1.00),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 16.0, 16.0),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 0.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Container(
                                                      width: 35.0,
                                                      height: 28.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .dark20,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.00, 0.00),
                                                        child: Text(
                                                          '${(_model.pageViewCurrentIndex + 1).toString()}/${postPagePostRecord.postImagesList.length.toString()}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Libre Franklin',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 20.0, 16.0, 20.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (postPagePostRecord
                                                    .postCreator ==
                                                currentUserReference) {
                                              context.pushNamed('MyProfile');
                                            } else {
                                              if (stackUsersRecord.userType ==
                                                  'User') {
                                                context.pushNamed(
                                                  'OtherProfile',
                                                  queryParameters: {
                                                    'userRef': serializeParam(
                                                      stackUsersRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                context.pushNamed(
                                                  'OtherProfileCompany',
                                                  queryParameters: {
                                                    'userRef': serializeParam(
                                                      stackUsersRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }
                                            }
                                          },
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
                                                    stackUsersRecord.photoUrl,
                                                    'https://firebasestorage.googleapis.com/v0/b/guiid-metier-9e72a.appspot.com/o/Photo.png?alt=media&token=5b0e8f6e-7128-4456-a7d5-373cb8fa901b',
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    3.0),
                                                        child: Text(
                                                          stackUsersRecord
                                                              .displayName,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Libre Franklin',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        dateTimeFormat(
                                                            'relative',
                                                            postPagePostRecord
                                                                .postTimePosted!),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Libre Franklin',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .dark68,
                                                                  fontSize:
                                                                      14.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              if (valueOrDefault(
                                                      currentUserDocument
                                                          ?.userType,
                                                      '') ==
                                                  'User')
                                                AuthUserStreamWidget(
                                                  builder: (context) => Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (!(currentUserDocument
                                                                      ?.userFollowing
                                                                      ?.toList() ??
                                                                  [])
                                                              .contains(
                                                                  stackUsersRecord
                                                                      .reference) &&
                                                          (postPagePostRecord
                                                                  .postCreator !=
                                                              currentUserReference))
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            await currentUserReference!
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'user_following':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    stackUsersRecord
                                                                        .reference
                                                                  ]),
                                                                },
                                                              ),
                                                            });

                                                            await stackUsersRecord
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'user_followers':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    currentUserReference
                                                                  ]),
                                                                },
                                                              ),
                                                            });
                                                            await actions
                                                                .updatePage(
                                                              context,
                                                            );

                                                            await NotificationRecord
                                                                .collection
                                                                .doc()
                                                                .set(
                                                                    createNotificationRecordData(
                                                                  notificationFrom:
                                                                      currentUserReference,
                                                                  notificationTo:
                                                                      stackUsersRecord
                                                                          .reference,
                                                                  notificationType:
                                                                      'following',
                                                                  notificationCreationDate:
                                                                      getCurrentTimestamp,
                                                                ));
                                                            if (stackUsersRecord
                                                                .userNotification) {
                                                              triggerPushNotification(
                                                                notificationTitle:
                                                                    currentUserDisplayName,
                                                                notificationText:
                                                                    'started following you',
                                                                userRefs: [
                                                                  stackUsersRecord
                                                                      .reference
                                                                ],
                                                                initialPageName:
                                                                    'MainPage',
                                                                parameterData: {},
                                                              );
                                                            }
                                                          },
                                                          text: 'FOLLOW',
                                                          options:
                                                              FFButtonOptions(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        6.0,
                                                                        10.0,
                                                                        6.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: Color(
                                                                0xE0FFFFFF),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Libre Franklin',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                        ),
                                                      if ((currentUserDocument
                                                                      ?.userFollowing
                                                                      ?.toList() ??
                                                                  [])
                                                              .contains(
                                                                  stackUsersRecord
                                                                      .reference) &&
                                                          (postPagePostRecord
                                                                  .postCreator !=
                                                              currentUserReference))
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            await currentUserReference!
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'user_following':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    stackUsersRecord
                                                                        .reference
                                                                  ]),
                                                                },
                                                              ),
                                                            });

                                                            await stackUsersRecord
                                                                .reference
                                                                .update({
                                                              ...mapToFirestore(
                                                                {
                                                                  'user_followers':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    currentUserReference
                                                                  ]),
                                                                },
                                                              ),
                                                            });
                                                            await actions
                                                                .updatePage(
                                                              context,
                                                            );
                                                          },
                                                          text: 'FOLLOWING',
                                                          options:
                                                              FFButtonOptions(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        6.0,
                                                                        10.0,
                                                                        6.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: Color(
                                                                0x0A000000),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Libre Franklin',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .dark52,
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 1.0,
                                        thickness: 1.0,
                                        indent: 16.0,
                                        endIndent: 16.0,
                                        color: Color(0x0B000000),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 15.0, 16.0, 15.0),
                                        child: Builder(
                                          builder: (context) {
                                            final item = postPagePostRecord
                                                .postCategory
                                                .toList()
                                                .take(3)
                                                .toList();
                                            return Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: List.generate(
                                                  item.length, (itemIndex) {
                                                final itemItem =
                                                    item[itemIndex];
                                                return Text(
                                                  itemIndex ==
                                                          (postPagePostRecord
                                                                  .postCategory
                                                                  .length -
                                                              1)
                                                      ? itemItem
                                                      : '${itemItem}・',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .dark52,
                                                        fontSize: 14.0,
                                                      ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Text(
                                          postPagePostRecord.postText,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Libre Franklin',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .dark68,
                                                fontSize: 15.0,
                                                lineHeight: 1.5,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 20.0, 16.0, 80.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 22.0),
                                          child: Text(
                                            '${formatNumber(
                                              postPagePostRecord
                                                  .postCommentsList.length,
                                              formatType: FormatType.compact,
                                            )} comments',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .dark88,
                                                  fontSize: 17.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        StreamBuilder<List<CommentPostRecord>>(
                                          stream: queryCommentPostRecord(
                                            parent:
                                                postPagePostRecord.reference,
                                            queryBuilder: (commentPostRecord) =>
                                                commentPostRecord.orderBy(
                                                    'comment_post_time'),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<CommentPostRecord>
                                                listViewCommentPostRecordList =
                                                snapshot.data!;
                                            return ListView.separated(
                                              padding: EdgeInsets.fromLTRB(
                                                0,
                                                0,
                                                0,
                                                20.0,
                                              ),
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewCommentPostRecordList
                                                      .length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 20.0),
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewCommentPostRecord =
                                                    listViewCommentPostRecordList[
                                                        listViewIndex];
                                                return CommentPostWidget(
                                                  key: Key(
                                                      'Keyyuk_${listViewIndex}_of_${listViewCommentPostRecordList.length}'),
                                                  commentPostref:
                                                      listViewCommentPostRecord
                                                          .reference,
                                                  postref: postPagePostRecord
                                                      .reference,
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (!_model.commentShoePost)
                        Align(
                          alignment: AlignmentDirectional(0.00, 1.00),
                          child: Container(
                            width: double.infinity,
                            height: 85.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0x01FFFFFF),
                                  Color(0x80FFFFFF),
                                  Color(0xD0FFFFFF),
                                  FlutterFlowTheme.of(context).primaryBackground
                                ],
                                stops: [0.0, 0.1, 0.4, 1.0],
                                begin: AlignmentDirectional(0.0, -1.0),
                                end: AlignmentDirectional(0, 1.0),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 28.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28.0),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 57.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 16.0,
                                        color: Color(0x1A000000),
                                        offset: Offset(0.0, 1.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(28.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (postPagePostRecord
                                                .postActivities
                                                .contains(currentUserReference))
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await postPagePostRecord
                                                      .reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'post_activities':
                                                            FieldValue
                                                                .arrayRemove([
                                                          currentUserReference
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                },
                                                child: Icon(
                                                  FFIcons.kbatteryActivityFill,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  size: 25.0,
                                                ),
                                              ),
                                            if (!postPagePostRecord
                                                .postActivities
                                                .contains(currentUserReference))
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.userBlockedUserByAdmin,
                                                      false)) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Your account has been suspended. Please, contact support.',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Libre Franklin',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 14.0,
                                                              ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 3000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  } else {
                                                    if (valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.userSubscription,
                                                        false)) {
                                                      await postPagePostRecord
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'post_activities':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              currentUserReference
                                                            ]),
                                                          },
                                                        ),
                                                      });

                                                      await NotificationRecord
                                                          .collection
                                                          .doc()
                                                          .set(
                                                              createNotificationRecordData(
                                                            notificationFrom:
                                                                currentUserReference,
                                                            notificationTo:
                                                                stackUsersRecord
                                                                    .reference,
                                                            notificationType:
                                                                'liked',
                                                            notificationPost:
                                                                postPagePostRecord
                                                                    .reference,
                                                            notificationCreationDate:
                                                                getCurrentTimestamp,
                                                          ));
                                                      if (stackUsersRecord
                                                          .userNotification) {
                                                        triggerPushNotification(
                                                          notificationTitle:
                                                              currentUserDisplayName,
                                                          notificationText:
                                                              'activated your post',
                                                          userRefs: [
                                                            stackUsersRecord
                                                                .reference
                                                          ],
                                                          initialPageName:
                                                              'MainPage',
                                                          parameterData: {},
                                                        );
                                                      }
                                                    } else {
                                                      showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        barrierColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColorBottomSh,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  SubscriptionWidget(),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    }
                                                  }
                                                },
                                                child: Icon(
                                                  FFIcons.kbatteryactivity,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .dark88,
                                                  size: 24.0,
                                                ),
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(7.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                '${postPagePostRecord.postActivities.length.toString()} activities',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .dark88,
                                                          fontSize: 14.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
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
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Libre Franklin',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      14.0,
                                                                ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 3000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  );
                                                } else {
                                                  if (valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.userSubscription,
                                                      false)) {
                                                    setState(() {
                                                      _model.commentShoePost =
                                                          true;
                                                    });
                                                  } else {
                                                    showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      barrierColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColorBottomSh,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                SubscriptionWidget(),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  }
                                                }
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    FFIcons.kproperty1comments,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .dark88,
                                                    size: 24.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(7.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      '${formatNumber(
                                                        postPagePostRecord
                                                            .postCommentsList
                                                            .length,
                                                        formatType:
                                                            FormatType.compact,
                                                      )} comments',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Libre Franklin',
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
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            FFIcons.kproperty1share,
                                            color: FlutterFlowTheme.of(context)
                                                .dark88,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            if (valueOrDefault<bool>(
                                                currentUserDocument
                                                    ?.userBlockedUserByAdmin,
                                                false)) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Your account has been suspended. Please, contact support.',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 14.0,
                                                        ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 3000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            } else {
                                              if (valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.userSubscription,
                                                  false)) {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Color(0x01000000),
                                                  barrierColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .dark38,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            BottomSharePostWidget(
                                                          repostpost:
                                                              postPagePostRecord
                                                                  .reference,
                                                          user: stackUsersRecord
                                                              .reference,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              } else {
                                                showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  barrierColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .customColorBottomSh,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            SubscriptionWidget(),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              }
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (_model.commentShoePost)
                        Align(
                          alignment: AlignmentDirectional(0.00, 1.00),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 0.0,
                            child: Container(
                              width: double.infinity,
                              height: 79.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: Color(0xFFDFDFDF),
                                  width: 1.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.00, -1.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 7.5, 16.0, 24.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      AuthUserStreamWidget(
                                        builder: (context) => Container(
                                          width: 40.0,
                                          height: 40.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              currentUserPhoto,
                                              'https://firebasestorage.googleapis.com/v0/b/guiid-metier-9e72a.appspot.com/o/Photo.png?alt=media&token=5b0e8f6e-7128-4456-a7d5-373cb8fa901b&_gl=1*rkimyz*_ga*MTM0NzUzNDc1NS4xNjg4NDU4OTk3*_ga_CW55HF8NVT*MTY5NjA5NDAyMC4xNzguMS4xNjk2MDk0MDc0LjYuMC4w',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 8.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            child: TextFormField(
                                              controller: _model.textController,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController',
                                                Duration(milliseconds: 10),
                                                () => setState(() {}),
                                              ),
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                hintText: 'Your comment',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .dark38,
                                                          fontSize: 15.0,
                                                          lineHeight: 1.5,
                                                        ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .dark88,
                                                        fontSize: 15.0,
                                                        lineHeight: 1.5,
                                                      ),
                                              maxLines: 2,
                                              minLines: 1,
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        borderWidth: 0.0,
                                        buttonSize: 45.0,
                                        disabledIconColor: Color(0x7E000000),
                                        icon: Icon(
                                          FFIcons.kbiArrowUpCircleFill,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 30.0,
                                        ),
                                        onPressed: _model.textController.text ==
                                                    null ||
                                                _model.textController.text == ''
                                            ? null
                                            : () async {
                                                setState(() {
                                                  _model.text = _model
                                                      .textController.text;
                                                });
                                                setState(() {
                                                  _model.textController
                                                      ?.clear();
                                                });

                                                var commentPostRecordReference =
                                                    CommentPostRecord.createDoc(
                                                        postPagePostRecord
                                                            .reference);
                                                await commentPostRecordReference
                                                    .set(
                                                        createCommentPostRecordData(
                                                  commentPostUser:
                                                      currentUserReference,
                                                  commentPostText: _model.text,
                                                  commentPostTime:
                                                      getCurrentTimestamp,
                                                ));
                                                _model.comment = CommentPostRecord
                                                    .getDocumentFromData(
                                                        createCommentPostRecordData(
                                                          commentPostUser:
                                                              currentUserReference,
                                                          commentPostText:
                                                              _model.text,
                                                          commentPostTime:
                                                              getCurrentTimestamp,
                                                        ),
                                                        commentPostRecordReference);

                                                await NotificationRecord
                                                    .collection
                                                    .doc()
                                                    .set(
                                                        createNotificationRecordData(
                                                      notificationFrom:
                                                          currentUserReference,
                                                      notificationTo:
                                                          stackUsersRecord
                                                              .reference,
                                                      notificationType:
                                                          'commented',
                                                      notificationPost:
                                                          postPagePostRecord
                                                              .reference,
                                                      notificationCreationDate:
                                                          getCurrentTimestamp,
                                                      notificationText:
                                                          _model.text,
                                                    ));
                                                if (stackUsersRecord
                                                    .userNotification) {
                                                  triggerPushNotification(
                                                    notificationTitle:
                                                        stackUsersRecord
                                                            .displayName,
                                                    notificationText:
                                                        'commented your post',
                                                    userRefs: [
                                                      stackUsersRecord.reference
                                                    ],
                                                    initialPageName: 'MainPage',
                                                    parameterData: {},
                                                  );
                                                }

                                                await postPagePostRecord
                                                    .reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'post_comments_list':
                                                          FieldValue
                                                              .arrayUnion([
                                                        _model
                                                            .comment?.reference
                                                      ]),
                                                    },
                                                  ),
                                                });
                                                setState(() {
                                                  _model.text = '';
                                                });

                                                setState(() {});
                                              },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
