import 'package:finalmobile_premacio_bloc/bloc/task_bloc/task_bloc.dart';
import 'package:finalmobile_premacio_bloc/services/id_gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/task.dart';

// ignore: must_be_immutable
class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({
    Key? key,
  }) : super(key: key);
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          const Text(
            'Add Task',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: TextField(
              autofocus: true,
              controller: titleController,
              decoration: const InputDecoration(
                  label: Text('Title'), border: OutlineInputBorder()),
            ),
          ),
          TextField(
            autofocus: true,
            controller: descController,
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(
                label: Text('Description'), border: OutlineInputBorder()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    var task = Task(
                      date: DateTime.now().toString(),
                      title: titleController.text,
                      id: GUIDGen.generate(),
                      description: descController.text,
                    );
                    BlocProvider.of<TaskBloc>(context).add(AddTask(task: task));
                    // context.read<TaskBloc>().add(AddTask(task: task));
                    Navigator.pop(context);
                  },
                  child: const Text('Add')),
            ],
          ),
        ],
      ),
    );
  }
}
