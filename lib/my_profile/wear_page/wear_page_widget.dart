import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/my_profile/bottom_editor_delete_wear/bottom_editor_delete_wear_widget.dart';
import '/post/bottom_report_post/bottom_report_post_widget.dart';
import '/post/comment_post/comment_post_widget.dart';
import '/post/create_post/component_wear_post/component_wear_post_widget.dart';
import '/post/create_post/empty_create_wear/empty_create_wear_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'wear_page_model.dart';
export 'wear_page_model.dart';

class WearPageWidget extends StatefulWidget {
  const WearPageWidget({
    Key? key,
    required this.postDoc,
  }) : super(key: key);

  final PostRecord? postDoc;

  @override
  _WearPageWidgetState createState() => _WearPageWidgetState();
}

class _WearPageWidgetState extends State<WearPageWidget> {
  late WearPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WearPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.commentShoePost = false;
      });
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
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
                  if (currentUserReference == widget.postDoc?.postCreator) {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Color(0x01000000),
                      barrierColor: FlutterFlowTheme.of(context).dark38,
                      context: context,
                      builder: (context) {
                        return GestureDetector(
                          onTap: () => FocusScope.of(context)
                              .requestFocus(_model.unfocusNode),
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: BottomEditorDeleteWearWidget(
                              postDoc: widget.postDoc,
                            ),
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  } else {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Color(0x01000000),
                      barrierColor: FlutterFlowTheme.of(context).dark38,
                      context: context,
                      builder: (context) {
                        return GestureDetector(
                          onTap: () => FocusScope.of(context)
                              .requestFocus(_model.unfocusNode),
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: BottomReportPostWidget(
                              post: widget.postDoc?.reference,
                              typeReport: 'Post',
                            ),
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  }
                },
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
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
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Builder(
                        builder: (context) {
                          final wear =
                              (widget.postDoc?.postWearItems?.toList() ?? [])
                                  .take(5)
                                  .toList();
                          if (wear.isEmpty) {
                            return Center(
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: EmptyCreateWearWidget(),
                              ),
                            );
                          }
                          return ListView.separated(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              30.0,
                            ),
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: wear.length,
                            separatorBuilder: (_, __) => SizedBox(height: 32.0),
                            itemBuilder: (context, wearIndex) {
                              final wearItem = wear[wearIndex];
                              return ComponentWearPostWidget(
                                key: Key(
                                    'Keyitm_${wearIndex}_of_${wear.length}'),
                                index: wearIndex,
                                wearItem: wearItem,
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 20.0, 16.0, 80.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 22.0),
                                  child: Text(
                                    '${formatNumber(
                                      widget.postDoc?.postCommentsList?.length,
                                      formatType: FormatType.compact,
                                    )} comments',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Libre Franklin',
                                          color: FlutterFlowTheme.of(context)
                                              .dark88,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                StreamBuilder<List<CommentPostRecord>>(
                                  stream: queryCommentPostRecord(
                                    parent: widget.postDoc?.reference,
                                    queryBuilder: (commentPostRecord) =>
                                        commentPostRecord
                                            .orderBy('comment_post_time'),
                                  ),
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
                                    List<CommentPostRecord>
                                        listViewCommentPostRecordList =
                                        snapshot.data!;
                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewCommentPostRecordList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 20.0),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewCommentPostRecord =
                                            listViewCommentPostRecordList[
                                                listViewIndex];
                                        return CommentPostWidget(
                                          key: Key(
                                              'Keyqkd_${listViewIndex}_of_${listViewCommentPostRecordList.length}'),
                                          commentPostref:
                                              listViewCommentPostRecord
                                                  .reference,
                                          postref: widget.postDoc?.reference,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 34.0),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (widget.postDoc?.postActivities
                                            ?.contains(currentUserReference) ??
                                        true)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await widget.postDoc!.reference
                                              .update({
                                            'post_activities':
                                                FieldValue.arrayRemove(
                                                    [currentUserReference]),
                                          });
                                        },
                                        child: Icon(
                                          FFIcons.kbatteryactivityFill,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          size: 24.0,
                                        ),
                                      ),
                                    if (!widget.postDoc!.postActivities
                                        .contains(currentUserReference))
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await widget.postDoc!.reference
                                              .update({
                                            'post_activities':
                                                FieldValue.arrayUnion(
                                                    [currentUserReference]),
                                          });
                                        },
                                        child: Icon(
                                          FFIcons.kbatteryactivity,
                                          color: FlutterFlowTheme.of(context)
                                              .dark88,
                                          size: 24.0,
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          7.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        '${widget.postDoc?.postActivities?.length?.toString()} activities',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .dark88,
                                              fontSize: 14.0,
                                            ),
                                      ),
                                    ),
                                  ],
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
                                        setState(() {
                                          _model.commentShoePost = true;
                                        });
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            FFIcons.kproperty1comments,
                                            color: FlutterFlowTheme.of(context)
                                                .dark88,
                                            size: 24.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    7.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              '${widget.postDoc?.postCommentsList?.length?.toString()} comments',
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
                                    ),
                                  ),
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
                      height: 65.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        border: Border.all(
                          color: Color(0xFFDFDFDF),
                          width: 1.0,
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.00, -1.00),
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
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController',
                                        Duration(milliseconds: 10),
                                        () => setState(() {}),
                                      ),
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: 'Your comment',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .dark38,
                                              fontSize: 15.0,
                                              lineHeight: 1.5,
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Libre Franklin',
                                            color: FlutterFlowTheme.of(context)
                                                .dark88,
                                            fontSize: 15.0,
                                            lineHeight: 1.5,
                                          ),
                                      maxLines: 2,
                                      minLines: 1,
                                      validator: _model.textControllerValidator
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 30.0,
                                ),
                                onPressed: _model.textController.text == null ||
                                        _model.textController.text == ''
                                    ? null
                                    : () async {
                                        var commentPostRecordReference =
                                            CommentPostRecord.createDoc(
                                                widget.postDoc!.reference);
                                        await commentPostRecordReference
                                            .set(createCommentPostRecordData(
                                          commentPostUser: currentUserReference,
                                          commentPostText:
                                              _model.textController.text,
                                          commentPostTime: getCurrentTimestamp,
                                        ));
                                        _model.comment = CommentPostRecord
                                            .getDocumentFromData(
                                                createCommentPostRecordData(
                                                  commentPostUser:
                                                      currentUserReference,
                                                  commentPostText: _model
                                                      .textController.text,
                                                  commentPostTime:
                                                      getCurrentTimestamp,
                                                ),
                                                commentPostRecordReference);

                                        await widget.postDoc!.reference.update({
                                          'post_comments_list':
                                              FieldValue.arrayUnion(
                                                  [_model.comment?.reference]),
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
          ),
        ),
      ),
    );
  }
}
