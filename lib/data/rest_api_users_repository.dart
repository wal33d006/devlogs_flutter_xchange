import 'package:dartz/dartz.dart';
import 'package:devlogs_flutter_xchange/domain/entities/user.dart';
import 'package:devlogs_flutter_xchange/data/user_json.dart';
import 'package:devlogs_flutter_xchange/domain/failures/get_user_failure.dart';
import 'package:devlogs_flutter_xchange/domain/failures/update_user_failure.dart';
import 'package:devlogs_flutter_xchange/domain/failures/users_list_failure.dart';
import 'package:devlogs_flutter_xchange/domain/repositories/users_repository.dart';
import 'package:devlogs_flutter_xchange/network/network_repository.dart';

class RestApiUsersRepository implements UsersRepository {
  final NetworkRepository _networkRepository;

  RestApiUsersRepository(this._networkRepository);

  @override
  Future<Either<UsersListFailure, List<User>>> getUsers() =>
      _networkRepository.get('https://jsonplaceholder.typicode.com/users').then(
            (value) => value.fold(
              (l) => left(UsersListFailure(error: l.error)),
              (r) {
                var list = r as List;
                return right(list.map((e) => UserJson.fromJson(e).toDomain()).toList());
              },
            ),
          );

  @override
  Future<Either<UpdateUserFailure, bool>> updateUser(User user) async {
    return right(true);
  }

  @override
  Future<Either<GetUserFailure, User>> getUserByEmail(String email) async {
    return right(const User.empty().copyWith(
      name: 'Waleed',
      email: 'waleed@gmail.com',
      id: '123456',
    ));
  }
}
