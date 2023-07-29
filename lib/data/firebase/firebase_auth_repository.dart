import 'package:devlogs_flutter_xchange/domain/entities/user.dart';
import 'package:devlogs_flutter_xchange/domain/failures/login_failure.dart';
import 'package:devlogs_flutter_xchange/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthRepository implements AuthRepository {
  @override
  Future<Either<LoginFailure, User>> login() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = fb.GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      var fbUser = await fb.FirebaseAuth.instance.signInWithCredential(credential);

      return right(
        const User.empty().copyWith(
          id: fbUser.user?.uid ?? '',
          name: fbUser.user?.displayName ?? '',
          username: fbUser.user?.displayName ?? '',
          email: fbUser.user?.email ?? '',
          phone: fbUser.user?.phoneNumber ?? '',
        ),
      );
    } catch (error) {
      return left(LoginFailure(error: error.toString()));
    }
    // Add firebase auth
  }
}
