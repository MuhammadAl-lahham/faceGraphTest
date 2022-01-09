import 'dart:io';

import 'package:face_graph_test/bloc/chair/bloc.dart';
import 'package:face_graph_test/bloc/chair/event.dart';
import 'package:face_graph_test/bloc/chair/state.dart';
import 'package:face_graph_test/common_widgets/custom_loading.dart';
import 'package:face_graph_test/common_widgets/custom_textfield_widget.dart';
import 'package:face_graph_test/database/database.dart';
import 'package:face_graph_test/helper/app_colors.dart';
import 'package:face_graph_test/helper/size_config.dart';
import 'package:face_graph_test/helper/toast.dart';
import 'package:face_graph_test/ui/add_new_chair/custom_date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddNewChairPage extends StatelessWidget {
  static const route = "/AddNewChairPage";

  final int lengthValue;

  const AddNewChairPage({Key? key, required this.lengthValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ChairBloc()..add(const GetAllChairsEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<ChairBloc>(context);

    return BlocListener(
        bloc: bloc,
        listener: (context, ChairState state) {
          if (state is ErrorState && state.showToast) {
            pushToast(state.error.errorValue);
          } else if (state is NewChairAddedState) {
            pushToast("The chair is added successfully!");
            Navigator.popUntil(context, (route) => route.isFirst);
          }
        },
        child: _BuildUi(bloc: bloc, lengthValue: lengthValue));
  }
}

class _BuildUi extends StatelessWidget {
  final ChairBloc bloc;
  final int lengthValue;

  const _BuildUi({Key? key, required this.bloc, required this.lengthValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final dateController = DateRangePickerController();
    final ImagePicker _picker = ImagePicker();

    ValueNotifier<XFile?> image = ValueNotifier<XFile?>(null);

    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is LoadingState) {
              return const CustomLoading();
            } else {
              return const Text("Add new item");
            }
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(SizeConfig().h(10)),
          child: Column(
            children: [
              InkResponse(
                onTap: () async {
                  image.value =
                      await _picker.pickImage(source: ImageSource.camera);
                },
                child: ValueListenableBuilder(
                  valueListenable: image,
                  builder: (_, XFile? value, ___) => CircleAvatar(
                    radius: SizeConfig().h(70),
                    backgroundImage:
                        value != null ? FileImage(File(value.path)) : null,
                    child: image.value == null
                        ? SvgPicture.asset('assets/svg/camera.svg')
                        : null,
                  ),
                ),
              ),
              CustomTextFieldWidget(
                  controller: titleController, aboveTitle: "Title"),
              CustomTextFieldWidget(
                  controller: descriptionController, aboveTitle: "Description"),
              CustomDatePickerWidget(controller: dateController),
              SizedBox(height: SizeConfig().h(40)),
              InkWell(
                  onTap: () {
                    bloc.add(AddNewChairEvent(Chair(
                      date: dateController.selectedDate!,
                      id: lengthValue + 1,
                      description: descriptionController.text,
                      status: true,
                      picture: image.value!.path,
                      title: titleController.text,
                    )));
                  },
                  child: Container(
                    height: SizeConfig().h(60),
                    margin: EdgeInsets.all(SizeConfig().h(5)),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: primaryColor1,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text("Add new chair",
                        style: TextStyle(color: Colors.white)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
