import 'package:finalmobile_premacio_bloc/screens/tabs_screen.dart';
import 'package:finalmobile_premacio_bloc/screens/pending_task.dart';
import 'package:flutter/material.dart';

import '../screens/recycle_bin.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.path:
        return MaterialPageRoute(builder: (_) => const RecycleBin());
      case TabsScreen.path:
        return MaterialPageRoute(builder: (_) => TabsScreen());

      default:
        return null;
    }
  }
}
