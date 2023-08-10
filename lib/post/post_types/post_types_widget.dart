import '/backend/backend.dart';
import '/company_pages/component_post_company/component_post_company_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/post/component_post_reposted/component_post_reposted_widget.dart';
import '/post/component_post_user/component_post_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'post_types_model.dart';
export 'post_types_model.dart';

class PostTypesWidget extends StatefulWidget {
  const PostTypesWidget({
    Key? key,
    this.postDoc,
  }) : super(key: key);

  final PostRecord? postDoc;

  @override
  _PostTypesWidgetState createState() => _PostTypesWidgetState();
}

class _PostTypesWidgetState extends State<PostTypesWidget> {
  late PostTypesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostTypesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.postDoc!.postCreator!),
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
            if (columnUsersRecord.userType == 'User')
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      'PostPageUser',
                      queryParameters: {
                        'postRef': serializeParam(
                          widget.postDoc?.reference,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                    );
                  },
                  child: wrapWithModel(
                    model: _model.componentPostUserModel,
                    updateCallback: () => setState(() {}),
                    child: ComponentPostUserWidget(
                      postDoc: widget.postDoc!.reference,
                    ),
                  ),
                ),
              ),
            if (columnUsersRecord.userType != 'User')
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      'PostPageUser',
                      queryParameters: {
                        'postRef': serializeParam(
                          widget.postDoc?.reference,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                    );
                  },
                  child: wrapWithModel(
                    model: _model.componentPostCompanyModel,
                    updateCallback: () => setState(() {}),
                    child: ComponentPostCompanyWidget(),
                  ),
                ),
              ),
            if (widget.postDoc?.postIsReposted == true)
              wrapWithModel(
                model: _model.componentPostRepostedModel,
                updateCallback: () => setState(() {}),
                child: ComponentPostRepostedWidget(),
              ),
          ],
        );
      },
    );
  }
}
