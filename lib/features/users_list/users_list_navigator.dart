import 'package:flutter/material.dart';
import 'package:devlogs_flutter_xchange/main.dart';
import 'package:devlogs_flutter_xchange/navigation/app_navigator.dart';
import 'package:devlogs_flutter_xchange/features/user_details/user_details_navigator.dart';
import 'package:devlogs_flutter_xchange/features/users_list/users_list_initial_params.dart';
import 'package:devlogs_flutter_xchange/features/users_list/users_list_page.dart';

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
      context,
      UsersListPage(cubit: getIt(param1: initialParams)),
    );
  }

  AppNavigator get navigator;

  BuildContext get context;
}
