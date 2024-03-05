import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentArticleRecord extends FirestoreRecord {
  CommentArticleRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comment_article_user" field.
  DocumentReference? _commentArticleUser;
  DocumentReference? get commentArticleUser => _commentArticleUser;
  bool hasCommentArticleUser() => _commentArticleUser != null;

  // "comment_article_text" field.
  String? _commentArticleText;
  String get commentArticleText => _commentArticleText ?? '';
  bool hasCommentArticleText() => _commentArticleText != null;

  // "comment_article_time" field.
  DateTime? _commentArticleTime;
  DateTime? get commentArticleTime => _commentArticleTime;
  bool hasCommentArticleTime() => _commentArticleTime != null;

  // "comment_article_post" field.
  DocumentReference? _commentArticlePost;
  DocumentReference? get commentArticlePost => _commentArticlePost;
  bool hasCommentArticlePost() => _commentArticlePost != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _commentArticleUser =
        snapshotData['comment_article_user'] as DocumentReference?;
    _commentArticleText = snapshotData['comment_article_text'] as String?;
    _commentArticleTime = snapshotData['comment_article_time'] as DateTime?;
    _commentArticlePost =
        snapshotData['comment_article_post'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('comment_article')
          : FirebaseFirestore.instance.collectionGroup('comment_article');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('comment_article').doc(id);

  static Stream<CommentArticleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentArticleRecord.fromSnapshot(s));

  static Future<CommentArticleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentArticleRecord.fromSnapshot(s));

  static CommentArticleRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentArticleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentArticleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentArticleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentArticleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentArticleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentArticleRecordData({
  DocumentReference? commentArticleUser,
  String? commentArticleText,
  DateTime? commentArticleTime,
  DocumentReference? commentArticlePost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment_article_user': commentArticleUser,
      'comment_article_text': commentArticleText,
      'comment_article_time': commentArticleTime,
      'comment_article_post': commentArticlePost,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentArticleRecordDocumentEquality
    implements Equality<CommentArticleRecord> {
  const CommentArticleRecordDocumentEquality();

  @override
  bool equals(CommentArticleRecord? e1, CommentArticleRecord? e2) {
    return e1?.commentArticleUser == e2?.commentArticleUser &&
        e1?.commentArticleText == e2?.commentArticleText &&
        e1?.commentArticleTime == e2?.commentArticleTime &&
        e1?.commentArticlePost == e2?.commentArticlePost;
  }

  @override
  int hash(CommentArticleRecord? e) => const ListEquality().hash([
        e?.commentArticleUser,
        e?.commentArticleText,
        e?.commentArticleTime,
        e?.commentArticlePost
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentArticleRecord;
}
