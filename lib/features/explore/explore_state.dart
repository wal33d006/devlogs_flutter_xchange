import 'package:devlogs_flutter_xchange/domain/entities/user.dart';
import 'package:devlogs_flutter_xchange/features/explore/domain/models/tab_type.dart';
import 'package:devlogs_flutter_xchange/features/explore/explore_initial_params.dart';

class ExploreState {
  final TabType selectedTabType;
  final User user;

  const ExploreState({
    required this.selectedTabType,
    required this.user,
  });

  factory ExploreState.initial({required ExploreInitialParams initialParams}) => const ExploreState(
        selectedTabType: TabType.job,
        user: User.empty(),
      );

  ExploreState copyWith({
    TabType? selectedTabType,
    User? user,
  }) =>
      ExploreState(
        selectedTabType: selectedTabType ?? this.selectedTabType,
        user: user ?? this.user,
      );
}
