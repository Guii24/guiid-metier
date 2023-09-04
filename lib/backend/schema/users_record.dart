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

  // "user_email" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "user_phone_name" field.
  String? _userPhoneName;
  String get userPhoneName => _userPhoneName ?? '';
  bool hasUserPhoneName() => _userPhoneName != null;

  // "user_phone_code" field.
  String? _userPhoneCode;
  String get userPhoneCode => _userPhoneCode ?? '';
  bool hasUserPhoneCode() => _userPhoneCode != null;

  // "user_phone_flag" field.
  String? _userPhoneFlag;
  String get userPhoneFlag => _userPhoneFlag ?? '';
  bool hasUserPhoneFlag() => _userPhoneFlag != null;

  // "user_phone_dial_code" field.
  String? _userPhoneDialCode;
  String get userPhoneDialCode => _userPhoneDialCode ?? '';
  bool hasUserPhoneDialCode() => _userPhoneDialCode != null;

  // "user_recent_search" field.
  List<RecentSearchStruct>? _userRecentSearch;
  List<RecentSearchStruct> get userRecentSearch =>
      _userRecentSearch ?? const [];
  bool hasUserRecentSearch() => _userRecentSearch != null;

  // "user_contact_phone" field.
  String? _userContactPhone;
  String get userContactPhone => _userContactPhone ?? '';
  bool hasUserContactPhone() => _userContactPhone != null;

  // "user_contact_name" field.
  String? _userContactName;
  String get userContactName => _userContactName ?? '';
  bool hasUserContactName() => _userContactName != null;

  // "user_contact_code" field.
  String? _userContactCode;
  String get userContactCode => _userContactCode ?? '';
  bool hasUserContactCode() => _userContactCode != null;

  // "user_contact_flag" field.
  String? _userContactFlag;
  String get userContactFlag => _userContactFlag ?? '';
  bool hasUserContactFlag() => _userContactFlag != null;

  // "user_contact_dial_code" field.
  String? _userContactDialCode;
  String get userContactDialCode => _userContactDialCode ?? '';
  bool hasUserContactDialCode() => _userContactDialCode != null;

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
    _userIsCompany = snapshotData['user_isCompany'] as bool?;
    _userCompanyName = snapshotData['user_company_name'] as String?;
    _userEmailCompany = snapshotData['user_email_company'] as String?;
    _userRepostPost = getDataList(snapshotData['user_repost_post']);
    _userSharedPosts = getDataList(snapshotData['user_shared_posts']);
    _email = snapshotData['email'] as String?;
    _userLocation = snapshotData['user_location'] as String?;
    _userEmail = snapshotData['user_email'] as String?;
    _userPhoneName = snapshotData['user_phone_name'] as String?;
    _userPhoneCode = snapshotData['user_phone_code'] as String?;
    _userPhoneFlag = snapshotData['user_phone_flag'] as String?;
    _userPhoneDialCode = snapshotData['user_phone_dial_code'] as String?;
    _userRecentSearch = getStructList(
      snapshotData['user_recent_search'],
      RecentSearchStruct.fromMap,
    );
    _userContactPhone = snapshotData['user_contact_phone'] as String?;
    _userContactName = snapshotData['user_contact_name'] as String?;
    _userContactCode = snapshotData['user_contact_code'] as String?;
    _userContactFlag = snapshotData['user_contact_flag'] as String?;
    _userContactDialCode = snapshotData['user_contact_dial_code'] as String?;
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
  bool? userIsCompany,
  String? userCompanyName,
  String? userEmailCompany,
  String? email,
  String? userLocation,
  String? userEmail,
  String? userPhoneName,
  String? userPhoneCode,
  String? userPhoneFlag,
  String? userPhoneDialCode,
  String? userContactPhone,
  String? userContactName,
  String? userContactCode,
  String? userContactFlag,
  String? userContactDialCode,
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
      'user_isCompany': userIsCompany,
      'user_company_name': userCompanyName,
      'user_email_company': userEmailCompany,
      'email': email,
      'user_location': userLocation,
      'user_email': userEmail,
      'user_phone_name': userPhoneName,
      'user_phone_code': userPhoneCode,
      'user_phone_flag': userPhoneFlag,
      'user_phone_dial_code': userPhoneDialCode,
      'user_contact_phone': userContactPhone,
      'user_contact_name': userContactName,
      'user_contact_code': userContactCode,
      'user_contact_flag': userContactFlag,
      'user_contact_dial_code': userContactDialCode,
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
        e1?.userIsCompany == e2?.userIsCompany &&
        e1?.userCompanyName == e2?.userCompanyName &&
        e1?.userEmailCompany == e2?.userEmailCompany &&
        listEquality.equals(e1?.userRepostPost, e2?.userRepostPost) &&
        listEquality.equals(e1?.userSharedPosts, e2?.userSharedPosts) &&
        e1?.email == e2?.email &&
        e1?.userLocation == e2?.userLocation &&
        e1?.userEmail == e2?.userEmail &&
        e1?.userPhoneName == e2?.userPhoneName &&
        e1?.userPhoneCode == e2?.userPhoneCode &&
        e1?.userPhoneFlag == e2?.userPhoneFlag &&
        e1?.userPhoneDialCode == e2?.userPhoneDialCode &&
        listEquality.equals(e1?.userRecentSearch, e2?.userRecentSearch) &&
        e1?.userContactPhone == e2?.userContactPhone &&
        e1?.userContactName == e2?.userContactName &&
        e1?.userContactCode == e2?.userContactCode &&
        e1?.userContactFlag == e2?.userContactFlag &&
        e1?.userContactDialCode == e2?.userContactDialCode;
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
        e?.userIsCompany,
        e?.userCompanyName,
        e?.userEmailCompany,
        e?.userRepostPost,
        e?.userSharedPosts,
        e?.email,
        e?.userLocation,
        e?.userEmail,
        e?.userPhoneName,
        e?.userPhoneCode,
        e?.userPhoneFlag,
        e?.userPhoneDialCode,
        e?.userRecentSearch,
        e?.userContactPhone,
        e?.userContactName,
        e?.userContactCode,
        e?.userContactFlag,
        e?.userContactDialCode
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
