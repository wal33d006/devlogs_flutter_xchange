import 'package:dartz/dartz.dart';
import 'package:devlogs_flutter_xchange/domain/entities/user.dart';
import 'package:devlogs_flutter_xchange/domain/failures/users_list_failure.dart';
import 'package:devlogs_flutter_xchange/domain/repositories/users_repository.dart';

class MockUsersRepository implements UsersRepository {
  @override
  Future<Either<UsersListFailure, List<User>>> getUsers() async => right([
        const User(
          id: 123,
          name: 'name',
          username: 'username',
          email: 'email',
          phone: 'phone',
          website: 'website',
        )
      ]);
}
