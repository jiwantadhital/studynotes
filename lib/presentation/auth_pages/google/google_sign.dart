import 'package:google_sign_in/google_sign_in.dart';
import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';

class GoogleSignInApi{
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn().then((userData) {
    userData!.authentication.then((gkey){
    UserSimplePreferences.setToken(gkey.accessToken!);
    UserSimplePreferences.setUserName(userData.displayName!);
    UserSimplePreferences.setGooglePhoto(userData.photoUrl!);
    });
  } );
  static Future<GoogleSignInAccount?> logout() => _googleSignIn.signOut();
}