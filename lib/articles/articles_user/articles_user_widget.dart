import '/articles/articles_component/articles_component_widget.dart';
import '/articles/component_top_article/component_top_article_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'articles_user_model.dart';
export 'articles_user_model.dart';

class ArticlesUserWidget extends StatefulWidget {
  const ArticlesUserWidget({Key? key}) : super(key: key);

  @override
  _ArticlesUserWidgetState createState() => _ArticlesUserWidgetState();
}

class _ArticlesUserWidgetState extends State<ArticlesUserWidget> {
  late ArticlesUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArticlesUserModel());
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: AuthUserStreamWidget(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (valueOrDefault(currentUserDocument?.userType, '') ==
                          'Company') {
                        context.pushNamed('MyProfileCompany');
                      } else {
                        context.pushNamed('MyProfile');
                      }
                    },
                    child: Container(
                      width: 34.0,
                      height: 34.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: CachedNetworkImage(
                        fadeInDuration: Duration(milliseconds: 500),
                        fadeOutDuration: Duration(milliseconds: 500),
                        imageUrl: valueOrDefault<String>(
                          currentUserPhoto,
                          'https://firebasestorage.googleapis.com/v0/b/guiid-metier.appspot.com/o/Photo.png?alt=media&token=06d1ab4a-f642-4092-b1a7-9176c3b62d2f',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            title: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('signupBioUser');
              },
              child: Text(
                'Guiid Metier',
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'NewYork',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts: false,
                    ),
              ),
            ),
            actions: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('Notifications');
                    },
                    child: Icon(
                      FFIcons.kproperty1notification,
                      color: Colors.black,
                      size: 24.0,
                    ),
                  ),
                ),
              ),
            ],
            centerTitle: true,
            elevation: 0.0,
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Material(
                      color: Colors.transparent,
                      elevation: 0.0,
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.395,
                        decoration: BoxDecoration(
                          color: Color(0xFF232323),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 15.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('signupBioCompany');
                                  },
                                  child: Text(
                                    'TOP ARTICLES',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Libre Franklin',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 17.0,
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: StreamBuilder<List<ArticlesRecord>>(
                                  stream: queryArticlesRecord(
                                    queryBuilder: (articlesRecord) =>
                                        articlesRecord.where(
                                            'article_is_top_article',
                                            isEqualTo: true),
                                    limit: 5,
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
                                    List<ArticlesRecord>
                                        pageViewArticlesRecordList =
                                        snapshot.data!;
                                    return Container(
                                      width: double.infinity,
                                      child: PageView.builder(
                                        controller: _model
                                                .pageViewController ??=
                                            PageController(
                                                initialPage: min(
                                                    0,
                                                    pageViewArticlesRecordList
                                                            .length -
                                                        1)),
                                        onPageChanged: (_) => setState(() {}),
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            pageViewArticlesRecordList.length,
                                        itemBuilder: (context, pageViewIndex) {
                                          final pageViewArticlesRecord =
                                              pageViewArticlesRecordList[
                                                  pageViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: ComponentTopArticleWidget(
                                              key: Key(
                                                  'Keyhtc_${pageViewIndex}_of_${pageViewArticlesRecordList.length}'),
                                              topArticle: pageViewArticlesRecord
                                                  .reference,
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 30.0, 16.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 4.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).white12,
                                    borderRadius: BorderRadius.circular(21.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Container(
                                      width: 96.0,
                                      height: 4.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(21.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(21.0),
                                          topRight: Radius.circular(0.0),
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
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFEBE9DF),
                            FlutterFlowTheme.of(context).primary
                          ],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 20.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  3.0, 0.0, 0.0, 8.0),
                              child: Text(
                                'ARTICLES',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Libre Franklin',
                                      color:
                                          FlutterFlowTheme.of(context).dark88,
                                      fontSize: 17.0,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  3.0, 0.0, 0.0, 15.0),
                              child: Text(
                                'The latest fashion industry news, interviews and resources.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Libre Franklin',
                                      color:
                                          FlutterFlowTheme.of(context).dark68,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                            StreamBuilder<List<ArticlesRecord>>(
                              stream: queryArticlesRecord(
                                queryBuilder: (articlesRecord) => articlesRecord
                                    .orderBy('article_time_posted',
                                        descending: true),
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
                                List<ArticlesRecord>
                                    listViewArticlesRecordList = snapshot.data!;
                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewArticlesRecordList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 15.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewArticlesRecord =
                                        listViewArticlesRecordList[
                                            listViewIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'ArticlePage',
                                          queryParameters: {
                                            'article': serializeParam(
                                              listViewArticlesRecord.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: wrapWithModel(
                                        model: _model.articlesComponentModels
                                            .getModel(
                                          listViewArticlesRecord.reference.id,
                                          listViewIndex,
                                        ),
                                        updateCallback: () => setState(() {}),
                                        child: ArticlesComponentWidget(
                                          key: Key(
                                            'Keyxqp_${listViewArticlesRecord.reference.id}',
                                          ),
                                          articleDoc:
                                              listViewArticlesRecord.reference,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ].addToEnd(SizedBox(height: 15.0)),
                        ),
                      ),
                    ),
                  ].addToEnd(SizedBox(height: 30.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
