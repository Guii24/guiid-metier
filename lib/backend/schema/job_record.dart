import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JobRecord extends FirestoreRecord {
  JobRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "company_creator" field.
  DocumentReference? _companyCreator;
  DocumentReference? get companyCreator => _companyCreator;
  bool hasCompanyCreator() => _companyCreator != null;

  // "job_tittle" field.
  String? _jobTittle;
  String get jobTittle => _jobTittle ?? '';
  bool hasJobTittle() => _jobTittle != null;

  // "job_description" field.
  String? _jobDescription;
  String get jobDescription => _jobDescription ?? '';
  bool hasJobDescription() => _jobDescription != null;

  // "job_salary_rate" field.
  String? _jobSalaryRate;
  String get jobSalaryRate => _jobSalaryRate ?? '';
  bool hasJobSalaryRate() => _jobSalaryRate != null;

  // "job_location" field.
  String? _jobLocation;
  String get jobLocation => _jobLocation ?? '';
  bool hasJobLocation() => _jobLocation != null;

  // "job_contact_phone_number" field.
  String? _jobContactPhoneNumber;
  String get jobContactPhoneNumber => _jobContactPhoneNumber ?? '';
  bool hasJobContactPhoneNumber() => _jobContactPhoneNumber != null;

  // "job_contact_email" field.
  String? _jobContactEmail;
  String get jobContactEmail => _jobContactEmail ?? '';
  bool hasJobContactEmail() => _jobContactEmail != null;

  // "job_creation_date" field.
  DateTime? _jobCreationDate;
  DateTime? get jobCreationDate => _jobCreationDate;
  bool hasJobCreationDate() => _jobCreationDate != null;

  // "job_applicants_user_list" field.
  List<DocumentReference>? _jobApplicantsUserList;
  List<DocumentReference> get jobApplicantsUserList =>
      _jobApplicantsUserList ?? const [];
  bool hasJobApplicantsUserList() => _jobApplicantsUserList != null;

  // "job_work_location" field.
  String? _jobWorkLocation;
  String get jobWorkLocation => _jobWorkLocation ?? '';
  bool hasJobWorkLocation() => _jobWorkLocation != null;

  // "job_employment_type" field.
  String? _jobEmploymentType;
  String get jobEmploymentType => _jobEmploymentType ?? '';
  bool hasJobEmploymentType() => _jobEmploymentType != null;

  // "job_contact_dial_code" field.
  String? _jobContactDialCode;
  String get jobContactDialCode => _jobContactDialCode ?? '';
  bool hasJobContactDialCode() => _jobContactDialCode != null;

  // "job_contact_code" field.
  String? _jobContactCode;
  String get jobContactCode => _jobContactCode ?? '';
  bool hasJobContactCode() => _jobContactCode != null;

  // "job_reported" field.
  bool? _jobReported;
  bool get jobReported => _jobReported ?? false;
  bool hasJobReported() => _jobReported != null;

  // "job_reporteed_ref" field.
  DocumentReference? _jobReporteedRef;
  DocumentReference? get jobReporteedRef => _jobReporteedRef;
  bool hasJobReporteedRef() => _jobReporteedRef != null;

  // "job_type_not_applicable" field.
  String? _jobTypeNotApplicable;
  String get jobTypeNotApplicable => _jobTypeNotApplicable ?? '';
  bool hasJobTypeNotApplicable() => _jobTypeNotApplicable != null;

  void _initializeFields() {
    _companyCreator = snapshotData['company_creator'] as DocumentReference?;
    _jobTittle = snapshotData['job_tittle'] as String?;
    _jobDescription = snapshotData['job_description'] as String?;
    _jobSalaryRate = snapshotData['job_salary_rate'] as String?;
    _jobLocation = snapshotData['job_location'] as String?;
    _jobContactPhoneNumber =
        snapshotData['job_contact_phone_number'] as String?;
    _jobContactEmail = snapshotData['job_contact_email'] as String?;
    _jobCreationDate = snapshotData['job_creation_date'] as DateTime?;
    _jobApplicantsUserList =
        getDataList(snapshotData['job_applicants_user_list']);
    _jobWorkLocation = snapshotData['job_work_location'] as String?;
    _jobEmploymentType = snapshotData['job_employment_type'] as String?;
    _jobContactDialCode = snapshotData['job_contact_dial_code'] as String?;
    _jobContactCode = snapshotData['job_contact_code'] as String?;
    _jobReported = snapshotData['job_reported'] as bool?;
    _jobReporteedRef = snapshotData['job_reporteed_ref'] as DocumentReference?;
    _jobTypeNotApplicable = snapshotData['job_type_not_applicable'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('job');

  static Stream<JobRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JobRecord.fromSnapshot(s));

  static Future<JobRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JobRecord.fromSnapshot(s));

  static JobRecord fromSnapshot(DocumentSnapshot snapshot) => JobRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JobRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JobRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JobRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JobRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJobRecordData({
  DocumentReference? companyCreator,
  String? jobTittle,
  String? jobDescription,
  String? jobSalaryRate,
  String? jobLocation,
  String? jobContactPhoneNumber,
  String? jobContactEmail,
  DateTime? jobCreationDate,
  String? jobWorkLocation,
  String? jobEmploymentType,
  String? jobContactDialCode,
  String? jobContactCode,
  bool? jobReported,
  DocumentReference? jobReporteedRef,
  String? jobTypeNotApplicable,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'company_creator': companyCreator,
      'job_tittle': jobTittle,
      'job_description': jobDescription,
      'job_salary_rate': jobSalaryRate,
      'job_location': jobLocation,
      'job_contact_phone_number': jobContactPhoneNumber,
      'job_contact_email': jobContactEmail,
      'job_creation_date': jobCreationDate,
      'job_work_location': jobWorkLocation,
      'job_employment_type': jobEmploymentType,
      'job_contact_dial_code': jobContactDialCode,
      'job_contact_code': jobContactCode,
      'job_reported': jobReported,
      'job_reporteed_ref': jobReporteedRef,
      'job_type_not_applicable': jobTypeNotApplicable,
    }.withoutNulls,
  );

  return firestoreData;
}

class JobRecordDocumentEquality implements Equality<JobRecord> {
  const JobRecordDocumentEquality();

  @override
  bool equals(JobRecord? e1, JobRecord? e2) {
    const listEquality = ListEquality();
    return e1?.companyCreator == e2?.companyCreator &&
        e1?.jobTittle == e2?.jobTittle &&
        e1?.jobDescription == e2?.jobDescription &&
        e1?.jobSalaryRate == e2?.jobSalaryRate &&
        e1?.jobLocation == e2?.jobLocation &&
        e1?.jobContactPhoneNumber == e2?.jobContactPhoneNumber &&
        e1?.jobContactEmail == e2?.jobContactEmail &&
        e1?.jobCreationDate == e2?.jobCreationDate &&
        listEquality.equals(
            e1?.jobApplicantsUserList, e2?.jobApplicantsUserList) &&
        e1?.jobWorkLocation == e2?.jobWorkLocation &&
        e1?.jobEmploymentType == e2?.jobEmploymentType &&
        e1?.jobContactDialCode == e2?.jobContactDialCode &&
        e1?.jobContactCode == e2?.jobContactCode &&
        e1?.jobReported == e2?.jobReported &&
        e1?.jobReporteedRef == e2?.jobReporteedRef &&
        e1?.jobTypeNotApplicable == e2?.jobTypeNotApplicable;
  }

  @override
  int hash(JobRecord? e) => const ListEquality().hash([
        e?.companyCreator,
        e?.jobTittle,
        e?.jobDescription,
        e?.jobSalaryRate,
        e?.jobLocation,
        e?.jobContactPhoneNumber,
        e?.jobContactEmail,
        e?.jobCreationDate,
        e?.jobApplicantsUserList,
        e?.jobWorkLocation,
        e?.jobEmploymentType,
        e?.jobContactDialCode,
        e?.jobContactCode,
        e?.jobReported,
        e?.jobReporteedRef,
        e?.jobTypeNotApplicable
      ]);

  @override
  bool isValidKey(Object? o) => o is JobRecord;
}
