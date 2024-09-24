import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _SearchItems = prefs
              .getStringList('ff_SearchItems')
              ?.map((x) {
                try {
                  return RecentSearchStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _SearchItems;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _selectedlocation = '';
  String get selectedlocation => _selectedlocation;
  set selectedlocation(String value) {
    _selectedlocation = value;
  }

  List<String> _postreport = [];
  List<String> get postreport => _postreport;
  set postreport(List<String> value) {
    _postreport = value;
  }

  void addToPostreport(String value) {
    postreport.add(value);
  }

  void removeFromPostreport(String value) {
    postreport.remove(value);
  }

  void removeAtIndexFromPostreport(int index) {
    postreport.removeAt(index);
  }

  void updatePostreportAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    postreport[index] = updateFn(_postreport[index]);
  }

  void insertAtIndexInPostreport(int index, String value) {
    postreport.insert(index, value);
  }

  String _popupSelected = '';
  String get popupSelected => _popupSelected;
  set popupSelected(String value) {
    _popupSelected = value;
  }

  String _profilePhoto = '';
  String get profilePhoto => _profilePhoto;
  set profilePhoto(String value) {
    _profilePhoto = value;
  }

  List<String> _preference = [
    'Designers',
    'Textiles',
    'Photography',
    'Style',
    'Models',
    'Accessories',
    'Jewelers',
    'Beauty',
    'Creative',
    'Production',
    'Trends',
    'Art direction',
    'Hair & Makeup'
  ];
  List<String> get preference => _preference;
  set preference(List<String> value) {
    _preference = value;
  }

  void addToPreference(String value) {
    preference.add(value);
  }

  void removeFromPreference(String value) {
    preference.remove(value);
  }

  void removeAtIndexFromPreference(int index) {
    preference.removeAt(index);
  }

  void updatePreferenceAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    preference[index] = updateFn(_preference[index]);
  }

  void insertAtIndexInPreference(int index, String value) {
    preference.insert(index, value);
  }

  dynamic _countryInfo = jsonDecode(
      '{\"name\":\"United States\",\"flag\":\"🇺🇸\",\"code\":\"US\",\"dial_code\":\"+1\"}');
  dynamic get countryInfo => _countryInfo;
  set countryInfo(dynamic value) {
    _countryInfo = value;
  }

  String _profilePhotoCompany = '';
  String get profilePhotoCompany => _profilePhotoCompany;
  set profilePhotoCompany(String value) {
    _profilePhotoCompany = value;
  }

  List<String> _choosenPreference = [];
  List<String> get choosenPreference => _choosenPreference;
  set choosenPreference(List<String> value) {
    _choosenPreference = value;
  }

  void addToChoosenPreference(String value) {
    choosenPreference.add(value);
  }

  void removeFromChoosenPreference(String value) {
    choosenPreference.remove(value);
  }

  void removeAtIndexFromChoosenPreference(int index) {
    choosenPreference.removeAt(index);
  }

  void updateChoosenPreferenceAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    choosenPreference[index] = updateFn(_choosenPreference[index]);
  }

  void insertAtIndexInChoosenPreference(int index, String value) {
    choosenPreference.insert(index, value);
  }

  bool _activeCalendar = false;
  bool get activeCalendar => _activeCalendar;
  set activeCalendar(bool value) {
    _activeCalendar = value;
  }

  DateTime? _bornDate = DateTime.fromMillisecondsSinceEpoch(1691612040000);
  DateTime? get bornDate => _bornDate;
  set bornDate(DateTime? value) {
    _bornDate = value;
  }

  String _page = 'Articles';
  String get page => _page;
  set page(String value) {
    _page = value;
  }

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  set pageIndex(int value) {
    _pageIndex = value;
  }

  List<DocumentReference> _activitiesArticle = [];
  List<DocumentReference> get activitiesArticle => _activitiesArticle;
  set activitiesArticle(List<DocumentReference> value) {
    _activitiesArticle = value;
  }

  void addToActivitiesArticle(DocumentReference value) {
    activitiesArticle.add(value);
  }

  void removeFromActivitiesArticle(DocumentReference value) {
    activitiesArticle.remove(value);
  }

  void removeAtIndexFromActivitiesArticle(int index) {
    activitiesArticle.removeAt(index);
  }

  void updateActivitiesArticleAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    activitiesArticle[index] = updateFn(_activitiesArticle[index]);
  }

  void insertAtIndexInActivitiesArticle(int index, DocumentReference value) {
    activitiesArticle.insert(index, value);
  }

  List<String> _uploadPhotoPost = [];
  List<String> get uploadPhotoPost => _uploadPhotoPost;
  set uploadPhotoPost(List<String> value) {
    _uploadPhotoPost = value;
  }

  void addToUploadPhotoPost(String value) {
    uploadPhotoPost.add(value);
  }

  void removeFromUploadPhotoPost(String value) {
    uploadPhotoPost.remove(value);
  }

  void removeAtIndexFromUploadPhotoPost(int index) {
    uploadPhotoPost.removeAt(index);
  }

  void updateUploadPhotoPostAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    uploadPhotoPost[index] = updateFn(_uploadPhotoPost[index]);
  }

  void insertAtIndexInUploadPhotoPost(int index, String value) {
    uploadPhotoPost.insert(index, value);
  }

  List<WearItemsStruct> _wearItems = [];
  List<WearItemsStruct> get wearItems => _wearItems;
  set wearItems(List<WearItemsStruct> value) {
    _wearItems = value;
  }

  void addToWearItems(WearItemsStruct value) {
    wearItems.add(value);
  }

  void removeFromWearItems(WearItemsStruct value) {
    wearItems.remove(value);
  }

  void removeAtIndexFromWearItems(int index) {
    wearItems.removeAt(index);
  }

  void updateWearItemsAtIndex(
    int index,
    WearItemsStruct Function(WearItemsStruct) updateFn,
  ) {
    wearItems[index] = updateFn(_wearItems[index]);
  }

  void insertAtIndexInWearItems(int index, WearItemsStruct value) {
    wearItems.insert(index, value);
  }

  List<DocumentReference> _activitiesPost = [];
  List<DocumentReference> get activitiesPost => _activitiesPost;
  set activitiesPost(List<DocumentReference> value) {
    _activitiesPost = value;
  }

  void addToActivitiesPost(DocumentReference value) {
    activitiesPost.add(value);
  }

  void removeFromActivitiesPost(DocumentReference value) {
    activitiesPost.remove(value);
  }

  void removeAtIndexFromActivitiesPost(int index) {
    activitiesPost.removeAt(index);
  }

  void updateActivitiesPostAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    activitiesPost[index] = updateFn(_activitiesPost[index]);
  }

  void insertAtIndexInActivitiesPost(int index, DocumentReference value) {
    activitiesPost.insert(index, value);
  }

  dynamic _countryInfoCompany = jsonDecode(
      '{\"name\":\"United States\",\"flag\":\"🇺🇸\",\"code\":\"US\",\"dial_code\":\"+1\"}');
  dynamic get countryInfoCompany => _countryInfoCompany;
  set countryInfoCompany(dynamic value) {
    _countryInfoCompany = value;
  }

  String _phonenumber = '';
  String get phonenumber => _phonenumber;
  set phonenumber(String value) {
    _phonenumber = value;
  }

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
  }

  String _countryCode = '';
  String get countryCode => _countryCode;
  set countryCode(String value) {
    _countryCode = value;
  }

  List<String> _listTypeReport = [
    'Misleading Promotions',
    'Counterfeit or Unauthentic Products',
    'Violence, Abuse & Criminal Activity',
    'Hate Speech & Harassment',
    'Self-harm & Suicidal Content',
    'Body Image & Eating Disorders',
    'Dangerous Challenges & Activities',
    'Nudity & Sexual Content',
    'Graphic or Shocking Content',
    'Misinformation',
    'Spam & Deceptive Behavior',
    'Illegal or Regulated Goods',
    'Fraud & Scams',
    'Unauthorized Personal Information Sharing',
    'Other'
  ];
  List<String> get listTypeReport => _listTypeReport;
  set listTypeReport(List<String> value) {
    _listTypeReport = value;
  }

  void addToListTypeReport(String value) {
    listTypeReport.add(value);
  }

  void removeFromListTypeReport(String value) {
    listTypeReport.remove(value);
  }

  void removeAtIndexFromListTypeReport(int index) {
    listTypeReport.removeAt(index);
  }

  void updateListTypeReportAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listTypeReport[index] = updateFn(_listTypeReport[index]);
  }

  void insertAtIndexInListTypeReport(int index, String value) {
    listTypeReport.insert(index, value);
  }

  String _choosenListReport = '';
  String get choosenListReport => _choosenListReport;
  set choosenListReport(String value) {
    _choosenListReport = value;
  }

  List<DocumentReference> _listPostWear = [];
  List<DocumentReference> get listPostWear => _listPostWear;
  set listPostWear(List<DocumentReference> value) {
    _listPostWear = value;
  }

  void addToListPostWear(DocumentReference value) {
    listPostWear.add(value);
  }

  void removeFromListPostWear(DocumentReference value) {
    listPostWear.remove(value);
  }

  void removeAtIndexFromListPostWear(int index) {
    listPostWear.removeAt(index);
  }

  void updateListPostWearAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    listPostWear[index] = updateFn(_listPostWear[index]);
  }

  void insertAtIndexInListPostWear(int index, DocumentReference value) {
    listPostWear.insert(index, value);
  }

  List<String> _jobTypeList = ['Remote', 'Onsite', 'Hybrid'];
  List<String> get jobTypeList => _jobTypeList;
  set jobTypeList(List<String> value) {
    _jobTypeList = value;
  }

  void addToJobTypeList(String value) {
    jobTypeList.add(value);
  }

  void removeFromJobTypeList(String value) {
    jobTypeList.remove(value);
  }

  void removeAtIndexFromJobTypeList(int index) {
    jobTypeList.removeAt(index);
  }

  void updateJobTypeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    jobTypeList[index] = updateFn(_jobTypeList[index]);
  }

  void insertAtIndexInJobTypeList(int index, String value) {
    jobTypeList.insert(index, value);
  }

  String _imgBase64 = '';
  String get imgBase64 => _imgBase64;
  set imgBase64(String value) {
    _imgBase64 = value;
  }

  List<String> _ListPurpose = ['Legacy', 'Memoir', 'Guiid'];
  List<String> get ListPurpose => _ListPurpose;
  set ListPurpose(List<String> value) {
    _ListPurpose = value;
  }

  void addToListPurpose(String value) {
    ListPurpose.add(value);
  }

  void removeFromListPurpose(String value) {
    ListPurpose.remove(value);
  }

  void removeAtIndexFromListPurpose(int index) {
    ListPurpose.removeAt(index);
  }

  void updateListPurposeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ListPurpose[index] = updateFn(_ListPurpose[index]);
  }

  void insertAtIndexInListPurpose(int index, String value) {
    ListPurpose.insert(index, value);
  }

  String _choosenPurpose = '';
  String get choosenPurpose => _choosenPurpose;
  set choosenPurpose(String value) {
    _choosenPurpose = value;
  }

  List<String> _choosenPurposeAndPref = [];
  List<String> get choosenPurposeAndPref => _choosenPurposeAndPref;
  set choosenPurposeAndPref(List<String> value) {
    _choosenPurposeAndPref = value;
  }

  void addToChoosenPurposeAndPref(String value) {
    choosenPurposeAndPref.add(value);
  }

  void removeFromChoosenPurposeAndPref(String value) {
    choosenPurposeAndPref.remove(value);
  }

  void removeAtIndexFromChoosenPurposeAndPref(int index) {
    choosenPurposeAndPref.removeAt(index);
  }

  void updateChoosenPurposeAndPrefAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    choosenPurposeAndPref[index] = updateFn(_choosenPurposeAndPref[index]);
  }

  void insertAtIndexInChoosenPurposeAndPref(int index, String value) {
    choosenPurposeAndPref.insert(index, value);
  }

  List<String> _jobTypelist2 = ['Part-time', 'Full-time', 'Project based'];
  List<String> get jobTypelist2 => _jobTypelist2;
  set jobTypelist2(List<String> value) {
    _jobTypelist2 = value;
  }

  void addToJobTypelist2(String value) {
    jobTypelist2.add(value);
  }

  void removeFromJobTypelist2(String value) {
    jobTypelist2.remove(value);
  }

  void removeAtIndexFromJobTypelist2(int index) {
    jobTypelist2.removeAt(index);
  }

  void updateJobTypelist2AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    jobTypelist2[index] = updateFn(_jobTypelist2[index]);
  }

  void insertAtIndexInJobTypelist2(int index, String value) {
    jobTypelist2.insert(index, value);
  }

  String _choosenjobType2 = '';
  String get choosenjobType2 => _choosenjobType2;
  set choosenjobType2(String value) {
    _choosenjobType2 = value;
  }

  String _choosenjobtype1 = '';
  String get choosenjobtype1 => _choosenjobtype1;
  set choosenjobtype1(String value) {
    _choosenjobtype1 = value;
  }

  String _selectedJobType = '';
  String get selectedJobType => _selectedJobType;
  set selectedJobType(String value) {
    _selectedJobType = value;
  }

  List<RecentSearchStruct> _SearchItems = [];
  List<RecentSearchStruct> get SearchItems => _SearchItems;
  set SearchItems(List<RecentSearchStruct> value) {
    _SearchItems = value;
    prefs.setStringList(
        'ff_SearchItems', value.map((x) => x.serialize()).toList());
  }

  void addToSearchItems(RecentSearchStruct value) {
    SearchItems.add(value);
    prefs.setStringList(
        'ff_SearchItems', _SearchItems.map((x) => x.serialize()).toList());
  }

  void removeFromSearchItems(RecentSearchStruct value) {
    SearchItems.remove(value);
    prefs.setStringList(
        'ff_SearchItems', _SearchItems.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromSearchItems(int index) {
    SearchItems.removeAt(index);
    prefs.setStringList(
        'ff_SearchItems', _SearchItems.map((x) => x.serialize()).toList());
  }

  void updateSearchItemsAtIndex(
    int index,
    RecentSearchStruct Function(RecentSearchStruct) updateFn,
  ) {
    SearchItems[index] = updateFn(_SearchItems[index]);
    prefs.setStringList(
        'ff_SearchItems', _SearchItems.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInSearchItems(int index, RecentSearchStruct value) {
    SearchItems.insert(index, value);
    prefs.setStringList(
        'ff_SearchItems', _SearchItems.map((x) => x.serialize()).toList());
  }

  dynamic _videoJson = jsonDecode('{\"type\":\"video\"}');
  dynamic get videoJson => _videoJson;
  set videoJson(dynamic value) {
    _videoJson = value;
  }

  dynamic _imageJson = jsonDecode('{\"type\":\"photo\"}');
  dynamic get imageJson => _imageJson;
  set imageJson(dynamic value) {
    _imageJson = value;
  }

  String _jobType3 = '';
  String get jobType3 => _jobType3;
  set jobType3(String value) {
    _jobType3 = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
