import 'package:dartz/dartz.dart';
import 'package:devlogs_flutter_xchange/domain/entities/user.dart';
import 'package:devlogs_flutter_xchange/domain/failures/login_failure.dart';

abstract class AuthRepository {
  Future<Either<LoginFailure, User>> login();
}
