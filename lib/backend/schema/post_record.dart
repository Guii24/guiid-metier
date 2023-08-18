import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostRecord extends FirestoreRecord {
  PostRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "post_images_list" field.
  List<String>? _postImagesList;
  List<String> get postImagesList => _postImagesList ?? const [];
  bool hasPostImagesList() => _postImagesList != null;

  // "post_text" field.
  String? _postText;
  String get postText => _postText ?? '';
  bool hasPostText() => _postText != null;

  // "post_time_posted" field.
  DateTime? _postTimePosted;
  DateTime? get postTimePosted => _postTimePosted;
  bool hasPostTimePosted() => _postTimePosted != null;

  // "post_creator" field.
  DocumentReference? _postCreator;
  DocumentReference? get postCreator => _postCreator;
  bool hasPostCreator() => _postCreator != null;

  // "post_activities" field.
  List<DocumentReference>? _postActivities;
  List<DocumentReference> get postActivities => _postActivities ?? const [];
  bool hasPostActivities() => _postActivities != null;

  // "post_comments_list" field.
  List<DocumentReference>? _postCommentsList;
  List<DocumentReference> get postCommentsList => _postCommentsList ?? const [];
  bool hasPostCommentsList() => _postCommentsList != null;

  // "post_category" field.
  List<String>? _postCategory;
  List<String> get postCategory => _postCategory ?? const [];
  bool hasPostCategory() => _postCategory != null;

  // "post_isReposted" field.
  bool? _postIsReposted;
  bool get postIsReposted => _postIsReposted ?? false;
  bool hasPostIsReposted() => _postIsReposted != null;

  // "post_reposted_creator" field.
  DocumentReference? _postRepostedCreator;
  DocumentReference? get postRepostedCreator => _postRepostedCreator;
  bool hasPostRepostedCreator() => _postRepostedCreator != null;

  // "post_reposted_post" field.
  DocumentReference? _postRepostedPost;
  DocumentReference? get postRepostedPost => _postRepostedPost;
  bool hasPostRepostedPost() => _postRepostedPost != null;

  void _initializeFields() {
    _postImagesList = getDataList(snapshotData['post_images_list']);
    _postText = snapshotData['post_text'] as String?;
    _postTimePosted = snapshotData['post_time_posted'] as DateTime?;
    _postCreator = snapshotData['post_creator'] as DocumentReference?;
    _postActivities = getDataList(snapshotData['post_activities']);
    _postCommentsList = getDataList(snapshotData['post_comments_list']);
    _postCategory = getDataList(snapshotData['post_category']);
    _postIsReposted = snapshotData['post_isReposted'] as bool?;
    _postRepostedCreator =
        snapshotData['post_reposted_creator'] as DocumentReference?;
    _postRepostedPost =
        snapshotData['post_reposted_post'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('post');

  static Stream<PostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostRecord.fromSnapshot(s));

  static Future<PostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostRecord.fromSnapshot(s));

  static PostRecord fromSnapshot(DocumentSnapshot snapshot) => PostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostRecordData({
  String? postText,
  DateTime? postTimePosted,
  DocumentReference? postCreator,
  bool? postIsReposted,
  DocumentReference? postRepostedCreator,
  DocumentReference? postRepostedPost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_text': postText,
      'post_time_posted': postTimePosted,
      'post_creator': postCreator,
      'post_isReposted': postIsReposted,
      'post_reposted_creator': postRepostedCreator,
      'post_reposted_post': postRepostedPost,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostRecordDocumentEquality implements Equality<PostRecord> {
  const PostRecordDocumentEquality();

  @override
  bool equals(PostRecord? e1, PostRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.postImagesList, e2?.postImagesList) &&
        e1?.postText == e2?.postText &&
        e1?.postTimePosted == e2?.postTimePosted &&
        e1?.postCreator == e2?.postCreator &&
        listEquality.equals(e1?.postActivities, e2?.postActivities) &&
        listEquality.equals(e1?.postCommentsList, e2?.postCommentsList) &&
        listEquality.equals(e1?.postCategory, e2?.postCategory) &&
        e1?.postIsReposted == e2?.postIsReposted &&
        e1?.postRepostedCreator == e2?.postRepostedCreator &&
        e1?.postRepostedPost == e2?.postRepostedPost;
  }

  @override
  int hash(PostRecord? e) => const ListEquality().hash([
        e?.postImagesList,
        e?.postText,
        e?.postTimePosted,
        e?.postCreator,
        e?.postActivities,
        e?.postCommentsList,
        e?.postCategory,
        e?.postIsReposted,
        e?.postRepostedCreator,
        e?.postRepostedPost
      ]);

  @override
  bool isValidKey(Object? o) => o is PostRecord;
}
