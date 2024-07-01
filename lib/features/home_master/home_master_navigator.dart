import 'package:flutter/material.dart';
import 'package:devlogs_flutter_xchange/main.dart';
import 'package:devlogs_flutter_xchange/navigation/app_navigator.dart';
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
