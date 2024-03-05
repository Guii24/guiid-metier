const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.disableUser = functions.https.onCall(async (data, context) => {
  try {
    const uid = data.uid;
    if (!uid) {
      throw new Error("User ID is required");
    }

    // Disable the user
    await admin.auth().updateUser(uid, {
      disabled: true,
    });

    // Fetch and log the updated user record
    const updatedUser = await admin.auth().getUser(uid);
    console.log("Successfully disabled user:", updatedUser.toJSON());

    return { success: true, message: "User disabled successfully" };
  } catch (error) {
    console.error("Error disabling user:", error);
    throw new functions.https.HttpsError("internal", "Error disabling user");
  }
});
