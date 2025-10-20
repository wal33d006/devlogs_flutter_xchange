import 'package:devlogs_flutter_xchange/features/user_details/user_details_navigator.dart';
import 'package:devlogs_flutter_xchange/features/users_list/users_list_initial_params.dart';
import 'package:devlogs_flutter_xchange/features/users_list/users_list_page.dart';
import 'package:devlogs_flutter_xchange/injection_container.dart';
import 'package:devlogs_flutter_xchange/config/navigation/app_navigator.dart';
import 'package:flutter/material.dart';

class UsersListNavigator with UserDetailsRoute {
  UsersListNavigator(this.navigator);

  @override
  late BuildContext context;

  @override
  final AppNavigator navigator;
}

mixin UsersListRoute {
  openUsersListRoute(UsersListInitialParams initialParams) {
    navigator.push(
      UsersListPage(cubit: getIt(param1: initialParams)),
    );
  }

  AppNavigator get navigator;

  BuildContext get context;
}
