import 'package:devlogs_flutter_xchange/domain/stores/user_store.dart';
import 'package:devlogs_flutter_xchange/features/explore/domain/models/tab_type.dart';
import 'package:devlogs_flutter_xchange/features/explore/explore_initial_params.dart';
import 'package:devlogs_flutter_xchange/features/explore/explore_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreCubit extends Cubit<ExploreState> {
  final ExploreInitialParams initialParams;
  final UserStore _userStore;

  ExploreCubit(
    this.initialParams,
    this._userStore,
  ) : super(ExploreState.initial(initialParams: initialParams));

  onTabUpdated(TabType type) => emit(state.copyWith(selectedTabType: type));

  onInit() => emit(state.copyWith(user: _userStore.state));
}
