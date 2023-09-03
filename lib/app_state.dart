import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _selectedlocation = '';
  String get selectedlocation => _selectedlocation;
  set selectedlocation(String _value) {
    _selectedlocation = _value;
  }

  List<String> _postreport = [];
  List<String> get postreport => _postreport;
  set postreport(List<String> _value) {
    _postreport = _value;
  }

  void addToPostreport(String _value) {
    _postreport.add(_value);
  }

  void removeFromPostreport(String _value) {
    _postreport.remove(_value);
  }

  void removeAtIndexFromPostreport(int _index) {
    _postreport.removeAt(_index);
  }

  void updatePostreportAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _postreport[_index] = updateFn(_postreport[_index]);
  }

  String _popupSelected = '';
  String get popupSelected => _popupSelected;
  set popupSelected(String _value) {
    _popupSelected = _value;
  }

  String _profilePhoto = '';
  String get profilePhoto => _profilePhoto;
  set profilePhoto(String _value) {
    _profilePhoto = _value;
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
  set preference(List<String> _value) {
    _preference = _value;
  }

  void addToPreference(String _value) {
    _preference.add(_value);
  }

  void removeFromPreference(String _value) {
    _preference.remove(_value);
  }

  void removeAtIndexFromPreference(int _index) {
    _preference.removeAt(_index);
  }

  void updatePreferenceAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _preference[_index] = updateFn(_preference[_index]);
  }

  dynamic _countryInfo = jsonDecode(
      '{\"name\":\"United States\",\"flag\":\"🇺🇸\",\"code\":\"US\",\"dial_code\":\"+1\"}');
  dynamic get countryInfo => _countryInfo;
  set countryInfo(dynamic _value) {
    _countryInfo = _value;
  }

  String _profilePhotoCompany = '';
  String get profilePhotoCompany => _profilePhotoCompany;
  set profilePhotoCompany(String _value) {
    _profilePhotoCompany = _value;
  }

  List<String> _choosenPreference = [];
  List<String> get choosenPreference => _choosenPreference;
  set choosenPreference(List<String> _value) {
    _choosenPreference = _value;
  }

  void addToChoosenPreference(String _value) {
    _choosenPreference.add(_value);
  }

  void removeFromChoosenPreference(String _value) {
    _choosenPreference.remove(_value);
  }

  void removeAtIndexFromChoosenPreference(int _index) {
    _choosenPreference.removeAt(_index);
  }

  void updateChoosenPreferenceAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _choosenPreference[_index] = updateFn(_choosenPreference[_index]);
  }

  bool _activeCalendar = false;
  bool get activeCalendar => _activeCalendar;
  set activeCalendar(bool _value) {
    _activeCalendar = _value;
  }

  DateTime? _bornDate = DateTime.fromMillisecondsSinceEpoch(1691612040000);
  DateTime? get bornDate => _bornDate;
  set bornDate(DateTime? _value) {
    _bornDate = _value;
  }

  String _page = 'Articles';
  String get page => _page;
  set page(String _value) {
    _page = _value;
  }

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  set pageIndex(int _value) {
    _pageIndex = _value;
  }

  List<DocumentReference> _activitiesArticle = [];
  List<DocumentReference> get activitiesArticle => _activitiesArticle;
  set activitiesArticle(List<DocumentReference> _value) {
    _activitiesArticle = _value;
  }

  void addToActivitiesArticle(DocumentReference _value) {
    _activitiesArticle.add(_value);
  }

  void removeFromActivitiesArticle(DocumentReference _value) {
    _activitiesArticle.remove(_value);
  }

  void removeAtIndexFromActivitiesArticle(int _index) {
    _activitiesArticle.removeAt(_index);
  }

  void updateActivitiesArticleAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _activitiesArticle[_index] = updateFn(_activitiesArticle[_index]);
  }

  List<String> _uploadPhotoPost = [];
  List<String> get uploadPhotoPost => _uploadPhotoPost;
  set uploadPhotoPost(List<String> _value) {
    _uploadPhotoPost = _value;
  }

  void addToUploadPhotoPost(String _value) {
    _uploadPhotoPost.add(_value);
  }

  void removeFromUploadPhotoPost(String _value) {
    _uploadPhotoPost.remove(_value);
  }

  void removeAtIndexFromUploadPhotoPost(int _index) {
    _uploadPhotoPost.removeAt(_index);
  }

  void updateUploadPhotoPostAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _uploadPhotoPost[_index] = updateFn(_uploadPhotoPost[_index]);
  }

  List<DocumentReference> _activitiesPost = [];
  List<DocumentReference> get activitiesPost => _activitiesPost;
  set activitiesPost(List<DocumentReference> _value) {
    _activitiesPost = _value;
  }

  void addToActivitiesPost(DocumentReference _value) {
    _activitiesPost.add(_value);
  }

  void removeFromActivitiesPost(DocumentReference _value) {
    _activitiesPost.remove(_value);
  }

  void removeAtIndexFromActivitiesPost(int _index) {
    _activitiesPost.removeAt(_index);
  }

  void updateActivitiesPostAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _activitiesPost[_index] = updateFn(_activitiesPost[_index]);
  }

  dynamic _countryInfoCompany = jsonDecode(
      '{\"name\":\"United States\",\"flag\":\"🇺🇸\",\"code\":\"US\",\"dial_code\":\"+1\"}');
  dynamic get countryInfoCompany => _countryInfoCompany;
  set countryInfoCompany(dynamic _value) {
    _countryInfoCompany = _value;
  }

  String _phonenumber = '';
  String get phonenumber => _phonenumber;
  set phonenumber(String _value) {
    _phonenumber = _value;
  }

  String _email = '';
  String get email => _email;
  set email(String _value) {
    _email = _value;
  }

  String _countryCode = '';
  String get countryCode => _countryCode;
  set countryCode(String _value) {
    _countryCode = _value;
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
  set listTypeReport(List<String> _value) {
    _listTypeReport = _value;
  }

  void addToListTypeReport(String _value) {
    _listTypeReport.add(_value);
  }

  void removeFromListTypeReport(String _value) {
    _listTypeReport.remove(_value);
  }

  void removeAtIndexFromListTypeReport(int _index) {
    _listTypeReport.removeAt(_index);
  }

  void updateListTypeReportAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _listTypeReport[_index] = updateFn(_listTypeReport[_index]);
  }

  String _choosenListReport = '';
  String get choosenListReport => _choosenListReport;
  set choosenListReport(String _value) {
    _choosenListReport = _value;
  }

  List<DocumentReference> _listPostWear = [];
  List<DocumentReference> get listPostWear => _listPostWear;
  set listPostWear(List<DocumentReference> _value) {
    _listPostWear = _value;
  }

  void addToListPostWear(DocumentReference _value) {
    _listPostWear.add(_value);
  }

  void removeFromListPostWear(DocumentReference _value) {
    _listPostWear.remove(_value);
  }

  void removeAtIndexFromListPostWear(int _index) {
    _listPostWear.removeAt(_index);
  }

  void updateListPostWearAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _listPostWear[_index] = updateFn(_listPostWear[_index]);
  }

  List<String> _jobTypeList = [
    'Remote',
    'Onsite',
    'Hybrid',
    'Part-time',
    'Full-time',
    'Project based'
  ];
  List<String> get jobTypeList => _jobTypeList;
  set jobTypeList(List<String> _value) {
    _jobTypeList = _value;
  }

  void addToJobTypeList(String _value) {
    _jobTypeList.add(_value);
  }

  void removeFromJobTypeList(String _value) {
    _jobTypeList.remove(_value);
  }

  void removeAtIndexFromJobTypeList(int _index) {
    _jobTypeList.removeAt(_index);
  }

  void updateJobTypeListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _jobTypeList[_index] = updateFn(_jobTypeList[_index]);
  }

  List<String> _selectedJobType = [];
  List<String> get selectedJobType => _selectedJobType;
  set selectedJobType(List<String> _value) {
    _selectedJobType = _value;
  }

  void addToSelectedJobType(String _value) {
    _selectedJobType.add(_value);
  }

  void removeFromSelectedJobType(String _value) {
    _selectedJobType.remove(_value);
  }

  void removeAtIndexFromSelectedJobType(int _index) {
    _selectedJobType.removeAt(_index);
  }

  void updateSelectedJobTypeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _selectedJobType[_index] = updateFn(_selectedJobType[_index]);
  }

  List<WearItemsStruct> _wearItems = [];
  List<WearItemsStruct> get wearItems => _wearItems;
  set wearItems(List<WearItemsStruct> _value) {
    _wearItems = _value;
  }

  void addToWearItems(WearItemsStruct _value) {
    _wearItems.add(_value);
  }

  void removeFromWearItems(WearItemsStruct _value) {
    _wearItems.remove(_value);
  }

  void removeAtIndexFromWearItems(int _index) {
    _wearItems.removeAt(_index);
  }

  void updateWearItemsAtIndex(
    int _index,
    WearItemsStruct Function(WearItemsStruct) updateFn,
  ) {
    _wearItems[_index] = updateFn(_wearItems[_index]);
  }

  String _imgBase64 = '';
  String get imgBase64 => _imgBase64;
  set imgBase64(String _value) {
    _imgBase64 = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
