import 'package:devlogs_flutter_xchange/domain/stores/user_store.dart';
import 'package:devlogs_flutter_xchange/domain/entities/tab_type.dart';
import 'package:devlogs_flutter_xchange/features/explore/explore_initial_params.dart';
import 'package:devlogs_flutter_xchange/features/explore/explore_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/jobs_repository.dart';

class ExploreCubit extends Cubit<ExploreState> {
  final ExploreInitialParams initialParams;
  final UserStore _userStore;
  final JobsRepository _jobsRepository;

  ExploreCubit(
    this.initialParams,
    this._userStore,
    this._jobsRepository,
  ) : super(ExploreState.initial(initialParams: initialParams));

  onTabUpdated(TabType type) => emit(state.copyWith(selectedTabType: type));

  onInit() {
    emit(state.copyWith(isJobsLoading: true));
    _jobsRepository.fetchJobs().then(
          (value) => value.fold(
            (fail) => null,
            (jobs) => emit(
              state.copyWith(
                jobs: jobs,
                isJobsLoading: false,
              ),
            ),
          ),
        );
    emit(state.copyWith(user: _userStore.state));
  }
}
