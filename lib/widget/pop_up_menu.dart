import 'package:finalmobile_premacio_bloc/bloc/task_bloc/task_bloc.dart';
import 'package:finalmobile_premacio_bloc/widget/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/task.dart';

class PopupMenu extends StatelessWidget {
  final Task task;

  final VoidCallback cancelorDeleteCallBack;
  final VoidCallback likeorDislike;
  final VoidCallback editTaskCallback;
  const PopupMenu({
    Key? key,
    required this.cancelorDeleteCallBack,
    required this.likeorDislike,
    required this.editTaskCallback,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false
            ? ((context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: editTaskCallback,
                      icon: Icon(Icons.edit),
                      label: Text('Edit'),
                      // onPressed: null,
                    ),
                    onTap: null,
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                      // onPressed: () {},
                      icon: task.isFavorite == false
                          ? Icon(Icons.bookmark_add_outlined)
                          : Icon(Icons.bookmark_remove),
                      label: task.isFavorite == false
                          ? Text('Add to Bookmarks')
                          : Text('Remove Bookmark'),
                      onPressed: null,
                    ),
                    onTap: likeorDislike,
                  ),
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: null,
                      // onPressed: () {},
                      icon: Icon(Icons.delete),
                      label: Text('Delete'),
                    ),
                    onTap: cancelorDeleteCallBack,
                  )
                ])
            : (context) => [
                  PopupMenuItem(
                      child: TextButton.icon(
                        // onPressed: () {},
                        icon: Icon(Icons.restore_from_trash),
                        label: Text('Restore'), onPressed: null,
                      ),
                      onTap: () {}),
                  PopupMenuItem(
                      child: TextButton.icon(
                        // onPressed: () {},
                        icon: Icon(Icons.delete_forever),
                        label: Text('Delete Permanently'), onPressed: null,
                      ),
                      onTap: cancelorDeleteCallBack),
                ]);
  }
}
