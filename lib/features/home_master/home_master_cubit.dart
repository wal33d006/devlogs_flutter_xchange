import 'package:devlogs_flutter_xchange/domain/stores/user_store.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_master_initial_params.dart';
import 'home_master_state.dart';

class HomeMasterCubit extends Cubit<HomeMasterState> {
  final HomeMasterInitialParams initialParams;
  final UserStore _userStore;

  HomeMasterCubit(
    this.initialParams,
    this._userStore,
  ) : super(HomeMasterState.initial(initialParams: initialParams));

  onInit() => emit(state.copyWith(user: _userStore.state));
}
