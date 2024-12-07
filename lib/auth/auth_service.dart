
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final _auth  = FirebaseAuth.instance;
  // late final Logger logger ;
  Future<UserCredential?> loginWithGoogle() async{
try{
final googleUser  = await GoogleSignIn().signIn();
final googleAuth = await googleUser?.authentication;
final cred = GoogleAuthProvider.credential(idToken: googleAuth?.idToken,accessToken: googleAuth?.accessToken ,);
return await _auth.signInWithCredential(cred);
}catch(e){
print(e.toString());
}
return null;
  }
Future<User?>  createUserWithEmailAndPassword(String email, String password) async{
try{
   final authEmailValue = await _auth.createUserWithEmailAndPassword(email: email, password: password);

 return authEmailValue.user;
}catch(e){
  // logger.i('Something went Wrong!!!');
}
return null;
}
Future<User?>  signInUserWithEmailAndPassword(String email, String password) async{
try{
   final authEmailValue = await _auth.signInWithEmailAndPassword(email: email, password: password);

 return authEmailValue.user;
}catch(e){
  // logger.i('Something went Wrong!!!');
}
return null;
}
Future<void> signOutEmail() async{
try{
  await _auth.signOut();

}catch(e){
//  logger.i('''
// Something went Wrong!!! ${e.toString()}
// ''');
}
}
Future<User?>  ForgotPassword(String email) async{
try{
 await _auth.sendPasswordResetEmail(email: email);

 
}catch(e){
  // logger.i('Something went Wrong!!!');
}
return null;
}
}