const admin = require("firebase-admin/app");
admin.initializeApp();

const disableUser = require("./disable_user.js");
exports.disableUser = disableUser.disableUser;
const revokeRefreshTokensAndLogTimestamp = require("./revoke_refresh_tokens_and_log_timestamp.js");
exports.revokeRefreshTokensAndLogTimestamp =
  revokeRefreshTokensAndLogTimestamp.revokeRefreshTokensAndLogTimestamp;
