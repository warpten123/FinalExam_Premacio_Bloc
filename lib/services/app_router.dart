import 'package:finalmobile_premacio_bloc/screens/tasks_screen.dart';
import 'package:flutter/material.dart';

import '../screens/recycle_bin.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.path:
        return MaterialPageRoute(builder: (_) => const RecycleBin());
      case TasksScreen.path:
        return MaterialPageRoute(builder: (_) => const TasksScreen());

      default:
        return null;
    }
  }
}
