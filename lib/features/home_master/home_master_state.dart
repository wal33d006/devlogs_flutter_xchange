import 'package:devlogs_flutter_xchange/domain/entities/user.dart';

import 'home_master_initial_params.dart';

class HomeMasterState {
  final User user;
  final bool isDarkTheme;
  final int selectedPageIndex;

  const HomeMasterState({
    required this.user,
    required this.isDarkTheme,
    required this.selectedPageIndex,
  });

  factory HomeMasterState.initial({required HomeMasterInitialParams initialParams}) => const HomeMasterState(
        user: User.empty(),
        isDarkTheme: false,
        selectedPageIndex: 0,
      );

  HomeMasterState copyWith({
    User? user,
    bool? isDarkTheme,
    int? selectedPageIndex,
  }) =>
      HomeMasterState(
        user: user ?? this.user,
        isDarkTheme: isDarkTheme ?? this.isDarkTheme,
        selectedPageIndex: selectedPageIndex ?? this.selectedPageIndex,
      );
}
