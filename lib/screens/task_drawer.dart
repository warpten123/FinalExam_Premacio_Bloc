import 'package:finalmobile_premacio_bloc/bloc/bloc/task_bloc.dart';
import 'package:finalmobile_premacio_bloc/screens/recycle_bin.dart';
import 'package:finalmobile_premacio_bloc/screens/tasks_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskDrawer extends StatelessWidget {
  const TaskDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              color: Colors.grey,
              child: Text(
                'Task Drawer',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return ListTile(
                  leading: Icon(Icons.folder),
                  title: Text('My Tasks'),
                  trailing: Text('${state.allTasks.length}'),
                  onTap: () {
                    Navigator.of(context).pushNamed(TasksScreen.path);
                  },
                );
              },
            ),
            Divider(),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed(RecycleBin.path);
                  },
                  leading: Icon(Icons.delete),
                  title: Text('Tasks Bin'),
                  trailing: Text('${state.removedTasks.length}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
