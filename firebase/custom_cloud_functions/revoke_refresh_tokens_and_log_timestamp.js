const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.revokeRefreshTokensAndLogTimestamp = functions.https.onCall(
  async (data, context) => {
    try {
      const uid = data.uid;
      if (!uid) {
        throw new Error("User ID is required");
      }

      // Revoke all refresh tokens for the specified user
      await admin.auth().revokeRefreshTokens(uid);

      // Retrieve the timestamp of the revocation
      const userRecord = await admin.auth().getUser(uid);
      const timestamp =
        new Date(userRecord.tokensValidAfterTime).getTime() / 1000;

      console.log(`Tokens revoked at: ${timestamp}`);
      return { success: true, message: `Tokens revoked at: ${timestamp}` };
    } catch (error) {
      console.error("Error revoking tokens:", error);
      throw new functions.https.HttpsError("internal", "Error revoking tokens");
    }
  },
);

// Add your additional function below this comment
// For example:
// exports.yourAdditionalFunction = functions.https.onCall((data, context) => {
//   // Your additional code here
// });
