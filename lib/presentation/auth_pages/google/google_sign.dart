import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';
import 'package:studynotes/logic/auth/google/bloc/google_bloc.dart';

class GoogleSignInApi{
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login(context) => _googleSignIn.signIn().then((userData) {
    userData!.authentication.then((gkey){
      BlocProvider.of<GoogleBloc>(context).add(GoogleLoginEvent(token: gkey.toString()));
    UserSimplePreferences.setGooglePhoto(userData.photoUrl!);
    });
  }
   );
  static Future<GoogleSignInAccount?> logout() => _googleSignIn.signOut();
}