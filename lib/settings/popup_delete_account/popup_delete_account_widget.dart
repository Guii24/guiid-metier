import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'popup_delete_account_model.dart';
export 'popup_delete_account_model.dart';

class PopupDeleteAccountWidget extends StatefulWidget {
  const PopupDeleteAccountWidget({super.key});

  @override
  State<PopupDeleteAccountWidget> createState() =>
      _PopupDeleteAccountWidgetState();
}

class _PopupDeleteAccountWidgetState extends State<PopupDeleteAccountWidget> {
  late PopupDeleteAccountModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupDeleteAccountModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: double.infinity,
          height: 180.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primary,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Text(
                    'Are you sure you want to delete your account?',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Libre Franklin',
                          fontSize: 17.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          lineHeight: 1.5,
                        ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 7.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'NO',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 15.0,
                                  letterSpacing: 0.5,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await actions.reAuthUser(
                              currentUserEmail,
                              '123456',
                            );
                            _model.articles = await queryArticlesRecordOnce(
                              queryBuilder: (articlesRecord) =>
                                  articlesRecord.where(
                                'article_creator',
                                isEqualTo: currentUserReference,
                              ),
                            );
                            _model.chats = await queryChatRecordOnce(
                              queryBuilder: (chatRecord) => chatRecord.where(
                                'chat_with_support_creator',
                                isEqualTo: currentUserReference,
                              ),
                            );
                            _model.articlesComments =
                                await queryCommentArticleRecordOnce(
                              queryBuilder: (commentArticleRecord) =>
                                  commentArticleRecord.where(
                                'comment_article_user',
                                isEqualTo: currentUserReference,
                              ),
                            );
                            _model.commentPost =
                                await queryCommentPostRecordOnce(
                              queryBuilder: (commentPostRecord) =>
                                  commentPostRecord.where(
                                'comment_post_user',
                                isEqualTo: currentUserReference,
                              ),
                            );
                            _model.jobApplicants =
                                await queryJobApplicantsRecordOnce(
                              queryBuilder: (jobApplicantsRecord) =>
                                  jobApplicantsRecord.where(
                                'job_applicant_user',
                                isEqualTo: currentUserReference,
                              ),
                            );
                            _model.notifications =
                                await queryNotificationRecordOnce(
                              queryBuilder: (notificationRecord) =>
                                  notificationRecord.where(
                                'notification_from',
                                isEqualTo: currentUserReference,
                              ),
                            );
                            _model.posts = await queryPostRecordOnce(
                              queryBuilder: (postRecord) => postRecord.where(
                                'post_creator',
                                isEqualTo: currentUserReference,
                              ),
                            );
                            await actions.deleteUserData(
                              _model.posts?.toList(),
                              _model.commentPost?.toList(),
                              _model.articles?.toList(),
                              _model.articlesComments?.toList(),
                              _model.jobApplicants?.toList(),
                              _model.chats?.toList(),
                              _model.notifications?.toList(),
                            );
                            await authManager.deleteUser(context);
                            Navigator.pop(context);

                            context.goNamed(
                              'Onboarding',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );

                            safeSetState(() {});
                          },
                          text: 'YES',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  letterSpacing: 0.5,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
