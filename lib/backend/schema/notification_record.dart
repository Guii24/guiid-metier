import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationRecord extends FirestoreRecord {
  NotificationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "notification_from" field.
  DocumentReference? _notificationFrom;
  DocumentReference? get notificationFrom => _notificationFrom;
  bool hasNotificationFrom() => _notificationFrom != null;

  // "notification_to" field.
  DocumentReference? _notificationTo;
  DocumentReference? get notificationTo => _notificationTo;
  bool hasNotificationTo() => _notificationTo != null;

  // "notification_type" field.
  String? _notificationType;
  String get notificationType => _notificationType ?? '';
  bool hasNotificationType() => _notificationType != null;

  // "notification_post" field.
  DocumentReference? _notificationPost;
  DocumentReference? get notificationPost => _notificationPost;
  bool hasNotificationPost() => _notificationPost != null;

  // "notification_text" field.
  String? _notificationText;
  String get notificationText => _notificationText ?? '';
  bool hasNotificationText() => _notificationText != null;

  // "notification_creation_date" field.
  DateTime? _notificationCreationDate;
  DateTime? get notificationCreationDate => _notificationCreationDate;
  bool hasNotificationCreationDate() => _notificationCreationDate != null;

  // "notification_job" field.
  DocumentReference? _notificationJob;
  DocumentReference? get notificationJob => _notificationJob;
  bool hasNotificationJob() => _notificationJob != null;

  void _initializeFields() {
    _notificationFrom = snapshotData['notification_from'] as DocumentReference?;
    _notificationTo = snapshotData['notification_to'] as DocumentReference?;
    _notificationType = snapshotData['notification_type'] as String?;
    _notificationPost = snapshotData['notification_post'] as DocumentReference?;
    _notificationText = snapshotData['notification_text'] as String?;
    _notificationCreationDate =
        snapshotData['notification_creation_date'] as DateTime?;
    _notificationJob = snapshotData['notification_job'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notification');

  static Stream<NotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationRecord.fromSnapshot(s));

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationRecord.fromSnapshot(s));

  static NotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationRecordData({
  DocumentReference? notificationFrom,
  DocumentReference? notificationTo,
  String? notificationType,
  DocumentReference? notificationPost,
  String? notificationText,
  DateTime? notificationCreationDate,
  DocumentReference? notificationJob,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notification_from': notificationFrom,
      'notification_to': notificationTo,
      'notification_type': notificationType,
      'notification_post': notificationPost,
      'notification_text': notificationText,
      'notification_creation_date': notificationCreationDate,
      'notification_job': notificationJob,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationRecordDocumentEquality
    implements Equality<NotificationRecord> {
  const NotificationRecordDocumentEquality();

  @override
  bool equals(NotificationRecord? e1, NotificationRecord? e2) {
    return e1?.notificationFrom == e2?.notificationFrom &&
        e1?.notificationTo == e2?.notificationTo &&
        e1?.notificationType == e2?.notificationType &&
        e1?.notificationPost == e2?.notificationPost &&
        e1?.notificationText == e2?.notificationText &&
        e1?.notificationCreationDate == e2?.notificationCreationDate &&
        e1?.notificationJob == e2?.notificationJob;
  }

  @override
  int hash(NotificationRecord? e) => const ListEquality().hash([
        e?.notificationFrom,
        e?.notificationTo,
        e?.notificationType,
        e?.notificationPost,
        e?.notificationText,
        e?.notificationCreationDate,
        e?.notificationJob
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}
