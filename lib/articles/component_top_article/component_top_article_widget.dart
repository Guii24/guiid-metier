import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'component_top_article_model.dart';
export 'component_top_article_model.dart';

class ComponentTopArticleWidget extends StatefulWidget {
  const ComponentTopArticleWidget({
    Key? key,
    this.topArticle,
  }) : super(key: key);

  final DocumentReference? topArticle;

  @override
  _ComponentTopArticleWidgetState createState() =>
      _ComponentTopArticleWidgetState();
}

class _ComponentTopArticleWidgetState extends State<ComponentTopArticleWidget> {
  late ComponentTopArticleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentTopArticleModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<ArticlesRecord>(
      stream: ArticlesRecord.getDocument(widget.topArticle!),
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
        final stackArticlesRecord = snapshot.data!;
        return Container(
          width: MediaQuery.sizeOf(context).width * 0.67,
          height: MediaQuery.sizeOf(context).height * 0.234,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.network(
                  stackArticlesRecord.articleImageList.first,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Material(
                color: Colors.transparent,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0x33000000),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Text(
                  stackArticlesRecord.articleTitle,
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Libre Franklin',
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 17.0,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w500,
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
