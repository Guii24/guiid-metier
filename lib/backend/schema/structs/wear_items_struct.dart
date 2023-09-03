// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WearItemsStruct extends FFFirebaseStruct {
  WearItemsStruct({
    String? wearText,
    String? wearLink,
    String? wearImage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _wearText = wearText,
        _wearLink = wearLink,
        _wearImage = wearImage,
        super(firestoreUtilData);

  // "wear_text" field.
  String? _wearText;
  String get wearText => _wearText ?? '';
  set wearText(String? val) => _wearText = val;
  bool hasWearText() => _wearText != null;

  // "wear_link" field.
  String? _wearLink;
  String get wearLink => _wearLink ?? '';
  set wearLink(String? val) => _wearLink = val;
  bool hasWearLink() => _wearLink != null;

  // "wear_image" field.
  String? _wearImage;
  String get wearImage => _wearImage ?? '';
  set wearImage(String? val) => _wearImage = val;
  bool hasWearImage() => _wearImage != null;

  static WearItemsStruct fromMap(Map<String, dynamic> data) => WearItemsStruct(
        wearText: data['wear_text'] as String?,
        wearLink: data['wear_link'] as String?,
        wearImage: data['wear_image'] as String?,
      );

  static WearItemsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? WearItemsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'wear_text': _wearText,
        'wear_link': _wearLink,
        'wear_image': _wearImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'wear_text': serializeParam(
          _wearText,
          ParamType.String,
        ),
        'wear_link': serializeParam(
          _wearLink,
          ParamType.String,
        ),
        'wear_image': serializeParam(
          _wearImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static WearItemsStruct fromSerializableMap(Map<String, dynamic> data) =>
      WearItemsStruct(
        wearText: deserializeParam(
          data['wear_text'],
          ParamType.String,
          false,
        ),
        wearLink: deserializeParam(
          data['wear_link'],
          ParamType.String,
          false,
        ),
        wearImage: deserializeParam(
          data['wear_image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WearItemsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WearItemsStruct &&
        wearText == other.wearText &&
        wearLink == other.wearLink &&
        wearImage == other.wearImage;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([wearText, wearLink, wearImage]);
}

WearItemsStruct createWearItemsStruct({
  String? wearText,
  String? wearLink,
  String? wearImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WearItemsStruct(
      wearText: wearText,
      wearLink: wearLink,
      wearImage: wearImage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WearItemsStruct? updateWearItemsStruct(
  WearItemsStruct? wearItems, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    wearItems
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWearItemsStructData(
  Map<String, dynamic> firestoreData,
  WearItemsStruct? wearItems,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (wearItems == null) {
    return;
  }
  if (wearItems.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && wearItems.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final wearItemsData = getWearItemsFirestoreData(wearItems, forFieldValue);
  final nestedData = wearItemsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = wearItems.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWearItemsFirestoreData(
  WearItemsStruct? wearItems, [
  bool forFieldValue = false,
]) {
  if (wearItems == null) {
    return {};
  }
  final firestoreData = mapToFirestore(wearItems.toMap());

  // Add any Firestore field values
  wearItems.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWearItemsListFirestoreData(
  List<WearItemsStruct>? wearItemss,
) =>
    wearItemss?.map((e) => getWearItemsFirestoreData(e, true)).toList() ?? [];
