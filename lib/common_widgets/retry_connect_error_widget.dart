
import 'package:face_graph_test/helper/size_config.dart';
import 'package:face_graph_test/model/app_models/error_model.dart';
import 'package:flutter/material.dart';

class RetryConnectErrorWidget extends StatelessWidget {
  final ErrorModel errorModel;
  final double maxHeight;
  final TextStyle? textStyle;

  const RetryConnectErrorWidget(
      {Key? key,
      required this.errorModel,
      required this.maxHeight,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double size = SizeConfig().h(200);
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: maxHeight),
        child: Center(
            child: Column(
          children: [
            Container(
              height: size,
              width: size*2,
              decoration: BoxDecoration(
                  image: DecorationImage(fit: BoxFit.fill,
                      image: AssetImage("assets/" + getImagePath()))),
              margin: EdgeInsets.only(bottom: SizeConfig().h(15)),
            ),
            Text(errorModel.errorValue, style: textStyle),
          ],
        )),
      ),
    );
  }

  String getImagePath() {
    switch (errorModel.errorType) {
      case ErrorType.itemNotFound:
        return "no_items_found.png";
      case ErrorType.noItemsError:
        return "no_items_found.png";
      default:
        return "something_error.png";
    }
  }
}
