import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JobApplicantsRecord extends FirestoreRecord {
  JobApplicantsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "job_applicants_creation_date" field.
  DateTime? _jobApplicantsCreationDate;
  DateTime? get jobApplicantsCreationDate => _jobApplicantsCreationDate;
  bool hasJobApplicantsCreationDate() => _jobApplicantsCreationDate != null;

  // "job_applicant_user" field.
  DocumentReference? _jobApplicantUser;
  DocumentReference? get jobApplicantUser => _jobApplicantUser;
  bool hasJobApplicantUser() => _jobApplicantUser != null;

  // "job_applicant_name" field.
  String? _jobApplicantName;
  String get jobApplicantName => _jobApplicantName ?? '';
  bool hasJobApplicantName() => _jobApplicantName != null;

  // "job_applicant_tittle" field.
  String? _jobApplicantTittle;
  String get jobApplicantTittle => _jobApplicantTittle ?? '';
  bool hasJobApplicantTittle() => _jobApplicantTittle != null;

  // "job_applicant_email" field.
  String? _jobApplicantEmail;
  String get jobApplicantEmail => _jobApplicantEmail ?? '';
  bool hasJobApplicantEmail() => _jobApplicantEmail != null;

  // "job_applicant_cv" field.
  String? _jobApplicantCv;
  String get jobApplicantCv => _jobApplicantCv ?? '';
  bool hasJobApplicantCv() => _jobApplicantCv != null;

  // "job_applicant_phone_number" field.
  String? _jobApplicantPhoneNumber;
  String get jobApplicantPhoneNumber => _jobApplicantPhoneNumber ?? '';
  bool hasJobApplicantPhoneNumber() => _jobApplicantPhoneNumber != null;

  // "job_applicant_portfolio" field.
  String? _jobApplicantPortfolio;
  String get jobApplicantPortfolio => _jobApplicantPortfolio ?? '';
  bool hasJobApplicantPortfolio() => _jobApplicantPortfolio != null;

  // "job_applicant_portfolio_link" field.
  String? _jobApplicantPortfolioLink;
  String get jobApplicantPortfolioLink => _jobApplicantPortfolioLink ?? '';
  bool hasJobApplicantPortfolioLink() => _jobApplicantPortfolioLink != null;

  // "job_applicant_insatgram" field.
  String? _jobApplicantInsatgram;
  String get jobApplicantInsatgram => _jobApplicantInsatgram ?? '';
  bool hasJobApplicantInsatgram() => _jobApplicantInsatgram != null;

  // "job_applicant_tiktok" field.
  String? _jobApplicantTiktok;
  String get jobApplicantTiktok => _jobApplicantTiktok ?? '';
  bool hasJobApplicantTiktok() => _jobApplicantTiktok != null;

  // "job_applicant_linkedin" field.
  String? _jobApplicantLinkedin;
  String get jobApplicantLinkedin => _jobApplicantLinkedin ?? '';
  bool hasJobApplicantLinkedin() => _jobApplicantLinkedin != null;

  // "job_applicant_job_ref" field.
  DocumentReference? _jobApplicantJobRef;
  DocumentReference? get jobApplicantJobRef => _jobApplicantJobRef;
  bool hasJobApplicantJobRef() => _jobApplicantJobRef != null;

  // "job_applicant_phone_code" field.
  String? _jobApplicantPhoneCode;
  String get jobApplicantPhoneCode => _jobApplicantPhoneCode ?? '';
  bool hasJobApplicantPhoneCode() => _jobApplicantPhoneCode != null;

  // "job_applicant_phone_dial_code" field.
  String? _jobApplicantPhoneDialCode;
  String get jobApplicantPhoneDialCode => _jobApplicantPhoneDialCode ?? '';
  bool hasJobApplicantPhoneDialCode() => _jobApplicantPhoneDialCode != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _jobApplicantsCreationDate =
        snapshotData['job_applicants_creation_date'] as DateTime?;
    _jobApplicantUser =
        snapshotData['job_applicant_user'] as DocumentReference?;
    _jobApplicantName = snapshotData['job_applicant_name'] as String?;
    _jobApplicantTittle = snapshotData['job_applicant_tittle'] as String?;
    _jobApplicantEmail = snapshotData['job_applicant_email'] as String?;
    _jobApplicantCv = snapshotData['job_applicant_cv'] as String?;
    _jobApplicantPhoneNumber =
        snapshotData['job_applicant_phone_number'] as String?;
    _jobApplicantPortfolio = snapshotData['job_applicant_portfolio'] as String?;
    _jobApplicantPortfolioLink =
        snapshotData['job_applicant_portfolio_link'] as String?;
    _jobApplicantInsatgram = snapshotData['job_applicant_insatgram'] as String?;
    _jobApplicantTiktok = snapshotData['job_applicant_tiktok'] as String?;
    _jobApplicantLinkedin = snapshotData['job_applicant_linkedin'] as String?;
    _jobApplicantJobRef =
        snapshotData['job_applicant_job_ref'] as DocumentReference?;
    _jobApplicantPhoneCode =
        snapshotData['job_applicant_phone_code'] as String?;
    _jobApplicantPhoneDialCode =
        snapshotData['job_applicant_phone_dial_code'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('job_applicants')
          : FirebaseFirestore.instance.collectionGroup('job_applicants');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('job_applicants').doc(id);

  static Stream<JobApplicantsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JobApplicantsRecord.fromSnapshot(s));

  static Future<JobApplicantsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JobApplicantsRecord.fromSnapshot(s));

  static JobApplicantsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      JobApplicantsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JobApplicantsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JobApplicantsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JobApplicantsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JobApplicantsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJobApplicantsRecordData({
  DateTime? jobApplicantsCreationDate,
  DocumentReference? jobApplicantUser,
  String? jobApplicantName,
  String? jobApplicantTittle,
  String? jobApplicantEmail,
  String? jobApplicantCv,
  String? jobApplicantPhoneNumber,
  String? jobApplicantPortfolio,
  String? jobApplicantPortfolioLink,
  String? jobApplicantInsatgram,
  String? jobApplicantTiktok,
  String? jobApplicantLinkedin,
  DocumentReference? jobApplicantJobRef,
  String? jobApplicantPhoneCode,
  String? jobApplicantPhoneDialCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'job_applicants_creation_date': jobApplicantsCreationDate,
      'job_applicant_user': jobApplicantUser,
      'job_applicant_name': jobApplicantName,
      'job_applicant_tittle': jobApplicantTittle,
      'job_applicant_email': jobApplicantEmail,
      'job_applicant_cv': jobApplicantCv,
      'job_applicant_phone_number': jobApplicantPhoneNumber,
      'job_applicant_portfolio': jobApplicantPortfolio,
      'job_applicant_portfolio_link': jobApplicantPortfolioLink,
      'job_applicant_insatgram': jobApplicantInsatgram,
      'job_applicant_tiktok': jobApplicantTiktok,
      'job_applicant_linkedin': jobApplicantLinkedin,
      'job_applicant_job_ref': jobApplicantJobRef,
      'job_applicant_phone_code': jobApplicantPhoneCode,
      'job_applicant_phone_dial_code': jobApplicantPhoneDialCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class JobApplicantsRecordDocumentEquality
    implements Equality<JobApplicantsRecord> {
  const JobApplicantsRecordDocumentEquality();

  @override
  bool equals(JobApplicantsRecord? e1, JobApplicantsRecord? e2) {
    return e1?.jobApplicantsCreationDate == e2?.jobApplicantsCreationDate &&
        e1?.jobApplicantUser == e2?.jobApplicantUser &&
        e1?.jobApplicantName == e2?.jobApplicantName &&
        e1?.jobApplicantTittle == e2?.jobApplicantTittle &&
        e1?.jobApplicantEmail == e2?.jobApplicantEmail &&
        e1?.jobApplicantCv == e2?.jobApplicantCv &&
        e1?.jobApplicantPhoneNumber == e2?.jobApplicantPhoneNumber &&
        e1?.jobApplicantPortfolio == e2?.jobApplicantPortfolio &&
        e1?.jobApplicantPortfolioLink == e2?.jobApplicantPortfolioLink &&
        e1?.jobApplicantInsatgram == e2?.jobApplicantInsatgram &&
        e1?.jobApplicantTiktok == e2?.jobApplicantTiktok &&
        e1?.jobApplicantLinkedin == e2?.jobApplicantLinkedin &&
        e1?.jobApplicantJobRef == e2?.jobApplicantJobRef &&
        e1?.jobApplicantPhoneCode == e2?.jobApplicantPhoneCode &&
        e1?.jobApplicantPhoneDialCode == e2?.jobApplicantPhoneDialCode;
  }

  @override
  int hash(JobApplicantsRecord? e) => const ListEquality().hash([
        e?.jobApplicantsCreationDate,
        e?.jobApplicantUser,
        e?.jobApplicantName,
        e?.jobApplicantTittle,
        e?.jobApplicantEmail,
        e?.jobApplicantCv,
        e?.jobApplicantPhoneNumber,
        e?.jobApplicantPortfolio,
        e?.jobApplicantPortfolioLink,
        e?.jobApplicantInsatgram,
        e?.jobApplicantTiktok,
        e?.jobApplicantLinkedin,
        e?.jobApplicantJobRef,
        e?.jobApplicantPhoneCode,
        e?.jobApplicantPhoneDialCode
      ]);

  @override
  bool isValidKey(Object? o) => o is JobApplicantsRecord;
}
