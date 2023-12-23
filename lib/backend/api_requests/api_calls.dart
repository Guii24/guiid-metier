import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start revenueCat Group Code

class RevenueCatGroup {
  static String baseUrl = 'https://api.revenuecat.com/v1';
  static Map<String, String> headers = {
    'Authorization': 'Bearer appl_aTXLPNvKKkHKSqEraVlDemoPvnD',
  };
  static InfoCall infoCall = InfoCall();
}

class InfoCall {
  Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'info',
      apiUrl: '${RevenueCatGroup.baseUrl}/subscribers/${userId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer appl_aTXLPNvKKkHKSqEraVlDemoPvnD',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? expireDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.subscriber.entitlements.Premium.expires_date''',
      ));
}

/// End revenueCat Group Code

class GoogleAutoCompleteCall {
  static Future<ApiCallResponse> call({
    String? input = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Google AutoComplete',
      apiUrl: 'https://maps.googleapis.com/maps/api/place/autocomplete/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'key': "AIzaSyDjObLV5pxxXi8BtFWyJGKOgRdUmMeW4jY",
        'input': input,
        'types': "locality",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? text(dynamic response) => (getJsonField(
        response,
        r'''$.predictions[:].structured_formatting.main_text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? prediction(dynamic response) => (getJsonField(
        response,
        r'''$.predictions[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.predictions[0].terms[0].value''',
      ));
  static String? state(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.predictions[0].terms[1].value''',
      ));
  static String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.predictions[0].terms[2].value''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static List? terms(dynamic response) => getJsonField(
        response,
        r'''$.predictions[:].terms''',
        true,
      ) as List?;
}

class TwilioCall {
  static Future<ApiCallResponse> call({
    String? to = '',
    String? body = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Twilio',
      apiUrl:
          'https://api.twilio.com/2010-04-01/Accounts/AC8f25a1e8d6728695f3c41143ad44f4a5/Messages.json',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic QUM4ZjI1YTFlOGQ2NzI4Njk1ZjNjNDExNDNhZDQ0ZjRhNTpmN2FlOTVhZGZhMDYzZWEyODk1Njg0NzA4N2RmNzdjMQ==',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'To': to,
        'From': "15075853342",
        'Body': body,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
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
