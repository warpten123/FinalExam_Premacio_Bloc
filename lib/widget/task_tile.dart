import 'package:finalmobile_premacio_bloc/bloc/task_bloc/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;
  void _removeTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TaskBloc>().add(DeleteTask(task: task))
        : context.read<TaskBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
            decoration: task.isDone! ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
          value: task.isDone,
          onChanged: task.isDeleted == false
              ? (value) {
                  BlocProvider.of<TaskBloc>(context)
                      .add(UpdateTask(task: task));
                }
              : null),
      onLongPress: () =>
          // BlocProvider.of<TaskBloc>(context).add(DeleteTask(task: task)),
          _removeTask(context, task),
    );
  }
}
