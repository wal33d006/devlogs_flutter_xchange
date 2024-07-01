import 'package:devlogs_flutter_xchange/features/explore/domain/models/tab_type.dart';
import 'package:devlogs_flutter_xchange/features/explore/explore_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'explore_cubit.dart';

class ExplorePage extends StatefulWidget {
  final ExploreCubit cubit;

  const ExplorePage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExploreState();
}

class _ExploreState extends State<ExplorePage> {
  ExploreCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          state as ExploreState;
          return Scaffold(
            body: Column(
              children: [
                const SizedBox(height: 32),
                SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello,',
                                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                              ),
                              Text(
                                state.user.firstName,
                                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Theme.of(context).colorScheme.primary.withOpacity(0.2)),
                            ),
                            child: const Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  minRadius: 5,
                                  maxRadius: 5,
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Recent: #Flutter Forward',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 32),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: ElevatedButton(
                          onPressed: () => cubit.onTabUpdated(TabType.job),
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            side: state.selectedTabType == TabType.job
                                ? null
                                : BorderSide(color: Theme.of(context).colorScheme.primary),
                            foregroundColor: state.selectedTabType == TabType.job
                                ? Theme.of(context).colorScheme.onPrimary
                                : Theme.of(context).colorScheme.primary,
                            backgroundColor: state.selectedTabType == TabType.job
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.onPrimary,
                          ),
                          child: const Text('Jobs'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: 120,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            side: state.selectedTabType == TabType.talent
                                ? null
                                : BorderSide(color: Theme.of(context).colorScheme.primary),
                            foregroundColor: state.selectedTabType == TabType.talent
                                ? Theme.of(context).colorScheme.onPrimary
                                : Theme.of(context).colorScheme.primary,
                            backgroundColor: state.selectedTabType == TabType.talent
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.onPrimary,
                          ),
                          onPressed: () => cubit.onTabUpdated(TabType.talent),
                          child: const Text('Talent'),
                        ),
                      ),
                    ],
                  ),
                ),
                if (state.selectedTabType == TabType.job)
                  Expanded(
                    child: ListView.builder(
                        itemCount: state.jobs.length,
                        itemBuilder: (context, index) {
                          final job = state.jobs[index];

                          return Card(
                            child: ListTile(
                              title: Text(job.title),
                              subtitle: Text(job.companyName),
                            ),
                          );
                        }),
                  ),
                if (state.selectedTabType == TabType.talent)
                  const Center(
                    child: Text('Talent'),
                  ),
              ],
            ),
          );
        });
  }
}
