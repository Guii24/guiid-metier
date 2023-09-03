import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageRecord extends FirestoreRecord {
  MessageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "message_text" field.
  String? _messageText;
  String get messageText => _messageText ?? '';
  bool hasMessageText() => _messageText != null;

  // "message_time" field.
  DateTime? _messageTime;
  DateTime? get messageTime => _messageTime;
  bool hasMessageTime() => _messageTime != null;

  // "message_author" field.
  DocumentReference? _messageAuthor;
  DocumentReference? get messageAuthor => _messageAuthor;
  bool hasMessageAuthor() => _messageAuthor != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _messageText = snapshotData['message_text'] as String?;
    _messageTime = snapshotData['message_time'] as DateTime?;
    _messageAuthor = snapshotData['message_author'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('message')
          : FirebaseFirestore.instance.collectionGroup('message');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('message').doc();

  static Stream<MessageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessageRecord.fromSnapshot(s));

  static Future<MessageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessageRecord.fromSnapshot(s));

  static MessageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessageRecordData({
  String? messageText,
  DateTime? messageTime,
  DocumentReference? messageAuthor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message_text': messageText,
      'message_time': messageTime,
      'message_author': messageAuthor,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessageRecordDocumentEquality implements Equality<MessageRecord> {
  const MessageRecordDocumentEquality();

  @override
  bool equals(MessageRecord? e1, MessageRecord? e2) {
    return e1?.messageText == e2?.messageText &&
        e1?.messageTime == e2?.messageTime &&
        e1?.messageAuthor == e2?.messageAuthor;
  }

  @override
  int hash(MessageRecord? e) => const ListEquality()
      .hash([e?.messageText, e?.messageTime, e?.messageAuthor]);

  @override
  bool isValidKey(Object? o) => o is MessageRecord;
}
