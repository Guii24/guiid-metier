import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "user_bio" field.
  String? _userBio;
  String get userBio => _userBio ?? '';
  bool hasUserBio() => _userBio != null;

  // "user_education" field.
  String? _userEducation;
  String get userEducation => _userEducation ?? '';
  bool hasUserEducation() => _userEducation != null;

  // "user_job" field.
  String? _userJob;
  String get userJob => _userJob ?? '';
  bool hasUserJob() => _userJob != null;

  // "user_birthday" field.
  DateTime? _userBirthday;
  DateTime? get userBirthday => _userBirthday;
  bool hasUserBirthday() => _userBirthday != null;

  // "user_type" field.
  String? _userType;
  String get userType => _userType ?? '';
  bool hasUserType() => _userType != null;

  // "user_preferences" field.
  List<String>? _userPreferences;
  List<String> get userPreferences => _userPreferences ?? const [];
  bool hasUserPreferences() => _userPreferences != null;

  // "user_followers" field.
  List<DocumentReference>? _userFollowers;
  List<DocumentReference> get userFollowers => _userFollowers ?? const [];
  bool hasUserFollowers() => _userFollowers != null;

  // "user_following" field.
  List<DocumentReference>? _userFollowing;
  List<DocumentReference> get userFollowing => _userFollowing ?? const [];
  bool hasUserFollowing() => _userFollowing != null;

  // "user_blocked_user" field.
  List<DocumentReference>? _userBlockedUser;
  List<DocumentReference> get userBlockedUser => _userBlockedUser ?? const [];
  bool hasUserBlockedUser() => _userBlockedUser != null;

  // "user_subscription" field.
  bool? _userSubscription;
  bool get userSubscription => _userSubscription ?? false;
  bool hasUserSubscription() => _userSubscription != null;

  // "user_subscription_type" field.
  String? _userSubscriptionType;
  String get userSubscriptionType => _userSubscriptionType ?? '';
  bool hasUserSubscriptionType() => _userSubscriptionType != null;

  // "user_subscription_start_date" field.
  DateTime? _userSubscriptionStartDate;
  DateTime? get userSubscriptionStartDate => _userSubscriptionStartDate;
  bool hasUserSubscriptionStartDate() => _userSubscriptionStartDate != null;

  // "user_subscription_final_date" field.
  DateTime? _userSubscriptionFinalDate;
  DateTime? get userSubscriptionFinalDate => _userSubscriptionFinalDate;
  bool hasUserSubscriptionFinalDate() => _userSubscriptionFinalDate != null;

  // "user_country_code" field.
  int? _userCountryCode;
  int get userCountryCode => _userCountryCode ?? 0;
  bool hasUserCountryCode() => _userCountryCode != null;

  // "user_isCompany" field.
  bool? _userIsCompany;
  bool get userIsCompany => _userIsCompany ?? false;
  bool hasUserIsCompany() => _userIsCompany != null;

  // "user_company_name" field.
  String? _userCompanyName;
  String get userCompanyName => _userCompanyName ?? '';
  bool hasUserCompanyName() => _userCompanyName != null;

  // "user_email_company" field.
  String? _userEmailCompany;
  String get userEmailCompany => _userEmailCompany ?? '';
  bool hasUserEmailCompany() => _userEmailCompany != null;

  // "user_recent_search" field.
  String? _userRecentSearch;
  String get userRecentSearch => _userRecentSearch ?? '';
  bool hasUserRecentSearch() => _userRecentSearch != null;

  // "user_repost_post" field.
  List<DocumentReference>? _userRepostPost;
  List<DocumentReference> get userRepostPost => _userRepostPost ?? const [];
  bool hasUserRepostPost() => _userRepostPost != null;

  // "user_shared_posts" field.
  List<DocumentReference>? _userSharedPosts;
  List<DocumentReference> get userSharedPosts => _userSharedPosts ?? const [];
  bool hasUserSharedPosts() => _userSharedPosts != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "user_location" field.
  String? _userLocation;
  String get userLocation => _userLocation ?? '';
  bool hasUserLocation() => _userLocation != null;

  void _initializeFields() {
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _userBio = snapshotData['user_bio'] as String?;
    _userEducation = snapshotData['user_education'] as String?;
    _userJob = snapshotData['user_job'] as String?;
    _userBirthday = snapshotData['user_birthday'] as DateTime?;
    _userType = snapshotData['user_type'] as String?;
    _userPreferences = getDataList(snapshotData['user_preferences']);
    _userFollowers = getDataList(snapshotData['user_followers']);
    _userFollowing = getDataList(snapshotData['user_following']);
    _userBlockedUser = getDataList(snapshotData['user_blocked_user']);
    _userSubscription = snapshotData['user_subscription'] as bool?;
    _userSubscriptionType = snapshotData['user_subscription_type'] as String?;
    _userSubscriptionStartDate =
        snapshotData['user_subscription_start_date'] as DateTime?;
    _userSubscriptionFinalDate =
        snapshotData['user_subscription_final_date'] as DateTime?;
    _userCountryCode = castToType<int>(snapshotData['user_country_code']);
    _userIsCompany = snapshotData['user_isCompany'] as bool?;
    _userCompanyName = snapshotData['user_company_name'] as String?;
    _userEmailCompany = snapshotData['user_email_company'] as String?;
    _userRecentSearch = snapshotData['user_recent_search'] as String?;
    _userRepostPost = getDataList(snapshotData['user_repost_post']);
    _userSharedPosts = getDataList(snapshotData['user_shared_posts']);
    _email = snapshotData['email'] as String?;
    _userLocation = snapshotData['user_location'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? userBio,
  String? userEducation,
  String? userJob,
  DateTime? userBirthday,
  String? userType,
  bool? userSubscription,
  String? userSubscriptionType,
  DateTime? userSubscriptionStartDate,
  DateTime? userSubscriptionFinalDate,
  int? userCountryCode,
  bool? userIsCompany,
  String? userCompanyName,
  String? userEmailCompany,
  String? userRecentSearch,
  String? email,
  String? userLocation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'user_bio': userBio,
      'user_education': userEducation,
      'user_job': userJob,
      'user_birthday': userBirthday,
      'user_type': userType,
      'user_subscription': userSubscription,
      'user_subscription_type': userSubscriptionType,
      'user_subscription_start_date': userSubscriptionStartDate,
      'user_subscription_final_date': userSubscriptionFinalDate,
      'user_country_code': userCountryCode,
      'user_isCompany': userIsCompany,
      'user_company_name': userCompanyName,
      'user_email_company': userEmailCompany,
      'user_recent_search': userRecentSearch,
      'email': email,
      'user_location': userLocation,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.userBio == e2?.userBio &&
        e1?.userEducation == e2?.userEducation &&
        e1?.userJob == e2?.userJob &&
        e1?.userBirthday == e2?.userBirthday &&
        e1?.userType == e2?.userType &&
        listEquality.equals(e1?.userPreferences, e2?.userPreferences) &&
        listEquality.equals(e1?.userFollowers, e2?.userFollowers) &&
        listEquality.equals(e1?.userFollowing, e2?.userFollowing) &&
        listEquality.equals(e1?.userBlockedUser, e2?.userBlockedUser) &&
        e1?.userSubscription == e2?.userSubscription &&
        e1?.userSubscriptionType == e2?.userSubscriptionType &&
        e1?.userSubscriptionStartDate == e2?.userSubscriptionStartDate &&
        e1?.userSubscriptionFinalDate == e2?.userSubscriptionFinalDate &&
        e1?.userCountryCode == e2?.userCountryCode &&
        e1?.userIsCompany == e2?.userIsCompany &&
        e1?.userCompanyName == e2?.userCompanyName &&
        e1?.userEmailCompany == e2?.userEmailCompany &&
        e1?.userRecentSearch == e2?.userRecentSearch &&
        listEquality.equals(e1?.userRepostPost, e2?.userRepostPost) &&
        listEquality.equals(e1?.userSharedPosts, e2?.userSharedPosts) &&
        e1?.email == e2?.email &&
        e1?.userLocation == e2?.userLocation;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.userBio,
        e?.userEducation,
        e?.userJob,
        e?.userBirthday,
        e?.userType,
        e?.userPreferences,
        e?.userFollowers,
        e?.userFollowing,
        e?.userBlockedUser,
        e?.userSubscription,
        e?.userSubscriptionType,
        e?.userSubscriptionStartDate,
        e?.userSubscriptionFinalDate,
        e?.userCountryCode,
        e?.userIsCompany,
        e?.userCompanyName,
        e?.userEmailCompany,
        e?.userRecentSearch,
        e?.userRepostPost,
        e?.userSharedPosts,
        e?.email,
        e?.userLocation
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
