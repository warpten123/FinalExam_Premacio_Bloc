import 'package:finalmobile_premacio_bloc/bloc/switch_bloc/bloc/switch_bloc.dart';
import 'package:finalmobile_premacio_bloc/bloc/task_bloc/task_bloc.dart';
import 'package:finalmobile_premacio_bloc/screens/recycle_bin.dart';
import 'package:finalmobile_premacio_bloc/screens/tabs_screen.dart';
import 'package:finalmobile_premacio_bloc/screens/pending_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskDrawer extends StatefulWidget {
  TaskDrawer({Key? key}) : super(key: key);

  @override
  State<TaskDrawer> createState() => _TaskDrawerState();
}

class _TaskDrawerState extends State<TaskDrawer> {
  bool switchValue = false;
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
                  trailing: Text('${state.pendingTasks.length}'),
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(TabsScreen.path);
                  },
                );
              },
            ),
            Divider(),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(RecycleBin.path);
                  },
                  leading: Icon(Icons.delete),
                  title: Text('Tasks Bin'),
                  trailing: Text('${state.removedTasks.length}'),
                );
              },
            ),
            const Divider(),
            const Expanded(child: SizedBox()),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return ListTile(
                  leading: Switch(
                    value: state.switchValue,
                    onChanged: (newValue) {
                      newValue
                          ? context.read<SwitchBloc>().add(SwitchOnEvent())
                          : context.read<SwitchBloc>().add(SwitchOffEvent());
                    },
                  ),
                  title: const Text('Switch to Dark Theme'),
                  // onTap: () => _switchToDarkTheme(context, !TestData.isDarkTheme),
                );
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
