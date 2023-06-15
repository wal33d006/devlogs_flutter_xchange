import 'package:devlogs_flutter_xchange/domain/use_cases/social_login_use_case.dart';
import 'package:devlogs_flutter_xchange/ui/home_master/home_master_initial_params.dart';
import 'package:devlogs_flutter_xchange/ui/onboarding/onboarding_initial_params.dart';
import 'package:devlogs_flutter_xchange/ui/onboarding/onboarding_navigator.dart';
import 'package:devlogs_flutter_xchange/ui/onboarding/onboarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final OnboardingInitialParams initialParams;
  final SocialLoginUseCase _socialLoginUseCase;
  final OnboardingNavigator navigator;

  OnboardingCubit(
    this.initialParams,
    this.navigator,
    this._socialLoginUseCase,
  ) : super(OnboardingState.initial(initialParams: initialParams));

  void onTapGoogleSignIn() {
    emit(state.copyWith(isLoading: true));
    _socialLoginUseCase.execute().then(
          (value) => value.fold(
            (l) => null,
            (user) {
              emit(state.copyWith(isLoading: false));
              return navigator.openHomeMaster(const HomeMasterInitialParams());
            },
          ),
        );
  }
}
