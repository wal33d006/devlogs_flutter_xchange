import 'package:dartz/dartz.dart';
import 'package:devlogs_flutter_xchange/domain/entities/user.dart';
import 'package:devlogs_flutter_xchange/domain/failures/login_failure.dart';
import 'package:devlogs_flutter_xchange/domain/repositories/auth_repository.dart';

class MockAuthRepository implements AuthRepository {
  @override
  Future<Either<LoginFailure, User>> login() async {
    await Future.delayed(const Duration(seconds: 2));
    return right(
      const User.empty().copyWith(
        name: 'Waleed',
        email: 'waleed@gmail.com',
        id: '123456',
      ),
    );
  }
}
