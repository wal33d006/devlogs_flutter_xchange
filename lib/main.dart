import 'package:devlogs_flutter_xchange/config/navigation/app_navigator.dart';
import 'package:devlogs_flutter_xchange/config/theme/theme_data.dart';
import 'package:devlogs_flutter_xchange/data/datasources/theme_store.dart';
import 'package:devlogs_flutter_xchange/features/onboarding/onboarding_initial_params.dart';
import 'package:devlogs_flutter_xchange/features/onboarding/onboarding_page.dart';
import 'package:devlogs_flutter_xchange/injection_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: getIt<ThemeStore>(),
        builder: (context, state) {
          state as bool;
          return MaterialApp(
            navigatorKey: AppNavigator.navigatorKey,
            title: 'Flutter Demo',
            theme: state ? darkTheme : lightTheme,
            home: OnboardingPage(
              cubit: getIt(param1: const OnboardingInitialParams()),
            ),
          );
        });
  }
}
