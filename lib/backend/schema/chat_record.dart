import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRecord extends FirestoreRecord {
  ChatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "chat_with_support_id" field.
  String? _chatWithSupportId;
  String get chatWithSupportId => _chatWithSupportId ?? '';
  bool hasChatWithSupportId() => _chatWithSupportId != null;

  // "chat_with_support_creator" field.
  DocumentReference? _chatWithSupportCreator;
  DocumentReference? get chatWithSupportCreator => _chatWithSupportCreator;
  bool hasChatWithSupportCreator() => _chatWithSupportCreator != null;

  // "chat_with_support_type" field.
  String? _chatWithSupportType;
  String get chatWithSupportType => _chatWithSupportType ?? '';
  bool hasChatWithSupportType() => _chatWithSupportType != null;

  // "chat_with_support_status" field.
  String? _chatWithSupportStatus;
  String get chatWithSupportStatus => _chatWithSupportStatus ?? '';
  bool hasChatWithSupportStatus() => _chatWithSupportStatus != null;

  // "chat_last_time_message" field.
  DateTime? _chatLastTimeMessage;
  DateTime? get chatLastTimeMessage => _chatLastTimeMessage;
  bool hasChatLastTimeMessage() => _chatLastTimeMessage != null;

  // "chat_last_message" field.
  String? _chatLastMessage;
  String get chatLastMessage => _chatLastMessage ?? '';
  bool hasChatLastMessage() => _chatLastMessage != null;

  void _initializeFields() {
    _chatWithSupportId = snapshotData['chat_with_support_id'] as String?;
    _chatWithSupportCreator =
        snapshotData['chat_with_support_creator'] as DocumentReference?;
    _chatWithSupportType = snapshotData['chat_with_support_type'] as String?;
    _chatWithSupportStatus =
        snapshotData['chat_with_support_status'] as String?;
    _chatLastTimeMessage = snapshotData['chat_last_time_message'] as DateTime?;
    _chatLastMessage = snapshotData['chat_last_message'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat');

  static Stream<ChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatRecord.fromSnapshot(s));

  static Future<ChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatRecord.fromSnapshot(s));

  static ChatRecord fromSnapshot(DocumentSnapshot snapshot) => ChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatRecordData({
  String? chatWithSupportId,
  DocumentReference? chatWithSupportCreator,
  String? chatWithSupportType,
  String? chatWithSupportStatus,
  DateTime? chatLastTimeMessage,
  String? chatLastMessage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'chat_with_support_id': chatWithSupportId,
      'chat_with_support_creator': chatWithSupportCreator,
      'chat_with_support_type': chatWithSupportType,
      'chat_with_support_status': chatWithSupportStatus,
      'chat_last_time_message': chatLastTimeMessage,
      'chat_last_message': chatLastMessage,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatRecordDocumentEquality implements Equality<ChatRecord> {
  const ChatRecordDocumentEquality();

  @override
  bool equals(ChatRecord? e1, ChatRecord? e2) {
    return e1?.chatWithSupportId == e2?.chatWithSupportId &&
        e1?.chatWithSupportCreator == e2?.chatWithSupportCreator &&
        e1?.chatWithSupportType == e2?.chatWithSupportType &&
        e1?.chatWithSupportStatus == e2?.chatWithSupportStatus &&
        e1?.chatLastTimeMessage == e2?.chatLastTimeMessage &&
        e1?.chatLastMessage == e2?.chatLastMessage;
  }

  @override
  int hash(ChatRecord? e) => const ListEquality().hash([
        e?.chatWithSupportId,
        e?.chatWithSupportCreator,
        e?.chatWithSupportType,
        e?.chatWithSupportStatus,
        e?.chatLastTimeMessage,
        e?.chatLastMessage
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatRecord;
}
