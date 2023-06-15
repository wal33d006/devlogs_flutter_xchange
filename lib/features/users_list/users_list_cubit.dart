import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:devlogs_flutter_xchange/domain/entities/user.dart';
import 'package:devlogs_flutter_xchange/domain/repositories/users_repository.dart';
import 'package:devlogs_flutter_xchange/features/user_details/user_details_initial_params.dart';
import 'package:devlogs_flutter_xchange/features/users_list/users_list_initial_params.dart';
import 'package:devlogs_flutter_xchange/features/users_list/users_list_navigator.dart';
import 'package:devlogs_flutter_xchange/features/users_list/users_list_state.dart';

class UsersListCubit extends Cubit<UsersListState> {
  final UsersRepository usersRepository;
  final UsersListNavigator navigator;
  final UsersListInitialParams initialParams;

  UsersListCubit(
    this.initialParams,
    this.usersRepository,
    this.navigator,
  ) : super(UsersListState.initial());

  Future<void> fetchUsers() async {
    emit(state.copyWith(isLoading: true, error: null));
    final usersResponse = await usersRepository.getUsers();
    usersResponse.fold(
      (error) {
        // show dialog error on UI
        // after we add navigation layer
        emit(state.copyWith(error: error.error));
      },
      (users) {
        emit(state.copyWith(users: users, isLoading: false));
      },
    );
  }

  onTapUser(User user) => navigator.openUserDetails(UserDetailsInitialParams(user: user));
}
