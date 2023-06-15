import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:devlogs_flutter_xchange/features/user_details/user_details_initial_params.dart';
import 'package:devlogs_flutter_xchange/features/user_details/user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  final UserDetailsInitialParams initialParams;

  UserDetailsCubit(this.initialParams) : super(UserDetailsState.initial(initialParams: initialParams));
}
