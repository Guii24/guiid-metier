import '/backend/backend.dart';
import '/company_pages/component_post_company/component_post_company_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/post/component_post_user/component_post_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'post_types_for_search_model.dart';
export 'post_types_for_search_model.dart';

class PostTypesForSearchWidget extends StatefulWidget {
  const PostTypesForSearchWidget({
    super.key,
    this.postDoc,
  });

  final PostRecord? postDoc;

  @override
  State<PostTypesForSearchWidget> createState() =>
      _PostTypesForSearchWidgetState();
}

class _PostTypesForSearchWidgetState extends State<PostTypesForSearchWidget> {
  late PostTypesForSearchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostTypesForSearchModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget!.postDoc!.postCreator!),
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

        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if ((columnUsersRecord.userType == 'User') &&
                  (widget!.postDoc?.postIsReposted == false) &&
                  (widget!.postDoc?.postType == 'post'))
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      'PostPage',
                      queryParameters: {
                        'postRef': serializeParam(
                          widget!.postDoc?.reference,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                    );
                  },
                  child: wrapWithModel(
                    model: _model.componentPostUserModel,
                    updateCallback: () => safeSetState(() {}),
                    child: ComponentPostUserWidget(
                      postDoc: widget!.postDoc!.reference,
                    ),
                  ),
                ),
              if ((columnUsersRecord.userType == 'Company') &&
                  (widget!.postDoc?.postIsReposted == false) &&
                  (widget!.postDoc?.postType == 'post'))
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      'PostPage',
                      queryParameters: {
                        'postRef': serializeParam(
                          widget!.postDoc?.reference,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                    );
                  },
                  child: wrapWithModel(
                    model: _model.componentPostCompanyModel,
                    updateCallback: () => safeSetState(() {}),
                    child: ComponentPostCompanyWidget(
                      postCompany: widget!.postDoc?.reference,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
