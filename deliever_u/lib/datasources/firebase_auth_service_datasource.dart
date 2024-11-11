import 'package:firebase_auth/firebase_auth.dart';
import 'package:rappi_u/datasources/auth_datasource.dart';

class FirebaseAuthServiceDatasource extends AuthDatasource {
  @override
  Future<User?> login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(credential.user);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }

  @override
  Stream<User?> getUserSesion() {
    return FirebaseAuth.instance.idTokenChanges();
  }

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

}
