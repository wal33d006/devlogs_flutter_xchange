import 'package:dartz/dartz.dart';
import 'package:devlogs_flutter_xchange/domain/failures/update_theme_failure.dart';
import 'package:devlogs_flutter_xchange/domain/repositories/local_storage_repository.dart';
import 'package:devlogs_flutter_xchange/domain/stores/theme_store.dart';
import 'package:devlogs_flutter_xchange/global.dart';

class UpdateThemeUseCase {
  final ThemeStore _themeStore;
  final LocalStorageRepository _localStorageRepository;

  UpdateThemeUseCase(this._themeStore, this._localStorageRepository);

  Future<Either<UpdateThemeFailure, bool>> execute(bool isDarkTheme) {
    _themeStore.setTheme(isDarkTheme);
    return _localStorageRepository.setBool(GlobalConstants.themeKey, isDarkTheme).then(
          (value) => value.fold(
            (l) => left(UpdateThemeFailure(error: l.error)),
            (r) => right(true),
          ),
        );
  }
}
