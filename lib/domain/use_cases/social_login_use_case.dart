import 'package:fpdart/fpdart.dart';
import 'package:devlogs_flutter_xchange/domain/entities/user.dart';
import 'package:devlogs_flutter_xchange/domain/failures/login_failure.dart';
import 'package:devlogs_flutter_xchange/domain/repositories/auth_repository.dart';
import 'package:devlogs_flutter_xchange/domain/repositories/local_storage_repository.dart';
import 'package:devlogs_flutter_xchange/domain/repositories/users_repository.dart';
import 'package:devlogs_flutter_xchange/domain/stores/user_store.dart';

class SocialLoginUseCase {
  final AuthRepository _authRepository;
  final UserStore _userStore;
  final UsersRepository _usersRepository;
  final LocalStorageRepository _localStorageRepository;

  SocialLoginUseCase(
    this._authRepository,
    this._userStore,
    this._usersRepository,
    this._localStorageRepository,
  );

  Future<Either<LoginFailure, User>> execute() => _authRepository.login().then(
        (value) => value.fold(
          (l) => left(l),
          (user) {
            return _usersRepository.updateUser(user).then(
                  (value) => value.fold(
                    (fail) => left(LoginFailure(error: fail.error)),
                    (r) => _localStorageRepository.setString('USER_EMAIL', user.email).then(
                          (value) => value.fold(
                            (l) => left(LoginFailure(error: l.error)),
                            (r) {
                              _userStore.setUser(user);
                              return right(user);
                            },
                          ),
                        ),
                  ),
                );
          },
        ),
      );
}
