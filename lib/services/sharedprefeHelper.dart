import 'package:shared_preferences/shared_preferences.dart';

class Sharedprefehelper {
  static String userID = "USERID";
  static String userName = "USERNAMEKEY";
  static String userEmail = "USEREMAIL";
  static String userDisplayname = "USERDISPLAYNAME";

  saveUserID(String getuserID) async {
    SharedPreferences prefe = await SharedPreferences.getInstance();
    return prefe.setString(userID, getuserID);
  }

  saveUserEmail(String getuserEmail) async {
    SharedPreferences prefe = await SharedPreferences.getInstance();
    return prefe.setString(userEmail, getuserEmail);
  }

  saveUserName(String getuserName) async {
    SharedPreferences prefe = await SharedPreferences.getInstance();
    return prefe.setString(userID, getuserName);
  }

  saveUserDisplayName(String getuserDisplayName) async {
    SharedPreferences prefe = await SharedPreferences.getInstance();
    return prefe.setString(userDisplayname, getuserDisplayName);
  }

  getUserId() async {
    SharedPreferences prefe = await SharedPreferences.getInstance();
    return prefe.getString(userID);
  }

  getUserName() async {
    SharedPreferences prefe = await SharedPreferences.getInstance();
    return prefe.getString(userName);
  }

  getUserEmail() async {
    SharedPreferences prefe = await SharedPreferences.getInstance();
    return prefe.getString(userEmail);
  }

  getUserDisplayName() async {
    SharedPreferences prefe = await SharedPreferences.getInstance();
    return prefe.getString(userDisplayname);
  }
}
