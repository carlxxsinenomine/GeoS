import "package:dartz/dartz.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:geos/core/error/exceptions.dart";
import "package:geos/features/auth/data/models/user_login_model.dart";

class UserAuthService {
  final FirebaseAuth _auth;

  const UserAuthService(FirebaseAuth auth) : _auth = auth;

  Future<UserCredential?> userLogin(UserLoginModel user) async {
    try {
      final credentials = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      /// turn this off for now
      // await credentials.user?.sendEmailVerification();
      return credentials;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw AuthException('No account found with this email');
        case 'wrong-password':
          throw AuthException('Incorrect password');
        case 'user-disabled':
          throw AuthException('This account has been disabled');
        case 'too-many-requests':
          throw AuthException('Too many attempts. Try again later');
        default:
          throw AuthException('Sign in failed: ${e.message}');
      }
    }
  }
}
