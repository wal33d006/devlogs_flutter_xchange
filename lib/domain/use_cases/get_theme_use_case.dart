import 'package:dartz/dartz.dart';
import 'package:devlogs_flutter_xchange/domain/failures/get_theme_failure.dart';
import 'package:devlogs_flutter_xchange/domain/repositories/local_storage_repository.dart';
import 'package:devlogs_flutter_xchange/domain/stores/theme_store.dart';
import 'package:devlogs_flutter_xchange/global.dart';

class GetThemeUseCase {
  final LocalStorageRepository _localStorageRepository;
  final ThemeStore _themeStore;

  GetThemeUseCase(
    this._localStorageRepository,
    this._themeStore,
  );

  Future<Either<GetThemeFailure, Unit>> execute() {
    return _localStorageRepository.getBool(GlobalConstants.themeKey).then(
          (value) => value.fold(
            (l) => left(GetThemeFailure(error: l.error)),
            (isDarkTheme) {
              _themeStore.setTheme(isDarkTheme);
              return right(unit);
            },
          ),
        );
  }
}
