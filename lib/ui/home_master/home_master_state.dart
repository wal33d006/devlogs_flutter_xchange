import 'package:devlogs_flutter_xchange/domain/entities/user.dart';

import 'home_master_initial_params.dart';

class HomeMasterState {
  final User user;

  const HomeMasterState({required this.user});

  factory HomeMasterState.initial({required HomeMasterInitialParams initialParams}) => const HomeMasterState(
        user: User.empty(),
      );

  HomeMasterState copyWith({User? user}) => HomeMasterState(user: user ?? this.user);
}
