import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'post_page_reposted_model.dart';
export 'post_page_reposted_model.dart';

class PostPageRepostedWidget extends StatefulWidget {
  const PostPageRepostedWidget({
    Key? key,
    required this.postRef,
  }) : super(key: key);

  final DocumentReference? postRef;

  @override
  _PostPageRepostedWidgetState createState() => _PostPageRepostedWidgetState();
}

class _PostPageRepostedWidgetState extends State<PostPageRepostedWidget> {
  late PostPageRepostedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostPageRepostedModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.commentShoePost = false;
      });
      await actions.updatePage(
        context,
      );
    });

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<PostRecord>(
      stream: PostRecord.getDocument(widget.postRef!),
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
        final postPageRepostedPostRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFF4F3EC),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
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
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: StreamBuilder<UsersRecord>(
                    stream: UsersRecord.getDocument(
                        postPageRepostedPostRecord.postCreator!),
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
                      final iconButtonUsersRecord = snapshot.data!;
                      return FlutterFlowIconButton(
                        borderRadius: 100.0,
                        buttonSize: 45.0,
                        icon: Icon(
                          FFIcons.kproperty1more,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          if (currentUserReference ==
                              iconButtonUsersRecord.reference) {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Color(0x7F000000),
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () => FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: BottomEditopDeletePostWidget(
                                      postref:
                                          postPageRepostedPostRecord.reference,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          } else {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Color(0x7F000000),
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () => FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: BottomReportPostWidget(
                                      post:
                                          postPageRepostedPostRecord.reference,
                                      typeReport: 'Post',
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: StreamBuilder<UsersRecord>(
              stream: UsersRecord.getDocument(
                  postPageRepostedPostRecord.postCreator!),
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
                return Stack(
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
                              child: StreamBuilder<PostRecord>(
                                stream: PostRecord.getDocument(
                                    postPageRepostedPostRecord
                                        .postRepostedPost!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 30.0,
                                        height: 30.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final columnPostRecord = snapshot.data!;
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (postPageRepostedPostRecord
                                            .postIsReposted)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 18.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (stackUsersRecord.userType ==
                                                    'User')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 40.0,
                                                          height: 40.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              stackUsersRecord
                                                                  .photoUrl,
                                                              'https://firebasestorage.googleapis.com/v0/b/guiid-metier.appspot.com/o/Photo.png?alt=media&token=06d1ab4a-f642-4092-b1a7-9176c3b62d2f',
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          3.0),
                                                                  child: Text(
                                                                    stackUsersRecord
                                                                        .displayName,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Libre Franklin',
                                                                          fontSize:
                                                                              15.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          3.0),
                                                                  child: Text(
                                                                    dateTimeFormat(
                                                                        'relative',
                                                                        postPageRepostedPostRecord
                                                                            .postTimePosted!),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Libre Franklin',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).dark68,
                                                                          fontSize:
                                                                              14.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        if ((currentUserDocument
                                                                        ?.userFollowing
                                                                        ?.toList() ??
                                                                    [])
                                                                .contains(
                                                                    stackUsersRecord
                                                                        .reference) &&
                                                            (postPageRepostedPostRecord
                                                                    .postCreator !=
                                                                currentUserReference))
                                                          AuthUserStreamWidget(
                                                            builder: (context) =>
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                await currentUserReference!
                                                                    .update({
                                                                  'user_following':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    postPageRepostedPostRecord
                                                                        .postCreator
                                                                  ]),
                                                                });
                                                              },
                                                              text: 'FOLLOWING',
                                                              options:
                                                                  FFButtonOptions(
                                                                padding: EdgeInsetsDirectional
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
                                                                textStyle: FlutterFlowTheme.of(
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
                                                                borderSide:
                                                                    BorderSide(
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                              ),
                                                            ),
                                                          ),
                                                        if (!(currentUserDocument
                                                                        ?.userFollowing
                                                                        ?.toList() ??
                                                                    [])
                                                                .contains(
                                                                    stackUsersRecord
                                                                        .reference) &&
                                                            (postPageRepostedPostRecord
                                                                    .postCreator !=
                                                                currentUserReference))
                                                          AuthUserStreamWidget(
                                                            builder: (context) =>
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                await currentUserReference!
                                                                    .update({
                                                                  'user_following':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    postPageRepostedPostRecord
                                                                        .postCreator
                                                                  ]),
                                                                });
                                                                await actions
                                                                    .updatePage(
                                                                  context,
                                                                );
                                                              },
                                                              text: 'FOLLOW',
                                                              options:
                                                                  FFButtonOptions(
                                                                padding: EdgeInsetsDirectional
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
                                                                textStyle: FlutterFlowTheme.of(
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.0),
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Text(
                                                    postPageRepostedPostRecord
                                                        .postText,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .dark68,
                                                          fontSize: 15.0,
                                                          lineHeight: 1.5,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        if (columnPostRecord
                                                .postImagesList.length >=
                                            1)
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.345,
                                            child: Stack(
                                              children: [
                                                Builder(
                                                  builder: (context) {
                                                    final images =
                                                        columnPostRecord
                                                            .postImagesList
                                                            .toList();
                                                    return Container(
                                                      width: double.infinity,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.345,
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
                                                        itemCount:
                                                            images.length,
                                                        itemBuilder: (context,
                                                            imagesIndex) {
                                                          final imagesItem =
                                                              images[
                                                                  imagesIndex];
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
                                                                imagesItem,
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            fit: BoxFit.cover,
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                                if (postPageRepostedPostRecord
                                                        .postImagesList.length >
                                                    1)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  16.0,
                                                                  16.0),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 0.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        child: Container(
                                                          width: 35.0,
                                                          height: 28.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .dark20,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              '${(_model.pageViewCurrentIndex + 1).toString()}/${postPageRepostedPostRecord.postImagesList.length.toString()}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Libre Franklin',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    fontSize:
                                                                        13.0,
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
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 20.0, 16.0, 20.0),
                                          child: StreamBuilder<UsersRecord>(
                                            stream: UsersRecord.getDocument(
                                                postPageRepostedPostRecord
                                                    .postRepostedCreator!),
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
                                              final rowUsersRecord =
                                                  snapshot.data!;
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    FFIcons.kproperty1Repost,
                                                    color: Colors.black,
                                                    size: 24.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          rowUsersRecord
                                                              .photoUrl,
                                                          'https://firebasestorage.googleapis.com/v0/b/guiid-metier.appspot.com/o/Photo.png?alt=media&token=06d1ab4a-f642-4092-b1a7-9176c3b62d2f',
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
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
                                                              rowUsersRecord
                                                                  .displayName,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Libre Franklin',
                                                                    fontSize:
                                                                        15.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            dateTimeFormat(
                                                                'relative',
                                                                columnPostRecord
                                                                    .postTimePosted!),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                        Divider(
                                          height: 1.0,
                                          thickness: 1.0,
                                          indent: 16.0,
                                          endIndent: 16.0,
                                          color: FlutterFlowTheme.of(context)
                                              .dark6,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 15.0, 16.0, 15.0),
                                          child: Builder(
                                            builder: (context) {
                                              final item = columnPostRecord
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
                                                            (columnPostRecord
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Text(
                                            columnPostRecord.postText,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .dark68,
                                                  fontSize: 15.0,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 18.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              if (!postPageRepostedPostRecord
                                                  .postActivities
                                                  .contains(
                                                      currentUserReference))
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await postPageRepostedPostRecord
                                                        .reference
                                                        .update({
                                                      'post_activities':
                                                          FieldValue
                                                              .arrayUnion([
                                                        currentUserReference
                                                      ]),
                                                    });
                                                  },
                                                  child: Icon(
                                                    FFIcons.kbatteryactivity,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .dark88,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              if (postPageRepostedPostRecord
                                                  .postActivities
                                                  .contains(
                                                      currentUserReference))
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await postPageRepostedPostRecord
                                                        .reference
                                                        .update({
                                                      'post_activities':
                                                          FieldValue
                                                              .arrayRemove([
                                                        currentUserReference
                                                      ]),
                                                    });
                                                  },
                                                  child: Icon(
                                                    FFIcons
                                                        .kbatteryactivityFill,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  '${formatNumber(
                                                    postPageRepostedPostRecord
                                                        .postActivities.length,
                                                    formatType:
                                                        FormatType.compact,
                                                  )} activities',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .dark68,
                                                        fontSize: 14.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 0.0, 0.0),
                                                child: Icon(
                                                  FFIcons.kproperty1comments,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .dark88,
                                                  size: 24.0,
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    '${formatNumber(
                                                      postPageRepostedPostRecord
                                                          .postCommentsList
                                                          .length,
                                                      formatType:
                                                          FormatType.compact,
                                                    )} comments',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .dark68,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .dark88,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
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
                                                        onTap: () => FocusScope
                                                                .of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              BottomSharePostWidget(
                                                            repostpost:
                                                                postPageRepostedPostRecord
                                                                    .reference,
                                                            user:
                                                                stackUsersRecord
                                                                    .reference,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 30.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 20.0, 16.0, 74.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 22.0),
                                        child: Text(
                                          '${formatNumber(
                                            postPageRepostedPostRecord
                                                .postCommentsList.length,
                                            formatType: FormatType.compact,
                                          )} comments',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Libre Franklin',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .dark88,
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      StreamBuilder<List<CommentPostRecord>>(
                                        stream: queryCommentPostRecord(
                                          parent: postPageRepostedPostRecord
                                              .reference,
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
                                                    FlutterFlowTheme.of(context)
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
                                            padding: EdgeInsets.zero,
                                            reverse: true,
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
                                                    'Keybqb_${listViewIndex}_of_${listViewCommentPostRecordList.length}'),
                                                commentPostref:
                                                    listViewCommentPostRecord
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
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Container(
                          width: double.infinity,
                          height: 91.0,
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
                                20.0, 0.0, 20.0, 34.0),
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
                                          if (postPageRepostedPostRecord
                                              .postActivities
                                              .contains(currentUserReference))
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await postPageRepostedPostRecord
                                                    .reference
                                                    .update({
                                                  'post_activities':
                                                      FieldValue.arrayRemove([
                                                    currentUserReference
                                                  ]),
                                                });
                                              },
                                              child: Icon(
                                                FFIcons.kbatteryactivityFill,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                size: 24.0,
                                              ),
                                            ),
                                          if (!postPageRepostedPostRecord
                                              .postActivities
                                              .contains(currentUserReference))
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await postPageRepostedPostRecord
                                                    .reference
                                                    .update({
                                                  'post_activities':
                                                      FieldValue.arrayUnion([
                                                    currentUserReference
                                                  ]),
                                                });
                                              },
                                              child: Icon(
                                                FFIcons.kbatteryactivity,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .dark88,
                                                size: 24.0,
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    7.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              '${postPageRepostedPostRecord.postActivities.length.toString()} activities',
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
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                _model.commentShoePost = true;
                                              });
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          7.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    '${formatNumber(
                                                      postPageRepostedPostRecord
                                                          .postCommentsList
                                                          .length,
                                                      formatType:
                                                          FormatType.compact,
                                                    )} comments',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Color(0x01000000),
                                            barrierColor:
                                                FlutterFlowTheme.of(context)
                                                    .dark38,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () =>
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: BottomSharePostWidget(
                                                    repostpost:
                                                        postPageRepostedPostRecord
                                                            .reference,
                                                    user: stackUsersRecord
                                                        .reference,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
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
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 0.0,
                          child: Container(
                            width: double.infinity,
                            height: 90.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              border: Border.all(
                                color: Color(0xFFDFDFDF),
                                width: 1.0,
                              ),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 7.5, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                            'https://firebasestorage.googleapis.com/v0/b/guiid-metier.appspot.com/o/Photo.png?alt=media&token=06d1ab4a-f642-4092-b1a7-9176c3b62d2f',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 8.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller: _model.textController,
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                  topLeft: Radius.circular(4.0),
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
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
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
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: FlutterFlowTheme.of(
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
                                              var commentPostRecordReference =
                                                  CommentPostRecord.createDoc(
                                                      postPageRepostedPostRecord
                                                          .reference);
                                              await commentPostRecordReference
                                                  .set(
                                                      createCommentPostRecordData(
                                                commentPostUser:
                                                    currentUserReference,
                                                commentPostText:
                                                    _model.textController.text,
                                                commentPostTime:
                                                    getCurrentTimestamp,
                                              ));
                                              _model.comment = CommentPostRecord
                                                  .getDocumentFromData(
                                                      createCommentPostRecordData(
                                                        commentPostUser:
                                                            currentUserReference,
                                                        commentPostText: _model
                                                            .textController
                                                            .text,
                                                        commentPostTime:
                                                            getCurrentTimestamp,
                                                      ),
                                                      commentPostRecordReference);

                                              await postPageRepostedPostRecord
                                                  .reference
                                                  .update({
                                                'post_comments_list':
                                                    FieldValue.arrayUnion([
                                                  _model.comment?.reference
                                                ]),
                                              });
                                              setState(() {
                                                _model.textController?.clear();
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
                );
              },
            ),
          ),
        );
      },
    );
  }
}
