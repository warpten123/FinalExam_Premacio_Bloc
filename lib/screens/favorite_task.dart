import 'package:finalmobile_premacio_bloc/bloc/task_bloc/task_bloc.dart';
import 'package:finalmobile_premacio_bloc/screens/task_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/task.dart';
import '../widget/task_list.dart';
import 'add_task_screen.dart';

class FavoriteTaskScreen extends StatelessWidget {
  const FavoriteTaskScreen({Key? key}) : super(key: key);
  static const path = 'task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.favoriteTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${taskList.length} Tasks',
                ),
              ),
            ),
            TaskList(taskList: taskList)
          ],
        );
      },
    );
  }
}
