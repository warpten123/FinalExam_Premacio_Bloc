import 'package:finalmobile_premacio_bloc/bloc/task_bloc/task_bloc.dart';
import 'package:finalmobile_premacio_bloc/screens/edit_task_screen.dart';
import 'package:finalmobile_premacio_bloc/widget/pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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

  void _editTask(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: EditTaskScreen(
                  oldTask: task,
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              task.isFavorite == false
                  ? Icon(Icons.star_outline)
                  : Icon(Icons.star),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 18,
                          decoration:
                              task.isDone! ? TextDecoration.lineThrough : null),
                    ),
                    Text(DateFormat()
                        .add_yMMMd()
                        .add_Hms()
                        .format(DateTime.parse(task.date))),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Checkbox(
                value: task.isDone,
                onChanged: task.isDeleted == false
                    ? (value) {
                        BlocProvider.of<TaskBloc>(context)
                            .add(UpdateTask(task: task));
                      }
                    : null),
            PopupMenu(
              task: task,
              restoreCallback: () =>
                  context.read<TaskBloc>().add(RestoreTask(task: task)),
              editTaskCallback: () => _editTask(context),
              cancelorDeleteCallBack: () => _removeTask(context, task),
              likeorDislike: () =>
                  context.read<TaskBloc>().add(TaskFavorite(task: task)),
            ),
          ],
        ),
      ],
    );
  }
}


//  ListTile(
//       title: Text(
//         task.title,
//         overflow: TextOverflow.ellipsis,
//         style: TextStyle(
//             decoration: task.isDone! ? TextDecoration.lineThrough : null),
//       ),
//       trailing: Checkbox(
//           value: task.isDone,
//           onChanged: task.isDeleted == false
//               ? (value) {
//                   BlocProvider.of<TaskBloc>(context)
//                       .add(UpdateTask(task: task));
//                 }
//               : null),
//       onLongPress: () =>
//           // BlocProvider.of<TaskBloc>(context).add(DeleteTask(task: task)),
//           _removeTask(context, task),
//     );

//
