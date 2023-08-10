import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GoogleAutoCompleteCall {
  static Future<ApiCallResponse> call({
    String? input = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Google AutoComplete',
      apiUrl: 'https://maps.googleapis.com/maps/api/place/autocomplete/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'key': "AIzaSyDjObLV5pxxXi8BtFWyJGKOgRdUmMeW4jY",
        'input': input,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic text(dynamic response) => getJsonField(
        response,
        r'''$.predictions[:].structured_formatting.main_text''',
        true,
      );
  static dynamic prediction(dynamic response) => getJsonField(
        response,
        r'''$.predictions[:].description''',
        true,
      );
  static dynamic city(dynamic response) => getJsonField(
        response,
        r'''$.predictions[0].terms[0].value''',
      );
  static dynamic state(dynamic response) => getJsonField(
        response,
        r'''$.predictions[0].terms[1].value''',
      );
  static dynamic country(dynamic response) => getJsonField(
        response,
        r'''$.predictions[0].terms[2].value''',
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic terms(dynamic response) => getJsonField(
        response,
        r'''$.predictions[:].terms''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
