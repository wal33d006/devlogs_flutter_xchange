import 'package:devlogs_flutter_xchange/injection_container.dart';
import 'package:devlogs_flutter_xchange/config/navigation/app_navigator.dart';
import 'package:flutter/material.dart';

import 'home_master_initial_params.dart';
import 'home_master_page.dart';

class HomeMasterNavigator {}

mixin HomeMasterRoute {
  openHomeMaster(HomeMasterInitialParams initialParams) {
    navigator.push(
      HomeMasterPage(cubit: getIt(param1: initialParams)),
    );
  }

  AppNavigator get navigator;

  BuildContext get context;
}
