// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecentSearchStruct extends FFFirebaseStruct {
  RecentSearchStruct({
    DocumentReference? searchPost,
    String? searchText,
    DateTime? searchDate,
    DocumentReference? searchJob,
    DocumentReference? searchAritcle,
    DocumentReference? searchUser,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _searchPost = searchPost,
        _searchText = searchText,
        _searchDate = searchDate,
        _searchJob = searchJob,
        _searchAritcle = searchAritcle,
        _searchUser = searchUser,
        super(firestoreUtilData);

  // "search_post" field.
  DocumentReference? _searchPost;
  DocumentReference? get searchPost => _searchPost;
  set searchPost(DocumentReference? val) => _searchPost = val;
  bool hasSearchPost() => _searchPost != null;

  // "search_text" field.
  String? _searchText;
  String get searchText => _searchText ?? '';
  set searchText(String? val) => _searchText = val;
  bool hasSearchText() => _searchText != null;

  // "search_date" field.
  DateTime? _searchDate;
  DateTime? get searchDate => _searchDate;
  set searchDate(DateTime? val) => _searchDate = val;
  bool hasSearchDate() => _searchDate != null;

  // "search_job" field.
  DocumentReference? _searchJob;
  DocumentReference? get searchJob => _searchJob;
  set searchJob(DocumentReference? val) => _searchJob = val;
  bool hasSearchJob() => _searchJob != null;

  // "search_aritcle" field.
  DocumentReference? _searchAritcle;
  DocumentReference? get searchAritcle => _searchAritcle;
  set searchAritcle(DocumentReference? val) => _searchAritcle = val;
  bool hasSearchAritcle() => _searchAritcle != null;

  // "search_user" field.
  DocumentReference? _searchUser;
  DocumentReference? get searchUser => _searchUser;
  set searchUser(DocumentReference? val) => _searchUser = val;
  bool hasSearchUser() => _searchUser != null;

  static RecentSearchStruct fromMap(Map<String, dynamic> data) =>
      RecentSearchStruct(
        searchPost: data['search_post'] as DocumentReference?,
        searchText: data['search_text'] as String?,
        searchDate: data['search_date'] as DateTime?,
        searchJob: data['search_job'] as DocumentReference?,
        searchAritcle: data['search_aritcle'] as DocumentReference?,
        searchUser: data['search_user'] as DocumentReference?,
      );

  static RecentSearchStruct? maybeFromMap(dynamic data) => data is Map
      ? RecentSearchStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'search_post': _searchPost,
        'search_text': _searchText,
        'search_date': _searchDate,
        'search_job': _searchJob,
        'search_aritcle': _searchAritcle,
        'search_user': _searchUser,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'search_post': serializeParam(
          _searchPost,
          ParamType.DocumentReference,
        ),
        'search_text': serializeParam(
          _searchText,
          ParamType.String,
        ),
        'search_date': serializeParam(
          _searchDate,
          ParamType.DateTime,
        ),
        'search_job': serializeParam(
          _searchJob,
          ParamType.DocumentReference,
        ),
        'search_aritcle': serializeParam(
          _searchAritcle,
          ParamType.DocumentReference,
        ),
        'search_user': serializeParam(
          _searchUser,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static RecentSearchStruct fromSerializableMap(Map<String, dynamic> data) =>
      RecentSearchStruct(
        searchPost: deserializeParam(
          data['search_post'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['post'],
        ),
        searchText: deserializeParam(
          data['search_text'],
          ParamType.String,
          false,
        ),
        searchDate: deserializeParam(
          data['search_date'],
          ParamType.DateTime,
          false,
        ),
        searchJob: deserializeParam(
          data['search_job'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['job'],
        ),
        searchAritcle: deserializeParam(
          data['search_aritcle'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['articles'],
        ),
        searchUser: deserializeParam(
          data['search_user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'RecentSearchStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RecentSearchStruct &&
        searchPost == other.searchPost &&
        searchText == other.searchText &&
        searchDate == other.searchDate &&
        searchJob == other.searchJob &&
        searchAritcle == other.searchAritcle &&
        searchUser == other.searchUser;
  }

  @override
  int get hashCode => const ListEquality().hash([
        searchPost,
        searchText,
        searchDate,
        searchJob,
        searchAritcle,
        searchUser
      ]);
}

RecentSearchStruct createRecentSearchStruct({
  DocumentReference? searchPost,
  String? searchText,
  DateTime? searchDate,
  DocumentReference? searchJob,
  DocumentReference? searchAritcle,
  DocumentReference? searchUser,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RecentSearchStruct(
      searchPost: searchPost,
      searchText: searchText,
      searchDate: searchDate,
      searchJob: searchJob,
      searchAritcle: searchAritcle,
      searchUser: searchUser,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RecentSearchStruct? updateRecentSearchStruct(
  RecentSearchStruct? recentSearch, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    recentSearch
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRecentSearchStructData(
  Map<String, dynamic> firestoreData,
  RecentSearchStruct? recentSearch,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (recentSearch == null) {
    return;
  }
  if (recentSearch.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && recentSearch.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final recentSearchData =
      getRecentSearchFirestoreData(recentSearch, forFieldValue);
  final nestedData =
      recentSearchData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = recentSearch.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRecentSearchFirestoreData(
  RecentSearchStruct? recentSearch, [
  bool forFieldValue = false,
]) {
  if (recentSearch == null) {
    return {};
  }
  final firestoreData = mapToFirestore(recentSearch.toMap());

  // Add any Firestore field values
  recentSearch.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRecentSearchListFirestoreData(
  List<RecentSearchStruct>? recentSearchs,
) =>
    recentSearchs?.map((e) => getRecentSearchFirestoreData(e, true)).toList() ??
    [];
