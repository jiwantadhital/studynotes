import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preferences;

  static const _token = 'TOKEN';
  static const _username = 'USERNAME';
  static const _email = 'Email';
  static const _password = 'PASSWORD';
  static const _userID = 'USERID';
  static const _biometrics = 'BIOMETRICS';
  static const _remember = 'REMEMBER';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setEmailPassword(String email, String password) async {
    await _preferences?.setString(_email, email);
    await _preferences?.setString(_password, password);
  }

  static Future setUserID(int userID) async {
    await _preferences?.setInt(_userID, userID);
  }

   static Future setToken(String token) async {
    await _preferences?.setString(_token, token);
  }

  static Future setBiometrics(bool biometricsEnabled) async {
    await _preferences?.setBool(_biometrics, biometricsEnabled);
  }
  static Future setRemember(bool remember) async {
    await _preferences?.setBool(_remember, remember);
  }
 static userLoggedIn(){
    return _preferences?.containsKey(_token);
  }
  static String? getUsername() => _preferences?.getString(_username);
  static String? getEmail() => _preferences?.getString(_email);
  static String? getPassword() => _preferences?.getString(_password);
  static String? getToken() => _preferences?.getString(_token);
  static int? getUserID() => _preferences?.getInt(_userID);
  static bool? getBiometric() => _preferences?.getBool(_biometrics);
  static bool? getRemember() => _preferences?.getBool(_remember);

  //remove
  static Future removeEmailPassword()async{
    await _preferences?.remove(_email);
    await _preferences?.remove(_password);
  }
  static Future logout()async{
    await _preferences?.remove(_token);
  }
}