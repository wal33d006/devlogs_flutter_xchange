import 'package:flutter/material.dart';
import 'package:devlogs_flutter_xchange/main.dart';
import 'package:devlogs_flutter_xchange/navigation/app_navigator.dart';
import 'package:devlogs_flutter_xchange/features/user_details/user_details_initial_params.dart';
import 'package:devlogs_flutter_xchange/features/user_details/user_details_page.dart';

class UserDetailsNavigator {}

mixin UserDetailsRoute {
  openUserDetails(UserDetailsInitialParams initialParams) {
    navigator.push(
      context,
      UserDetailsPage(cubit: getIt(param1: initialParams)),
    );
  }

  AppNavigator get navigator;

  BuildContext get context;
}
