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

class EditChairInfoPage extends StatelessWidget {
  static const route = "/EditChairInfoPage";

  final Chair chair;

  const EditChairInfoPage({Key? key, required this.chair})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
      ChairBloc()
        ..add(const GetAllChairsEvent()),
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
          }
        },
        child: _BuildUi(bloc: bloc, chair: chair));
  }
}

class _BuildUi extends StatelessWidget {
  final ChairBloc bloc;
  final Chair chair;

  const _BuildUi({Key? key, required this.bloc, required this.chair})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController =
    TextEditingController(text: chair.title);
    final descriptionController =
    TextEditingController(text: chair.description ?? '');
    final dateController = DateRangePickerController();
    final ImagePicker _picker = ImagePicker();

    ValueNotifier<XFile?> image = ValueNotifier<XFile?>(
        chair.picture != null
            ? XFile(chair.picture!)
            : null);
    dateController.selectedDate = chair.date;

    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is LoadingState) {
              return const CustomLoading();
            } else {
              return Text(
                  "Edit ${chair.title}");
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
                  builder: (_, XFile? value, ___) =>
                      CircleAvatar(
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
                      bloc.add(UpdateChairEvent(Chair(
                        date: dateController.selectedDate!,
                        id: chair.id,
                        description: descriptionController.text,
                        status: chair.status,
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
                    child: Text(
                        "Edit ${chair.title}",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
