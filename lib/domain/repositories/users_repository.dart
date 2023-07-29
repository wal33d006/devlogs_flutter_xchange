import 'package:fpdart/fpdart.dart';
import 'package:devlogs_flutter_xchange/domain/entities/user.dart';
import 'package:devlogs_flutter_xchange/domain/failures/get_user_failure.dart';
import 'package:devlogs_flutter_xchange/domain/failures/update_user_failure.dart';
import 'package:devlogs_flutter_xchange/domain/failures/users_list_failure.dart';

abstract class UsersRepository {
  Future<Either<UsersListFailure, List<User>>> getUsers();

  Future<Either<UpdateUserFailure, bool>> updateUser(User user);

  Future<Either<GetUserFailure, User>> getUserByEmail(String email);
}
