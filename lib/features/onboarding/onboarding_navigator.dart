import 'package:devlogs_flutter_xchange/features/home_master/home_master_navigator.dart';
import 'package:devlogs_flutter_xchange/features/onboarding/onboarding_initial_params.dart';
import 'package:devlogs_flutter_xchange/features/onboarding/onboarding_page.dart';
import 'package:devlogs_flutter_xchange/injection_container.dart';
import 'package:devlogs_flutter_xchange/config/navigation/app_navigator.dart';
import 'package:flutter/material.dart';

class OnboardingNavigator with HomeMasterRoute {
  OnboardingNavigator(this.navigator);

  @override
  late BuildContext context;

  @override
  AppNavigator navigator;
}

mixin OnboardingRoute {
  openOnboarding(OnboardingInitialParams initialParams) {
    navigator.push(
      OnboardingPage(cubit: getIt(param1: initialParams)),
    );
  }

  AppNavigator get navigator;

  BuildContext get context;
}
