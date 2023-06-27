import 'package:devlogs_flutter_xchange/domain/entities/user.dart';

import 'home_master_initial_params.dart';

class HomeMasterState {
  final User user;
  final bool isDarkTheme;

  const HomeMasterState({
    required this.user,
    required this.isDarkTheme,
  });

  factory HomeMasterState.initial({required HomeMasterInitialParams initialParams}) => const HomeMasterState(
        user: User.empty(),
        isDarkTheme: false,
      );

  HomeMasterState copyWith({User? user, bool? isDarkTheme}) => HomeMasterState(
        user: user ?? this.user,
        isDarkTheme: isDarkTheme ?? this.isDarkTheme,
      );
}
