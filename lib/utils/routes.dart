import 'package:face_graph_test/database/database.dart';
import 'package:face_graph_test/ui/add_new_chair/add_new_chair_page.dart';
import 'package:face_graph_test/ui/add_new_chair/edit_chair_info.dart';
import 'package:face_graph_test/ui/chairs_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ChairsPage.route:
        return MaterialPageRoute(builder: (_) => const ChairsPage());
      case AddNewChairPage.route:
        return MaterialPageRoute(
            builder: (_) => AddNewChairPage(
                lengthValue: settings.arguments as int));

      case EditChairInfoPage.route:
        return MaterialPageRoute(
            builder: (_) => EditChairInfoPage(
                chair: settings.arguments as Chair));

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
