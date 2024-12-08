import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthApi{
  static final _googleSighIn=GoogleSignIn(scopes: ['https://mail.google.com/']);
  static Future<GoogleSignInAccount?> signIn() async {
    if(await _googleSighIn.isSignedIn()){
      return _googleSighIn.currentUser;
    }
    else{
      return await _googleSighIn.signIn();
    }
  }
  static Future<void> signOut()async {
    _googleSighIn.signOut();
  }
}