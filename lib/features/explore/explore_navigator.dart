import 'package:devlogs_flutter_xchange/features/explore/explore_initial_params.dart';
import 'package:devlogs_flutter_xchange/features/explore/explore_page.dart';
import 'package:devlogs_flutter_xchange/injection_container.dart';
import 'package:devlogs_flutter_xchange/config/navigation/app_navigator.dart';
import 'package:flutter/material.dart';

class ExploreNavigator {}

mixin ExploreRoute {
  openExplore(ExploreInitialParams initialParams) {
    navigator.push(
      ExplorePage(cubit: getIt(param1: initialParams)),
    );
  }

  AppNavigator get navigator;

  BuildContext get context;
}
