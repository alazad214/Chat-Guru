import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static String userID = "userId";
  static String userName = "userName";
  static String userEmail = "userEmail";
  static String userDisplayname = "userDisplayName";
  static String userPic = "userPIc";

  ///Save Profile Detials in User...
  saveUserID(String userID) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(userID, userID);
  }

  saveUserEmail(String getuserEmail) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(userEmail, getuserEmail);
  }

  saveUserName(String getuserName) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(userID, getuserName);
  }

  saveUserDisplayName(String getuserDisplayName) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(userDisplayname, getuserDisplayName);
  }

  saveUserPic(String getuserDisplayName) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(userPic, getuserDisplayName);
  }

  ///Get Profile Detials in User...
  getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userID);
  }

  getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userName);
  }

  getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmail);
  }

  getUserDisplayName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userDisplayname);
  }

  getUserPic() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userPic);
  }
}
