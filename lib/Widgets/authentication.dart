import 'package:firebase_auth/firebase_auth.dart';
import 'User1.dart';


class AuthService{
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User1 _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User1(uid :user.uid):null;
  }

  Stream<User1> get user{
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  Future signInAnon() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email,String  pass , String cPass , String verify) async{
    try{

      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future loginWithEmailAndPassword(String email,String  pass) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  Future signOut()async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}








