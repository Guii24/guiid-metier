import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentPostRecord extends FirestoreRecord {
  CommentPostRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comment_post_user" field.
  DocumentReference? _commentPostUser;
  DocumentReference? get commentPostUser => _commentPostUser;
  bool hasCommentPostUser() => _commentPostUser != null;

  // "comment_post_text" field.
  String? _commentPostText;
  String get commentPostText => _commentPostText ?? '';
  bool hasCommentPostText() => _commentPostText != null;

  // "comment_post_time" field.
  DateTime? _commentPostTime;
  DateTime? get commentPostTime => _commentPostTime;
  bool hasCommentPostTime() => _commentPostTime != null;

  // "comment_post_post" field.
  DocumentReference? _commentPostPost;
  DocumentReference? get commentPostPost => _commentPostPost;
  bool hasCommentPostPost() => _commentPostPost != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _commentPostUser = snapshotData['comment_post_user'] as DocumentReference?;
    _commentPostText = snapshotData['comment_post_text'] as String?;
    _commentPostTime = snapshotData['comment_post_time'] as DateTime?;
    _commentPostPost = snapshotData['comment_post_post'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('comment_post')
          : FirebaseFirestore.instance.collectionGroup('comment_post');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('comment_post').doc();

  static Stream<CommentPostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentPostRecord.fromSnapshot(s));

  static Future<CommentPostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentPostRecord.fromSnapshot(s));

  static CommentPostRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentPostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentPostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentPostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentPostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentPostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentPostRecordData({
  DocumentReference? commentPostUser,
  String? commentPostText,
  DateTime? commentPostTime,
  DocumentReference? commentPostPost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment_post_user': commentPostUser,
      'comment_post_text': commentPostText,
      'comment_post_time': commentPostTime,
      'comment_post_post': commentPostPost,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentPostRecordDocumentEquality implements Equality<CommentPostRecord> {
  const CommentPostRecordDocumentEquality();

  @override
  bool equals(CommentPostRecord? e1, CommentPostRecord? e2) {
    return e1?.commentPostUser == e2?.commentPostUser &&
        e1?.commentPostText == e2?.commentPostText &&
        e1?.commentPostTime == e2?.commentPostTime &&
        e1?.commentPostPost == e2?.commentPostPost;
  }

  @override
  int hash(CommentPostRecord? e) => const ListEquality().hash([
        e?.commentPostUser,
        e?.commentPostText,
        e?.commentPostTime,
        e?.commentPostPost
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentPostRecord;
}
