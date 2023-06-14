import 'package:devlogs_flutter_xchange/ui/user_details/user_details_navigator.dart';
import 'package:flutter/material.dart';
import 'package:devlogs_flutter_xchange/main.dart';
import 'package:devlogs_flutter_xchange/navigation/app_navigator.dart';
import 'onboarding_initial_params.dart';
import 'onboarding_page.dart';

class OnboardingNavigator with UserDetailsRoute {
  OnboardingNavigator(this.navigator);

  @override
  late BuildContext context;

  @override
  final AppNavigator navigator;
}

mixin OnboardingRoute {
  openOnboarding(OnboardingInitialParams initialParams) {
    navigator.push(
      context,
      OnboardingPage(cubit: getIt(param1: initialParams)),
    );
  }

  AppNavigator get navigator;

  BuildContext get context;
}
