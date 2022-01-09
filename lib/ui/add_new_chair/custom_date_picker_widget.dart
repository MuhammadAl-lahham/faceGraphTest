import 'package:face_graph_test/helper/const_sizes.dart';
import 'package:face_graph_test/helper/const_styles.dart';
import 'package:face_graph_test/helper/font_styles.dart';
import 'package:face_graph_test/helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomDatePickerWidget extends StatefulWidget {
  final DateRangePickerController controller;

  const CustomDatePickerWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  _CustomDatePickerWidgetState createState() => _CustomDatePickerWidgetState();
}

class _CustomDatePickerWidgetState extends State<CustomDatePickerWidget> {
  var selectedTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Date", style: smallPrimaryColor2()),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => Dialog(
                    insetPadding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    child: SizedBox(
                        height: SizeConfig().h(300),
                        width: SizeConfig().w(200),
                        child: SfDateRangePicker(
                            backgroundColor: Colors.white,
                            selectionMode: DateRangePickerSelectionMode.single,
                            initialSelectedDate: selectedTime,
                            maxDate: DateTime(2040),
                            minDate: DateTime.now(),
                            onCancel: () {
                              Navigator.pop(context);
                            },
                            onSelectionChanged: (neDate) {
                              setState(() {
                                selectedTime = widget.controller.selectedDate!;
                              });
                            },
                            allowViewNavigation: true,
                            controller: widget.controller,
                            onSubmit: (newDAte) {
                              setState(() {
                                selectedTime = newDAte as DateTime;
                              });
                            }))));
          },
          child: Container(
            height: SizeConfig().h(47),
            padding: EdgeInsets.symmetric(horizontal: SizeConfig().w(15)),
            decoration: BoxDecoration(
                borderRadius: radiusAll14,
                color: Colors.white,
                border:
                    Border.all(width: width1, color: const Color(0xffd8e0e5))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${selectedTime.year}-${selectedTime.month}-${selectedTime.day}",
                    style: largeMediumPrimaryColor2()),
                SizedBox(
                    height: SizeConfig().h(20),
                    width: SizeConfig().h(20),
                    child: SvgPicture.asset('assets/svg/date_picker.svg',
                        fit: BoxFit.contain))
              ],
            ),
          ),
        )
      ],
    );
  }
}
