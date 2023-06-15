import 'package:devlogs_flutter_xchange/features/onboarding/onboarding_initial_params.dart';

class OnboardingState {
  final bool isLoading;

  const OnboardingState({required this.isLoading});

  factory OnboardingState.initial({required OnboardingInitialParams initialParams}) => const OnboardingState(
        isLoading: false,
      );

  OnboardingState copyWith({bool? isLoading}) => OnboardingState(
        isLoading: isLoading ?? this.isLoading,
      );
}
