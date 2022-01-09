import 'package:face_graph_test/helper/const_sizes.dart';
import 'package:face_graph_test/helper/const_styles.dart';
import 'package:face_graph_test/helper/font_styles.dart';
import 'package:face_graph_test/helper/size_config.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String? hintText;
  final String aboveTitle;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final TextInputType? textInputType;


  const CustomTextFieldWidget(
      {Key? key,
      this.hintText,
      required this.controller,
      this.textInputAction,
      this.focusNode,
      this.onFieldSubmitted,
      this.textInputType,
      required this.aboveTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool?> showError = ValueNotifier<bool?>(null);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(aboveTitle, style: smallPrimaryColor2()),
      Padding(
        padding:
            EdgeInsets.only(top: SizeConfig().h(6), bottom: SizeConfig().h(14)),
        child: ValueListenableBuilder<bool?>(
            valueListenable: showError,
            builder: (BuildContext context, value, Widget? child) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: SizeConfig().h(47),
                        decoration: BoxDecoration(
                            borderRadius: radiusAll14, color: Colors.white),
                        child: TextFormField(
                            controller: controller,
                            cursorColor: Colors.black,
                            focusNode: focusNode,
                            textInputAction: textInputAction,
                            keyboardType: textInputType,
                            style: largeMediumPrimaryColor2(),
                            maxLines: 1,
                            onFieldSubmitted: onFieldSubmitted,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: radiusAll14,
                                ),
                                errorStyle: const TextStyle(color: Colors.red),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: showError.value == null
                                            ? Colors.amber
                                            : showError.value == true
                                                ? Colors.red
                                                : Colors.green,
                                        width: width1),
                                    borderRadius: radiusAll14),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: showError.value == null
                                            ? const Color(0xffd8e0e5)
                                            : showError.value == true
                                                ? Colors.red
                                                : Colors.green,
                                        width: width1),
                                    borderRadius: radiusAll14),
                                hintStyle: smallCustomGreyColor(),
                                contentPadding: EdgeInsets.symmetric(horizontal: SizeConfig().w(15)),
                                hintText: hintText),
                            onChanged: (_) {
                              showError.value = controller.text.isEmpty;
                            })),
                    if (value != null && value)
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig().w(10)),
                          child: Text("You should fill this field",
                              style: errorStyle()))
                  ]);
            }),
      ),
    ]);
  }
}
