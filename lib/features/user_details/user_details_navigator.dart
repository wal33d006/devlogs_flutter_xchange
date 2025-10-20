import 'package:devlogs_flutter_xchange/features/user_details/user_details_initial_params.dart';
import 'package:devlogs_flutter_xchange/features/user_details/user_details_page.dart';
import 'package:devlogs_flutter_xchange/injection_container.dart';
import 'package:devlogs_flutter_xchange/config/navigation/app_navigator.dart';
import 'package:flutter/material.dart';

class UserDetailsNavigator {}

mixin UserDetailsRoute {
  openUserDetails(UserDetailsInitialParams initialParams) {
    navigator.push(
      UserDetailsPage(cubit: getIt(param1: initialParams)),
    );
  }

  AppNavigator get navigator;

  BuildContext get context;
}
