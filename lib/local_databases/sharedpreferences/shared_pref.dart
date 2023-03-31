import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preferences;

  static const _token = 'TOKEN';
  static const _username = 'USERNAME';
  static const _googlePhoto = 'GOOGLEPHOTO';
  static const _email = 'Email';
  static const _password = 'PASSWORD';
  static const _userID = 'USERID';
  static const _biometrics = 'BIOMETRICS';
  static const _remember = 'REMEMBER';
  static const _otp = 'OTP';
  static const _verfified = 'Verified';
  static const _continueReading = 'Continue';
   static const _notices = 'Notices';
    static const _dark = 'Dark';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setEmailPassword(String email, String password) async {
    await _preferences?.setString(_email, email);
    await _preferences?.setString(_password, password);
  }

  static Future setUserID(int userID) async {
    await _preferences?.setInt(_userID, userID);
  }
  static Future setNotices(int notices) async {
    await _preferences?.setInt(_notices, notices);
  }
  static Future setOTP(String otp) async {
    await _preferences?.setString(_otp, otp);
  }
   static Future setUserName(String username) async {
    await _preferences?.setString(_username, username);
  }
   static Future setGooglePhoto(String goglePhoto) async {
    await _preferences?.setString(_googlePhoto, goglePhoto);
  }

   static Future setToken(String token) async {
    await _preferences?.setString(_token, token);
  }
   static Future setContinue(List<String> continueReading) async {
    await _preferences?.setStringList(_continueReading, continueReading);
  }

  static Future setBiometrics(bool biometricsEnabled) async {
    await _preferences?.setBool(_biometrics, biometricsEnabled);
  }
  static Future setDark(bool darkEnabled) async {
    await _preferences?.setBool(_dark, darkEnabled);
  }
   static Future setVerified(bool verified) async {
    await _preferences?.setBool(_verfified, verified);
  }
  static Future setRemember(bool remember) async {
    await _preferences?.setBool(_remember, remember);
  }
 static userLoggedIn(){
    return _preferences?.containsKey(_token);
  }
  static String? getUsername() => _preferences?.getString(_username);
   static String? getGooglePhoto() => _preferences?.getString(_googlePhoto);
  static String? getEmail() => _preferences?.getString(_email);
  static String? getPassword() => _preferences?.getString(_password);
  static String? getToken() => _preferences?.getString(_token);
  static int? getUserID() => _preferences?.getInt(_userID);
  static int? getNotices() => _preferences?.getInt(_notices);
  static String? getOtp() => _preferences?.getString(_otp);
  static bool? getBiometric() => _preferences?.getBool(_biometrics);
  static bool? getVerified() => _preferences?.getBool(_verfified);
  static bool? getRemember() => _preferences?.getBool(_remember);
  static bool? getDark() => _preferences?.getBool(_dark);
   static List<String>? getContinue() => _preferences?.getStringList(_continueReading);

  //remove
  static Future removeEmailPassword()async{
    await _preferences?.remove(_email);
    await _preferences?.remove(_password);
  }
  static Future removeUserDetails()async{
    await _preferences?.remove(_googlePhoto);
    await _preferences?.remove(_username);
    await _preferences?.remove(_googlePhoto);
  }
  static Future removeOtp()async{
    await _preferences?.remove(_otp);
  }
  static Future logout()async{
    await _preferences?.remove(_token);
  }
}