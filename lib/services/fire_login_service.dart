import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_collection/ui/projects/authentication_error.dart';

class FireLoginService {
  final _fireStore = FirebaseAuth.instance;
  final authError = AuthenticationError();

  Future<void> login({required String email, required String password}) async {
    await _fireStore.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
