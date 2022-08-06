import 'package:finalmobile_premacio_bloc/bloc/task_bloc/task_bloc.dart';
import 'package:finalmobile_premacio_bloc/screens/task_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/task_list.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);
  static const path = 'recycle_bin_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recycle Bin'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: TaskDrawer(),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${state.removedTasks.length}Tasks',
                  ),
                ),
              ),
              TaskList(taskList: state.removedTasks)
            ],
          );
        },
      ),
    );
  }
}
