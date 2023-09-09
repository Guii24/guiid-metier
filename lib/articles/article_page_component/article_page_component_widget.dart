import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'article_page_component_model.dart';
export 'article_page_component_model.dart';

class ArticlePageComponentWidget extends StatefulWidget {
  const ArticlePageComponentWidget({
    Key? key,
    this.article,
  }) : super(key: key);

  final ArticlesRecord? article;

  @override
  _ArticlePageComponentWidgetState createState() =>
      _ArticlePageComponentWidgetState();
}

class _ArticlePageComponentWidgetState
    extends State<ArticlePageComponentWidget> {
  late ArticlePageComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArticlePageComponentModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.345,
            child: Stack(
              children: [
                Builder(
                  builder: (context) {
                    final images =
                        widget.article?.articleImageList?.toList() ?? [];
                    return Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.345,
                      child: PageView.builder(
                        controller: _model.pageViewController ??=
                            PageController(
                                initialPage: min(0, images.length - 1)),
                        onPageChanged: (_) async {
                          setState(() {});
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: images.length,
                        itemBuilder: (context, imagesIndex) {
                          final imagesItem = images[imagesIndex];
                          return Image.network(
                            imagesItem,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    );
                  },
                ),
                Align(
                  alignment: AlignmentDirectional(1.00, 1.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 16.0),
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
                            '${(_model.pageViewCurrentIndex + 1).toString()}/${widget.article?.articleImageList?.length?.toString()}',
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
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 47.0, 14.0),
            child: Text(
              widget.article!.articleTitle,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Libre Franklin',
                    color: FlutterFlowTheme.of(context).dark88,
                    fontSize: 17.0,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w500,
                    lineHeight: 1.4,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Text(
              widget.article!.articleText,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Libre Franklin',
                    color: FlutterFlowTheme.of(context).dark68,
                    fontSize: 15.0,
                    lineHeight: 1.4,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 18.0, 16.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (!widget.article!.articleActivities
                    .contains(currentUserReference))
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await widget.article!.reference.update({
                        'article_activities':
                            FieldValue.arrayUnion([currentUserReference]),
                      });
                      await actions.updatePage(
                        context,
                      );
                    },
                    child: Icon(
                      FFIcons.kbatteryactivity,
                      color: FlutterFlowTheme.of(context).dark88,
                      size: 24.0,
                    ),
                  ),
                if (widget.article?.articleActivities
                        ?.contains(currentUserReference) ??
                    true)
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await widget.article!.reference.update({
                        'article_activities':
                            FieldValue.arrayRemove([currentUserReference]),
                      });
                      await actions.updatePage(
                        context,
                      );
                    },
                    child: Icon(
                      FFIcons.kbatteryactivityFill,
                      color: FlutterFlowTheme.of(context).alternate,
                      size: 24.0,
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                  child: Text(
                    '${widget.article?.articleActivities?.length?.toString()} activities',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Libre Franklin',
                          color: FlutterFlowTheme.of(context).dark68,
                          fontSize: 14.0,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                  child: Icon(
                    FFIcons.kproperty1comments,
                    color: FlutterFlowTheme.of(context).dark88,
                    size: 24.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                  child: Text(
                    '${widget.article?.articleCommentsList?.length?.toString()} comments',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Libre Franklin',
                          color: FlutterFlowTheme.of(context).dark68,
                          fontSize: 14.0,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
