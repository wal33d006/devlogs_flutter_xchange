import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:devlogs_flutter_xchange/domain/repositories/users_repository.dart';
import 'package:devlogs_flutter_xchange/navigation/app_navigator.dart';
import 'package:devlogs_flutter_xchange/network/network_repository.dart';
import 'package:devlogs_flutter_xchange/ui/user_details/user_details_cubit.dart';
import 'package:devlogs_flutter_xchange/ui/user_details/user_details_initial_params.dart';
import 'package:devlogs_flutter_xchange/ui/users_list/users_list_cubit.dart';
import 'package:devlogs_flutter_xchange/ui/users_list/users_list_initial_params.dart';
import 'package:devlogs_flutter_xchange/ui/users_list/users_list_navigator.dart';
import 'package:devlogs_flutter_xchange/ui/users_list/users_list_page.dart';
import 'package:devlogs_flutter_xchange/data/rest_api_users_repository.dart';

final getIt = GetIt.instance;

void main() async {
  getIt.registerSingleton<NetworkRepository>(NetworkRepository());
  getIt.registerSingleton<UsersRepository>(RestApiUsersRepository(getIt()));
  getIt.registerSingleton<AppNavigator>(AppNavigator());
  getIt.registerSingleton<UsersListNavigator>(UsersListNavigator(getIt()));
  getIt.registerFactoryParam<UsersListCubit, UsersListInitialParams, dynamic>(
    (params, _) => UsersListCubit(
      params,
      getIt(),
      getIt(),
    )..fetchUsers(),
  );
  getIt.registerFactoryParam<UserDetailsCubit, UserDetailsInitialParams, dynamic>(
    (params, _) => UserDetailsCubit(params),
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UsersListPage(cubit: getIt(param1: const UsersListInitialParams())),
    );
  }
}
