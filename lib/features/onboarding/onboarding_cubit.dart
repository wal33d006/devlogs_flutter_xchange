import 'package:devlogs_flutter_xchange/domain/use_cases/check_for_existing_user_use_case.dart';
import 'package:devlogs_flutter_xchange/domain/use_cases/get_theme_use_case.dart';
import 'package:devlogs_flutter_xchange/domain/use_cases/social_login_use_case.dart';
import 'package:devlogs_flutter_xchange/features/home_master/home_master_initial_params.dart';
import 'package:devlogs_flutter_xchange/features/onboarding/onboarding_initial_params.dart';
import 'package:devlogs_flutter_xchange/features/onboarding/onboarding_navigator.dart';
import 'package:devlogs_flutter_xchange/features/onboarding/onboarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final OnboardingInitialParams initialParams;
  final SocialLoginUseCase _socialLoginUseCase;
  final OnboardingNavigator navigator;
  final CheckForExistingUserUseCase _checkForExistingUserUseCase;
  final GetThemeUseCase _getThemeUseCase;

  OnboardingCubit(
    this.initialParams,
    this.navigator,
    this._socialLoginUseCase,
    this._checkForExistingUserUseCase,
    this._getThemeUseCase,
  ) : super(OnboardingState.initial(initialParams: initialParams));

  onInit() {
    _getThemeUseCase.execute();
    emit(state.copyWith(isLoading: true));
    _checkForExistingUserUseCase.execute().then(
          (value) => value.fold(
            (l) {
              emit(state.copyWith(isLoading: false));
            },
            (r) {
              emit(state.copyWith(isLoading: false));
              return navigator.openHomeMaster(const HomeMasterInitialParams());
            },
          ),
        );
  }

  void onTapGoogleSignIn() {
    emit(state.copyWith(isLoading: true));
    _socialLoginUseCase.execute().then(
          (value) => value.fold(
            (l) {
              emit(state.copyWith(isLoading: false));
            },
            (user) {
              emit(state.copyWith(isLoading: false));
              return navigator.openHomeMaster(const HomeMasterInitialParams());
            },
          ),
        );
  }
}
