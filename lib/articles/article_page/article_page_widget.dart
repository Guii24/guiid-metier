import '/articles/comment_article/comment_article_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'article_page_model.dart';
export 'article_page_model.dart';

class ArticlePageWidget extends StatefulWidget {
  const ArticlePageWidget({
    Key? key,
    this.article,
  }) : super(key: key);

  final DocumentReference? article;

  @override
  _ArticlePageWidgetState createState() => _ArticlePageWidgetState();
}

class _ArticlePageWidgetState extends State<ArticlePageWidget> {
  late ArticlePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArticlePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.commentShow = false;
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

    return StreamBuilder<ArticlesRecord>(
      stream: ArticlesRecord.getDocument(widget.article!),
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
        final articlePageArticlesRecord = snapshot.data!;
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
                buttonSize: 54.0,
                icon: Icon(
                  FFIcons.kbiArrowLeft,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.345,
                                child: Stack(
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        final images = articlePageArticlesRecord
                                            .articleImageList
                                            .toList();
                                        return Container(
                                          width: double.infinity,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.345,
                                          child: PageView.builder(
                                            controller: _model
                                                    .pageViewController ??=
                                                PageController(
                                                    initialPage: min(
                                                        0, images.length - 1)),
                                            onPageChanged: (_) async {
                                              setState(() {});
                                            },
                                            scrollDirection: Axis.horizontal,
                                            itemCount: images.length,
                                            itemBuilder:
                                                (context, imagesIndex) {
                                              final imagesItem =
                                                  images[imagesIndex];
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
                                      alignment: AlignmentDirectional(1.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 16.0, 16.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 0.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Container(
                                            width: 35.0,
                                            height: 28.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .dark20,
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                '${(_model.pageViewCurrentIndex + 1).toString()}/${articlePageArticlesRecord.articleImageList.length.toString()}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                    16.0, 20.0, 47.0, 14.0),
                                child: Text(
                                  articlePageArticlesRecord.articleTitle,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Libre Franklin',
                                        color:
                                            FlutterFlowTheme.of(context).dark88,
                                        fontSize: 17.0,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w500,
                                        lineHeight: 1.4,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Text(
                                  articlePageArticlesRecord.articleText,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Libre Franklin',
                                        color:
                                            FlutterFlowTheme.of(context).dark68,
                                        fontSize: 15.0,
                                        lineHeight: 1.4,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 18.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    if (!articlePageArticlesRecord
                                        .articleActivities
                                        .contains(currentUserReference))
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await articlePageArticlesRecord
                                              .reference
                                              .update({
                                            'article_activities':
                                                FieldValue.arrayUnion(
                                                    [currentUserReference]),
                                          });
                                          await actions.updatePage(
                                            context,
                                          );
                                        },
                                        child: Icon(
                                          FFIcons.kbatteryactivity,
                                          color: FlutterFlowTheme.of(context)
                                              .dark88,
                                          size: 24.0,
                                        ),
                                      ),
                                    if (articlePageArticlesRecord
                                        .articleActivities
                                        .contains(currentUserReference))
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await articlePageArticlesRecord
                                              .reference
                                              .update({
                                            'article_activities':
                                                FieldValue.arrayRemove(
                                                    [currentUserReference]),
                                          });
                                          await actions.updatePage(
                                            context,
                                          );
                                        },
                                        child: Icon(
                                          FFIcons.kbatteryactivityFill,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          size: 24.0,
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        '${formatNumber(
                                          articlePageArticlesRecord
                                              .articleActivities.length,
                                          formatType: FormatType.compact,
                                        )} activities',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .dark68,
                                              fontSize: 14.0,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 0.0, 0.0),
                                      child: Icon(
                                        FFIcons.kproperty1comments,
                                        color:
                                            FlutterFlowTheme.of(context).dark88,
                                        size: 24.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        '${formatNumber(
                                          articlePageArticlesRecord
                                              .articleCommentsList.length,
                                          formatType: FormatType.compact,
                                        )} comments',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .dark68,
                                              fontSize: 14.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 20.0, 16.0, 74.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 22.0),
                                  child: Text(
                                    '${formatNumber(
                                      articlePageArticlesRecord
                                          .articleCommentsList.length,
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
                                StreamBuilder<List<CommentArticleRecord>>(
                                  stream: queryCommentArticleRecord(
                                    parent: articlePageArticlesRecord.reference,
                                    queryBuilder: (commentArticleRecord) =>
                                        commentArticleRecord
                                            .orderBy('comment_article_time'),
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
                                    List<CommentArticleRecord>
                                        listViewCommentArticleRecordList =
                                        snapshot.data!;
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
                                      itemCount:
                                          listViewCommentArticleRecordList
                                              .length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 20.0),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewCommentArticleRecord =
                                            listViewCommentArticleRecordList[
                                                listViewIndex];
                                        return wrapWithModel(
                                          model: _model.commentArticleModels
                                              .getModel(
                                            listViewCommentArticleRecord
                                                .reference.id,
                                            listViewIndex,
                                          ),
                                          updateCallback: () => setState(() {}),
                                          updateOnChange: true,
                                          child: CommentArticleWidget(
                                            key: Key(
                                              'Keyvf3_${listViewCommentArticleRecord.reference.id}',
                                            ),
                                            commentArticleRef:
                                                listViewCommentArticleRecord
                                                    .reference,
                                          ),
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
                    ],
                  ),
                ),
                if (!_model.commentShow)
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
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
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
                                    25.0, 0.0, 25.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (articlePageArticlesRecord
                                            .articleActivities
                                            .contains(currentUserReference))
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await articlePageArticlesRecord
                                                  .reference
                                                  .update({
                                                'article_activities':
                                                    FieldValue.arrayRemove(
                                                        [currentUserReference]),
                                              });
                                              await actions.updatePage(
                                                context,
                                              );
                                            },
                                            child: Icon(
                                              FFIcons.kbatteryactivityFill,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 24.0,
                                            ),
                                          ),
                                        if (!articlePageArticlesRecord
                                            .articleActivities
                                            .contains(currentUserReference))
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await articlePageArticlesRecord
                                                  .reference
                                                  .update({
                                                'article_activities':
                                                    FieldValue.arrayUnion(
                                                        [currentUserReference]),
                                              });
                                              await actions.updatePage(
                                                context,
                                              );
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
                                            '${formatNumber(
                                              articlePageArticlesRecord
                                                  .articleActivities.length,
                                              formatType: FormatType.compact,
                                            )} activities',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .dark88,
                                                  fontSize: 14.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          _model.commentShow = true;
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
                                              '${formatNumber(
                                                articlePageArticlesRecord
                                                    .articleCommentsList.length,
                                                formatType: FormatType.compact,
                                              )} comments',
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (_model.commentShow)
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 0.0,
                      child: Container(
                        width: double.infinity,
                        height: 90.0,
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
                                        'https://firebasestorage.googleapis.com/v0/b/guiid-metier.appspot.com/o/Avatar%3DWithout%20pic%2C%20SIze%3D35.png?alt=media&token=546929f4-9bce-4782-874d-49bc34b5e041',
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
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: 'your comment',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Libre Franklin',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .dark38,
                                                fontSize: 15.0,
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
                                          var commentArticleRecordReference =
                                              CommentArticleRecord.createDoc(
                                                  articlePageArticlesRecord
                                                      .reference);
                                          await commentArticleRecordReference
                                              .set(
                                                  createCommentArticleRecordData(
                                            commentArticleUser:
                                                currentUserReference,
                                            commentArticleText:
                                                _model.textController.text,
                                            commentArticleTime:
                                                getCurrentTimestamp,
                                          ));
                                          _model.comment = CommentArticleRecord
                                              .getDocumentFromData(
                                                  createCommentArticleRecordData(
                                                    commentArticleUser:
                                                        currentUserReference,
                                                    commentArticleText: _model
                                                        .textController.text,
                                                    commentArticleTime:
                                                        getCurrentTimestamp,
                                                  ),
                                                  commentArticleRecordReference);

                                          await articlePageArticlesRecord
                                              .reference
                                              .update({
                                            'article_comments_list':
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
            ),
          ),
        );
      },
    );
  }
}
