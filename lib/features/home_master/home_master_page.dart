import 'package:devlogs_flutter_xchange/features/explore/explore_initial_params.dart';
import 'package:devlogs_flutter_xchange/features/explore/explore_page.dart';
import 'package:devlogs_flutter_xchange/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_master_cubit.dart';
import 'home_master_state.dart';

class HomeMasterPage extends StatefulWidget {
  final HomeMasterCubit cubit;

  const HomeMasterPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<HomeMasterPage> createState() => _HomeMasterState();
}

class _HomeMasterState extends State<HomeMasterPage> {
  HomeMasterCubit get cubit => widget.cubit;

  final List<Widget> _pages = [
    ExplorePage(cubit: getIt(param1: const ExploreInitialParams())),
    const Center(child: Text('Two')),
    const Center(child: Text('Three')),
  ];

  @override
  void initState() {
    super.initState();
    cubit.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            state as HomeMasterState;
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                _pages[state.selectedPageIndex],
                SafeArea(
                  child: Card(
                    shape:
                        StadiumBorder(side: BorderSide(color: Theme.of(context).colorScheme.primary.withOpacity(0.2))),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => cubit.onPageUpdated(0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  state.selectedPageIndex == 0 ? Icons.explore : Icons.explore_outlined,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                const Text('Explore'),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () => cubit.onPageUpdated(1),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  state.selectedPageIndex == 1 ? Icons.grid_view_rounded : Icons.grid_view_outlined,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                const Text('Events'),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () => cubit.onPageUpdated(2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  state.selectedPageIndex == 2 ? Icons.face : Icons.face_outlined,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                const Text('Profile'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
