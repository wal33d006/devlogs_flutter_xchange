import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_initial_params.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final OnboardingInitialParams initialParams;

  OnboardingCubit(this.initialParams) : super(OnboardingState.initial(initialParams: initialParams));
}
