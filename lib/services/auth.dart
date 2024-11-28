import 'package:agenda_medica/services/database.dart';
import 'package:cloud_firestore_platform_interface/src/timestamp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:agenda_medica/modules/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Método para converter User do Firebase para AppUser
  AppUser? _userFromFirebaseUser(User? user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  // Getter para retornar um Stream<AppUser?>
  Stream<AppUser?> get user {
    return _auth.authStateChanges()
        .map(_userFromFirebaseUser);
  }

  // Entrar com email e senha
  Future sighInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null; // Retorna nulo em caso de erro
    }
  }

  // Registrar com email e senha
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      await DatabaseService(uid: user!.uid).updateUserData('title', 'name', 'telephone', Timestamp(0,0), 'desc');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null; // Retorna nulo em caso de erro
    }
  }

  // Logout
  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null; // O retorno aqui pode ser omitido, já que é um Future<void>
    }
  }
}