import 'package:devlogs_flutter_xchange/data/insecure_local_storage_repository.dart';
import 'package:devlogs_flutter_xchange/data/mock_auth_repository.dart';
import 'package:devlogs_flutter_xchange/data/mock_users_repository.dart';
import 'package:devlogs_flutter_xchange/domain/repositories/auth_repository.dart';
import 'package:devlogs_flutter_xchange/domain/repositories/local_storage_repository.dart';
import 'package:devlogs_flutter_xchange/domain/stores/user_store.dart';
import 'package:devlogs_flutter_xchange/domain/use_cases/check_for_existing_user_use_case.dart';
import 'package:devlogs_flutter_xchange/domain/use_cases/social_login_use_case.dart';
import 'package:devlogs_flutter_xchange/features/home_master/home_master_cubit.dart';
import 'package:devlogs_flutter_xchange/features/home_master/home_master_initial_params.dart';
import 'package:devlogs_flutter_xchange/features/home_master/home_master_navigator.dart';
import 'package:devlogs_flutter_xchange/features/onboarding/onboarding_cubit.dart';
import 'package:devlogs_flutter_xchange/features/onboarding/onboarding_initial_params.dart';
import 'package:devlogs_flutter_xchange/features/onboarding/onboarding_navigator.dart';
import 'package:devlogs_flutter_xchange/features/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:devlogs_flutter_xchange/domain/repositories/users_repository.dart';
import 'package:devlogs_flutter_xchange/navigation/app_navigator.dart';
import 'package:devlogs_flutter_xchange/network/network_repository.dart';
import 'package:devlogs_flutter_xchange/features/user_details/user_details_cubit.dart';
import 'package:devlogs_flutter_xchange/features/user_details/user_details_initial_params.dart';
import 'package:devlogs_flutter_xchange/features/users_list/users_list_cubit.dart';
import 'package:devlogs_flutter_xchange/features/users_list/users_list_initial_params.dart';
import 'package:devlogs_flutter_xchange/features/users_list/users_list_navigator.dart';
import 'package:devlogs_flutter_xchange/data/rest_api_users_repository.dart';

final getIt = GetIt.instance;

void main() async {
  getIt.registerSingleton<NetworkRepository>(NetworkRepository());
  getIt.registerSingleton<UsersRepository>(MockUsersRepository());
  getIt.registerSingleton<AuthRepository>(MockAuthRepository());
  getIt.registerSingleton<LocalStorageRepository>(InsecureLocalStorageRepository());
  getIt.registerSingleton<UserStore>(UserStore());
  getIt.registerSingleton<AppNavigator>(AppNavigator());
  getIt.registerSingleton<CheckForExistingUserUseCase>(
    CheckForExistingUserUseCase(
      getIt(),
      getIt(),
      getIt(),
    ),
  );
  getIt.registerSingleton<SocialLoginUseCase>(
    SocialLoginUseCase(
      getIt(),
      getIt(),
      getIt(),
      getIt(),
    ),
  );
  getIt.registerSingleton<UsersListNavigator>(UsersListNavigator(getIt()));
  getIt.registerSingleton<OnboardingNavigator>(OnboardingNavigator(getIt()));
  getIt.registerSingleton<HomeMasterNavigator>(HomeMasterNavigator());
  getIt.registerFactoryParam<HomeMasterCubit, HomeMasterInitialParams, dynamic>(
    (params, _) => HomeMasterCubit(
      params,
      getIt(),
    ),
  );
  getIt.registerFactoryParam<OnboardingCubit, OnboardingInitialParams, dynamic>(
    (params, _) => OnboardingCubit(
      params,
      getIt(),
      getIt(),
      getIt(),
    ),
  );
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
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: const Color(0xFF2F384C),
              )),
      home: OnboardingPage(
        cubit: getIt(param1: const OnboardingInitialParams()),
      ),
    );
  }
}
