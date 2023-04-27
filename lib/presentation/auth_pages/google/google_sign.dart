
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';
import 'package:studynotes/logic/auth/google/bloc/google_bloc.dart';
import 'package:studynotes/presentation/extra_widgets/extra_widgets.dart';

class GoogleSignInApi{
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login(context) => _googleSignIn.signIn().then((userData) {
    userData!.authentication.then((gkey)async{
      print(gkey.accessToken.toString());
      BlocProvider.of<GoogleBloc>(context).add(GoogleLoginEvent(token: gkey.accessToken.toString()));
      await networkImageToBase64(userData.photoUrl.toString());
    UserSimplePreferences.setGooglePhoto(bytes);
    });
    return null;
  }
   );
  static Future<GoogleSignInAccount?> logout() => _googleSignIn.signOut();
}