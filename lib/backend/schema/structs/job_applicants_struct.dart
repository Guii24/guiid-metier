// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JobApplicantsStruct extends FFFirebaseStruct {
  JobApplicantsStruct({
    DateTime? jobApplicantCreationDate,
    DocumentReference? jobApplicantUser,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _jobApplicantCreationDate = jobApplicantCreationDate,
        _jobApplicantUser = jobApplicantUser,
        super(firestoreUtilData);

  // "job_applicant_creation_date" field.
  DateTime? _jobApplicantCreationDate;
  DateTime? get jobApplicantCreationDate => _jobApplicantCreationDate;
  set jobApplicantCreationDate(DateTime? val) =>
      _jobApplicantCreationDate = val;
  bool hasJobApplicantCreationDate() => _jobApplicantCreationDate != null;

  // "job_applicant_user" field.
  DocumentReference? _jobApplicantUser;
  DocumentReference? get jobApplicantUser => _jobApplicantUser;
  set jobApplicantUser(DocumentReference? val) => _jobApplicantUser = val;
  bool hasJobApplicantUser() => _jobApplicantUser != null;

  static JobApplicantsStruct fromMap(Map<String, dynamic> data) =>
      JobApplicantsStruct(
        jobApplicantCreationDate:
            data['job_applicant_creation_date'] as DateTime?,
        jobApplicantUser: data['job_applicant_user'] as DocumentReference?,
      );

  static JobApplicantsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? JobApplicantsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'job_applicant_creation_date': _jobApplicantCreationDate,
        'job_applicant_user': _jobApplicantUser,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'job_applicant_creation_date': serializeParam(
          _jobApplicantCreationDate,
          ParamType.DateTime,
        ),
        'job_applicant_user': serializeParam(
          _jobApplicantUser,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static JobApplicantsStruct fromSerializableMap(Map<String, dynamic> data) =>
      JobApplicantsStruct(
        jobApplicantCreationDate: deserializeParam(
          data['job_applicant_creation_date'],
          ParamType.DateTime,
          false,
        ),
        jobApplicantUser: deserializeParam(
          data['job_applicant_user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'JobApplicantsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is JobApplicantsStruct &&
        jobApplicantCreationDate == other.jobApplicantCreationDate &&
        jobApplicantUser == other.jobApplicantUser;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([jobApplicantCreationDate, jobApplicantUser]);
}

JobApplicantsStruct createJobApplicantsStruct({
  DateTime? jobApplicantCreationDate,
  DocumentReference? jobApplicantUser,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    JobApplicantsStruct(
      jobApplicantCreationDate: jobApplicantCreationDate,
      jobApplicantUser: jobApplicantUser,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

JobApplicantsStruct? updateJobApplicantsStruct(
  JobApplicantsStruct? jobApplicants, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    jobApplicants
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addJobApplicantsStructData(
  Map<String, dynamic> firestoreData,
  JobApplicantsStruct? jobApplicants,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (jobApplicants == null) {
    return;
  }
  if (jobApplicants.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && jobApplicants.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final jobApplicantsData =
      getJobApplicantsFirestoreData(jobApplicants, forFieldValue);
  final nestedData =
      jobApplicantsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = jobApplicants.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getJobApplicantsFirestoreData(
  JobApplicantsStruct? jobApplicants, [
  bool forFieldValue = false,
]) {
  if (jobApplicants == null) {
    return {};
  }
  final firestoreData = mapToFirestore(jobApplicants.toMap());

  // Add any Firestore field values
  jobApplicants.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getJobApplicantsListFirestoreData(
  List<JobApplicantsStruct>? jobApplicantss,
) =>
    jobApplicantss
        ?.map((e) => getJobApplicantsFirestoreData(e, true))
        .toList() ??
    [];
