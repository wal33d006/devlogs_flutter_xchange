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

  @override
  void initState() {
    super.initState();
    cubit.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            state as HomeMasterState;
            return Text(state.user.name);
          },
        ),
      ),
    );
  }
}
