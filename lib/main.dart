import 'package:face_graph_test/ui/chairs_page.dart';
import 'package:flutter/material.dart';

import 'helper/app_colors.dart';
import 'utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FaceGraph -- Mohamad Allahham',
        theme:
            ThemeData(primaryColor: primaryColor1, primarySwatch: Colors.blue),
        initialRoute: ChairsPage.route,
        onGenerateRoute: AppRouter.generateRoute,
        debugShowCheckedModeBanner: false);
  }
}

/**/
