import 'package:firebase_auth/firebase_auth.dart';


class Auth{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStatechanges => _firebaseAuth.authStateChanges();

  // LOGIN WITH EMAIL AND PASSWORD
  Future<void>loginWithEmailAndPassword(String email,String password)async{
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }
// LOGOUT
  Future<void>logout()async{
    await _firebaseAuth.signOut();

  }
  // CREATE USER WITH EMAIL AND PASSWORD
  Future<void>createUserwithEmailAndPassword(String email,String password)async{
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

  }

}
