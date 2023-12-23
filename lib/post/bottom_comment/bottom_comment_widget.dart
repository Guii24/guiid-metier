import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/post/comment_post/comment_post_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_comment_model.dart';
export 'bottom_comment_model.dart';

class BottomCommentWidget extends StatefulWidget {
  const BottomCommentWidget({
    Key? key,
    this.post,
    this.userRef,
  }) : super(key: key);

  final DocumentReference? post;
  final UsersRecord? userRef;

  @override
  _BottomCommentWidgetState createState() => _BottomCommentWidgetState();
}

class _BottomCommentWidgetState extends State<BottomCommentWidget> {
  late BottomCommentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomCommentModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 150.0, 0.0, 0.0),
      child: StreamBuilder<PostRecord>(
        stream: PostRecord.getDocument(widget.post!),
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
            height: MediaQuery.sizeOf(context).height * 0.65,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 13.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 32.0,
                    height: 2.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).dark20,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 13.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 22.0),
                            child: Text(
                              '${valueOrDefault<String>(
                                formatNumber(
                                  containerPostRecord.postCommentsList.length,
                                  formatType: FormatType.compact,
                                ),
                                '0',
                              )} comments',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    color: FlutterFlowTheme.of(context).dark88,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: StreamBuilder<List<CommentPostRecord>>(
                              stream: queryCommentPostRecord(
                                parent: containerPostRecord.reference,
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
                                          FlutterFlowTheme.of(context).primary,
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
                                          'Key8am_${listViewIndex}_of_${listViewCommentPostRecordList.length}'),
                                      commentPostref:
                                          listViewCommentPostRecord.reference,
                                      postref: containerPostRecord.reference,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 0.0,
                      child: Container(
                        width: double.infinity,
                        height: 79.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          border: Border.all(
                            color: Color(0xFFDFDFDF),
                            width: 1.0,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 7.5, 16.0, 24.0),
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
                                        'https://firebasestorage.googleapis.com/v0/b/guiid-metier-9e72a.appspot.com/o/Photo.png?alt=media&token=5b0e8f6e-7128-4456-a7d5-373cb8fa901b&_gl=1*rkimyz*_ga*MTM0NzUzNDc1NS4xNjg4NDU4OTk3*_ga_CW55HF8NVT*MTY5NjA5NDAyMC4xNzguMS4xNjk2MDk0MDc0LjYuMC4w',
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
                                        focusNode: _model.textFieldFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textController',
                                          Duration(milliseconds: 10),
                                          () => setState(() {}),
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: 'Your comment',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
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
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
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
                                              topRight: Radius.circular(4.0),
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
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                            _model.text =
                                                _model.textController.text;
                                          });
                                          setState(() {
                                            _model.textController?.clear();
                                          });

                                          var commentPostRecordReference =
                                              CommentPostRecord.createDoc(
                                                  containerPostRecord
                                                      .reference);
                                          await commentPostRecordReference
                                              .set(createCommentPostRecordData(
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

                                          await NotificationRecord.collection
                                              .doc()
                                              .set(createNotificationRecordData(
                                                notificationFrom:
                                                    currentUserReference,
                                                notificationTo:
                                                    widget.userRef?.reference,
                                                notificationType: 'commented',
                                                notificationPost:
                                                    containerPostRecord
                                                        .reference,
                                                notificationCreationDate:
                                                    getCurrentTimestamp,
                                                notificationText: _model.text,
                                              ));
                                          if (valueOrDefault<bool>(
                                              currentUserDocument
                                                  ?.userNotification,
                                              false)) {
                                            triggerPushNotification(
                                              notificationTitle:
                                                  widget.userRef!.displayName,
                                              notificationText:
                                                  'commented your post',
                                              userRefs: [
                                                widget.userRef!.reference
                                              ],
                                              initialPageName: 'MainPage',
                                              parameterData: {},
                                            );
                                          }

                                          await containerPostRecord.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'post_comments_list':
                                                    FieldValue.arrayUnion([
                                                  _model.comment?.reference
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
            ),
          );
        },
      ),
    );
  }
}
