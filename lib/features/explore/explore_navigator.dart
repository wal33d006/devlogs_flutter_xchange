import 'package:devlogs_flutter_xchange/features/explore/explore_initial_params.dart';
import 'package:devlogs_flutter_xchange/features/explore/explore_page.dart';
import 'package:flutter/material.dart';
import 'package:devlogs_flutter_xchange/main.dart';
import 'package:devlogs_flutter_xchange/navigation/app_navigator.dart';

class ExploreNavigator {}

mixin ExploreRoute {
  openExplore(ExploreInitialParams initialParams) {
    navigator.push(
      context,
      ExplorePage(cubit: getIt(param1: initialParams)),
    );
  }

  AppNavigator get navigator;

  BuildContext get context;
}
