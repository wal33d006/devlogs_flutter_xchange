import 'package:devlogs_flutter_xchange/ui/onboarding/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_state.dart';

class OnboardingPage extends StatefulWidget {
  final OnboardingCubit cubit;

  const OnboardingPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingState();
}

class _OnboardingState extends State<OnboardingPage> {
  OnboardingCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icon.png',
            color: Theme.of(context).colorScheme.primary,
          ),
          Text('Welcome to Flutter Xchange', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text('Catch events, find talent, get hired!', style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Text('Continue with Google'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
