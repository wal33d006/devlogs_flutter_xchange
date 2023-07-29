import 'package:fpdart/fpdart.dart';
import 'package:devlogs_flutter_xchange/domain/entities/user.dart';
import 'package:devlogs_flutter_xchange/domain/failures/get_user_failure.dart';
import 'package:devlogs_flutter_xchange/domain/failures/update_user_failure.dart';
import 'package:devlogs_flutter_xchange/domain/failures/users_list_failure.dart';
import 'package:devlogs_flutter_xchange/domain/repositories/users_repository.dart';

class MockUsersRepository implements UsersRepository {
  @override
  Future<Either<UsersListFailure, List<User>>> getUsers() async => right([
        const User(
          id: '123',
          name: 'name',
          username: 'username',
          email: 'email',
          phone: 'phone',
          website: 'website',
        )
      ]);

  @override
  Future<Either<UpdateUserFailure, bool>> updateUser(User user) async {
    await Future.delayed(const Duration(seconds: 1));
    return right(true);
  }

  @override
  Future<Either<GetUserFailure, User>> getUserByEmail(String email) async {
    await Future.delayed(const Duration(seconds: 1));
    return right(
      const User.empty().copyWith(
        name: 'Waleed',
        email: 'waleed@gmail.com',
        id: '123456',
      ),
    );
  }
}
