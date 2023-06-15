import 'package:dartz/dartz.dart';
import 'package:devlogs_flutter_xchange/domain/entities/user.dart';
import 'package:devlogs_flutter_xchange/domain/failures/login_failure.dart';
import 'package:devlogs_flutter_xchange/domain/repositories/auth_repository.dart';
import 'package:devlogs_flutter_xchange/domain/stores/user_store.dart';

class SocialLoginUseCase {
  final AuthRepository _authRepository;
  final UserStore _userStore;

  SocialLoginUseCase(this._authRepository, this._userStore);

  Future<Either<LoginFailure, User>> execute() => _authRepository.login().then(
        (value) => value.fold(
          (l) => left(l),
          (user) {
            _userStore.setUser(user);
            return right(user);
          },
        ),
      );
}
