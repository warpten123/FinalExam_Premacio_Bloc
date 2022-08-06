import 'package:finalmobile_premacio_bloc/bloc/task_bloc/task_bloc.dart';
import 'package:finalmobile_premacio_bloc/widget/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: taskList
              .map(
                (task) => ExpansionPanelRadio(
                  value: task.id,
                  headerBuilder: (context, isOpen) => TaskTile(task: task),
                  body: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(bottom: 16),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: SelectableText.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Title\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: task.title),
                          const TextSpan(
                            text: '\n\nDescription\n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: task.description),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

// Expanded(
//       child: ListView.builder(
//           itemCount: taskList.length,
//           itemBuilder: (context, index) {
//             var task = taskList[index];
//             return TaskTile(task: task);
//           }),
//     );