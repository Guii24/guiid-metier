import '/backend/schema/structs/index.dart';

class DisableUserCloudFunctionCallResponse {
  DisableUserCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
}

class RevokeRefreshTokensAndLogTimestampCloudFunctionCallResponse {
  RevokeRefreshTokensAndLogTimestampCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
}
