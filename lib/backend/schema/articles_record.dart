import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArticlesRecord extends FirestoreRecord {
  ArticlesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "article_title" field.
  String? _articleTitle;
  String get articleTitle => _articleTitle ?? '';
  bool hasArticleTitle() => _articleTitle != null;

  // "article_image_list" field.
  List<String>? _articleImageList;
  List<String> get articleImageList => _articleImageList ?? const [];
  bool hasArticleImageList() => _articleImageList != null;

  // "article_text" field.
  String? _articleText;
  String get articleText => _articleText ?? '';
  bool hasArticleText() => _articleText != null;

  // "article_creator" field.
  DocumentReference? _articleCreator;
  DocumentReference? get articleCreator => _articleCreator;
  bool hasArticleCreator() => _articleCreator != null;

  // "article_activities" field.
  List<DocumentReference>? _articleActivities;
  List<DocumentReference> get articleActivities =>
      _articleActivities ?? const [];
  bool hasArticleActivities() => _articleActivities != null;

  // "article_time_posted" field.
  DateTime? _articleTimePosted;
  DateTime? get articleTimePosted => _articleTimePosted;
  bool hasArticleTimePosted() => _articleTimePosted != null;

  // "article_is_top_article" field.
  bool? _articleIsTopArticle;
  bool get articleIsTopArticle => _articleIsTopArticle ?? false;
  bool hasArticleIsTopArticle() => _articleIsTopArticle != null;

  // "article_comments_list" field.
  List<DocumentReference>? _articleCommentsList;
  List<DocumentReference> get articleCommentsList =>
      _articleCommentsList ?? const [];
  bool hasArticleCommentsList() => _articleCommentsList != null;

  void _initializeFields() {
    _articleTitle = snapshotData['article_title'] as String?;
    _articleImageList = getDataList(snapshotData['article_image_list']);
    _articleText = snapshotData['article_text'] as String?;
    _articleCreator = snapshotData['article_creator'] as DocumentReference?;
    _articleActivities = getDataList(snapshotData['article_activities']);
    _articleTimePosted = snapshotData['article_time_posted'] as DateTime?;
    _articleIsTopArticle = snapshotData['article_is_top_article'] as bool?;
    _articleCommentsList = getDataList(snapshotData['article_comments_list']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('articles');

  static Stream<ArticlesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArticlesRecord.fromSnapshot(s));

  static Future<ArticlesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ArticlesRecord.fromSnapshot(s));

  static ArticlesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArticlesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArticlesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArticlesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArticlesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArticlesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArticlesRecordData({
  String? articleTitle,
  String? articleText,
  DocumentReference? articleCreator,
  DateTime? articleTimePosted,
  bool? articleIsTopArticle,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'article_title': articleTitle,
      'article_text': articleText,
      'article_creator': articleCreator,
      'article_time_posted': articleTimePosted,
      'article_is_top_article': articleIsTopArticle,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArticlesRecordDocumentEquality implements Equality<ArticlesRecord> {
  const ArticlesRecordDocumentEquality();

  @override
  bool equals(ArticlesRecord? e1, ArticlesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.articleTitle == e2?.articleTitle &&
        listEquality.equals(e1?.articleImageList, e2?.articleImageList) &&
        e1?.articleText == e2?.articleText &&
        e1?.articleCreator == e2?.articleCreator &&
        listEquality.equals(e1?.articleActivities, e2?.articleActivities) &&
        e1?.articleTimePosted == e2?.articleTimePosted &&
        e1?.articleIsTopArticle == e2?.articleIsTopArticle &&
        listEquality.equals(e1?.articleCommentsList, e2?.articleCommentsList);
  }

  @override
  int hash(ArticlesRecord? e) => const ListEquality().hash([
        e?.articleTitle,
        e?.articleImageList,
        e?.articleText,
        e?.articleCreator,
        e?.articleActivities,
        e?.articleTimePosted,
        e?.articleIsTopArticle,
        e?.articleCommentsList
      ]);

  @override
  bool isValidKey(Object? o) => o is ArticlesRecord;
}
