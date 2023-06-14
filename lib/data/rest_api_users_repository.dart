import 'package:dartz/dartz.dart';
import 'package:devlogs_flutter_xchange/domain/entities/user.dart';
import 'package:devlogs_flutter_xchange/data/user_json.dart';
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
}
