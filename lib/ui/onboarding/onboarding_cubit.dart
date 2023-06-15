import 'package:devlogs_flutter_xchange/ui/onboarding/onboarding_initial_params.dart';
import 'package:devlogs_flutter_xchange/ui/onboarding/onboarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final OnboardingInitialParams initialParams;

  OnboardingCubit(this.initialParams) : super(OnboardingState.initial(initialParams: initialParams));
}
