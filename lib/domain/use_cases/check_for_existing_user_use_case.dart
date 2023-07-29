import 'package:fpdart/fpdart.dart';
import 'package:devlogs_flutter_xchange/domain/entities/user.dart';
import 'package:devlogs_flutter_xchange/domain/failures/existing_user_failure.dart';
import 'package:devlogs_flutter_xchange/domain/repositories/local_storage_repository.dart';
import 'package:devlogs_flutter_xchange/domain/repositories/users_repository.dart';
import 'package:devlogs_flutter_xchange/domain/stores/user_store.dart';

class CheckForExistingUserUseCase {
  final UsersRepository _usersRepository;
  final LocalStorageRepository _localStorageRepository;
  final UserStore _userStore;

  CheckForExistingUserUseCase(
    this._usersRepository,
    this._localStorageRepository,
    this._userStore,
  );

  Future<Either<ExistingUserFailure, User>> execute() {
    return _localStorageRepository.getString('USER_EMAIL').then(
          (value) => value.fold(
            (l) => left(ExistingUserFailure(error: l.error)),
            (email) {
              if (email.isNotEmpty) {
                return _usersRepository.getUserByEmail(email).then(
                      (value) => value.fold(
                        (l) => left(ExistingUserFailure(error: l.error)),
                        (user) {
                          _userStore.setUser(user);
                          return right(user);
                        },
                      ),
                    );
              }
              return left(ExistingUserFailure(error: 'User doesn\'t exist '));
            },
          ),
        );
  }
}
