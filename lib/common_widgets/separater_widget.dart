import 'package:face_graph_test/helper/size_config.dart';
import 'package:flutter/material.dart';

class SeparaterWidget extends StatelessWidget {
  const SeparaterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: SizeConfig().h(10));
  }
}
