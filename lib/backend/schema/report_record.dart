import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportRecord extends FirestoreRecord {
  ReportRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "report_from" field.
  DocumentReference? _reportFrom;
  DocumentReference? get reportFrom => _reportFrom;
  bool hasReportFrom() => _reportFrom != null;

  // "report_time" field.
  DateTime? _reportTime;
  DateTime? get reportTime => _reportTime;
  bool hasReportTime() => _reportTime != null;

  // "report_reason" field.
  String? _reportReason;
  String get reportReason => _reportReason ?? '';
  bool hasReportReason() => _reportReason != null;

  // "report_to_post" field.
  DocumentReference? _reportToPost;
  DocumentReference? get reportToPost => _reportToPost;
  bool hasReportToPost() => _reportToPost != null;

  // "report_to_comm_post" field.
  DocumentReference? _reportToCommPost;
  DocumentReference? get reportToCommPost => _reportToCommPost;
  bool hasReportToCommPost() => _reportToCommPost != null;

  void _initializeFields() {
    _reportFrom = snapshotData['report_from'] as DocumentReference?;
    _reportTime = snapshotData['report_time'] as DateTime?;
    _reportReason = snapshotData['report_reason'] as String?;
    _reportToPost = snapshotData['report_to_post'] as DocumentReference?;
    _reportToCommPost =
        snapshotData['report_to_comm_post'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('report');

  static Stream<ReportRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportRecord.fromSnapshot(s));

  static Future<ReportRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportRecord.fromSnapshot(s));

  static ReportRecord fromSnapshot(DocumentSnapshot snapshot) => ReportRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportRecordData({
  DocumentReference? reportFrom,
  DateTime? reportTime,
  String? reportReason,
  DocumentReference? reportToPost,
  DocumentReference? reportToCommPost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'report_from': reportFrom,
      'report_time': reportTime,
      'report_reason': reportReason,
      'report_to_post': reportToPost,
      'report_to_comm_post': reportToCommPost,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportRecordDocumentEquality implements Equality<ReportRecord> {
  const ReportRecordDocumentEquality();

  @override
  bool equals(ReportRecord? e1, ReportRecord? e2) {
    return e1?.reportFrom == e2?.reportFrom &&
        e1?.reportTime == e2?.reportTime &&
        e1?.reportReason == e2?.reportReason &&
        e1?.reportToPost == e2?.reportToPost &&
        e1?.reportToCommPost == e2?.reportToCommPost;
  }

  @override
  int hash(ReportRecord? e) => const ListEquality().hash([
        e?.reportFrom,
        e?.reportTime,
        e?.reportReason,
        e?.reportToPost,
        e?.reportToCommPost
      ]);

  @override
  bool isValidKey(Object? o) => o is ReportRecord;
}
