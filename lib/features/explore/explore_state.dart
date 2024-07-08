import 'package:devlogs_flutter_xchange/domain/entities/user.dart';
import 'package:devlogs_flutter_xchange/domain/entities/job.dart';
import 'package:devlogs_flutter_xchange/domain/entities/tab_type.dart';
import 'package:devlogs_flutter_xchange/features/explore/explore_initial_params.dart';

class ExploreState {
  final TabType selectedTabType;
  final User user;
  final List<Job> jobs;
  final bool isJobsLoading;

  const ExploreState({
    required this.selectedTabType,
    required this.user,
    required this.jobs,
    required this.isJobsLoading,
  });

  factory ExploreState.initial({required ExploreInitialParams initialParams}) => const ExploreState(
        selectedTabType: TabType.job,
        user: User.empty(),
        jobs: [],
        isJobsLoading: false,
      );

  ExploreState copyWith({
    TabType? selectedTabType,
    User? user,
    List<Job>? jobs,
    bool? isJobsLoading,
  }) =>
      ExploreState(
        selectedTabType: selectedTabType ?? this.selectedTabType,
        user: user ?? this.user,
        jobs: jobs ?? this.jobs,
        isJobsLoading: isJobsLoading ?? this.isJobsLoading,
      );
}
