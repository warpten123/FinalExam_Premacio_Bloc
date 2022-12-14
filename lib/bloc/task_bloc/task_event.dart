// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TaskEvent {
  final Task task;
  const AddTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class UpdateTask extends TaskEvent {
  final Task task;
  const UpdateTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class DeleteTask extends TaskEvent {
  final Task task;
  const DeleteTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class RemoveTask extends TaskEvent {
  final Task task;
  const RemoveTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class TaskFavorite extends TaskEvent {
  final Task task;
  const TaskFavorite({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class EditTask extends TaskEvent {
  final Task oldTask;
  final Task newTask;
  EditTask({
    required this.oldTask,
    required this.newTask,
  });

  @override
  List<Object> get props => [oldTask, newTask];
}

class RestoreTask extends TaskEvent {
  final Task task;
  RestoreTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}
