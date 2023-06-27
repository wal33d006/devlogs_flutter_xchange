import 'package:devlogs_flutter_xchange/domain/stores/theme_store.dart';
import 'package:devlogs_flutter_xchange/domain/stores/user_store.dart';
import 'package:devlogs_flutter_xchange/domain/use_cases/update_theme_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_master_initial_params.dart';
import 'home_master_state.dart';

class HomeMasterCubit extends Cubit<HomeMasterState> {
  final HomeMasterInitialParams initialParams;
  final UserStore _userStore;
  final UpdateThemeUseCase _updateThemeUseCase;
  final ThemeStore _themeStore;

  HomeMasterCubit(
    this.initialParams,
    this._userStore,
    this._updateThemeUseCase,
    this._themeStore,
  ) : super(HomeMasterState.initial(initialParams: initialParams));

  onInit() {
    emit(state.copyWith(user: _userStore.state, isDarkTheme: _themeStore.state));
    _themeStore.stream.listen((event) {
      emit(state.copyWith(isDarkTheme: event));
    });
  }

  void onThemeChanged(bool value) => _updateThemeUseCase.execute(value);
}
