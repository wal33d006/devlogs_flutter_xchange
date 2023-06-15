import 'package:devlogs_flutter_xchange/ui/onboarding/onboarding_initial_params.dart';
import 'package:devlogs_flutter_xchange/ui/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:devlogs_flutter_xchange/main.dart';
import 'package:devlogs_flutter_xchange/navigation/app_navigator.dart';

class OnboardingNavigator {}

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
