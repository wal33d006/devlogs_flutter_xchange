import 'package:dartz/dartz.dart';
import 'package:devlogs_flutter_xchange/domain/entities/user.dart';
import 'package:devlogs_flutter_xchange/domain/failures/users_list_failure.dart';

abstract class UsersRepository {
  Future<Either<UsersListFailure, List<User>>> getUsers();
}