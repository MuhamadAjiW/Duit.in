
import 'package:firebase_auth/firebase_auth.dart';
import 'package:duit.in/models/user_model.dart';
import 'package:duit.in/services/user_service.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      UserModel user =
          await UserService().getUserByUid(userCredential.user!.uid);
      return user;
    } catch (e){
      throw e;
    }
  }

  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  }) async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      UserModel user = UserModel(uid: userCredential.user!.uid, email: email, name: name);

      await UserService().setUser(user);
      return user;
    } catch(e){
      throw e;
    }
  }

  Future<void> signOut() async{
    try{
      await _auth.signOut();
    } catch (e) {
      throw e;
    }
  }

  Future<void> updatePass(String newPass) async{
    try{
      final user = await _auth.currentUser;
      if (user != null){
        user.updatePassword(newPass).then((_) {});
      }
    } catch (e){
      throw e;
    }
  }
}