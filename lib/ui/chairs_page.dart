import 'dart:io';

import 'package:face_graph_test/bloc/chair/bloc.dart';
import 'package:face_graph_test/bloc/chair/event.dart';
import 'package:face_graph_test/bloc/chair/state.dart';
import 'package:face_graph_test/common_widgets/custom_loading.dart';
import 'package:face_graph_test/common_widgets/retry_connect_error_widget.dart';
import 'package:face_graph_test/common_widgets/separater_widget.dart';
import 'package:face_graph_test/database/database.dart';
import 'package:face_graph_test/helper/app_colors.dart';
import 'package:face_graph_test/helper/const_styles.dart';
import 'package:face_graph_test/helper/font_styles.dart';
import 'package:face_graph_test/helper/size_config.dart';
import 'package:face_graph_test/helper/toast.dart';
import 'package:face_graph_test/ui/add_new_chair/edit_chair_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_new_chair/add_new_chair_page.dart';

class ChairsPage extends StatelessWidget {
  static const route = "/";

  const ChairsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
          } else if (state is ChairDeletedState) {
            bloc.add(const GetAllChairsEvent());
            pushToast("The chair is deleted successfully!");
          }
        },
        child: _UIBuilder(bloc: bloc));
  }
}

class _UIBuilder extends StatelessWidget {
  final ChairBloc bloc;

  const _UIBuilder({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? lengthValue;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text("All chairs page"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddNewChairPage.route,
                arguments: lengthValue ?? 0);
          },
          tooltip: 'AddNewItem',
          child: const Icon(Icons.add),
        ),
        body: LayoutBuilder(
          builder: (_, constrained) => RefreshIndicator(
            onRefresh: () async {
              bloc.add(const GetAllChairsEvent());
            },
            child: Padding(
              padding: EdgeInsets.all(SizeConfig().h(7)),
              child: BlocBuilder(
                  bloc: bloc,
                  builder: (_, ChairState state) {
                    if (state is LoadingState) {
                      return const CustomLoading();
                    } else if (state is AllChairsLoadedState &&
                        state.chairs.isNotEmpty) {
                      var chairs = state.chairs;
                      lengthValue = chairs.length;
                      return ListView.separated(
                          cacheExtent: SizeConfig().h(58),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          itemBuilder: (_, index) =>
                              ChairWidget(chair: chairs[index], bloc: bloc),
                          separatorBuilder: (_, __) => const SeparaterWidget(),
                          itemCount: chairs.length);
                    } else if (state is ErrorState) {
                      return RetryConnectErrorWidget(
                          maxHeight: constrained.maxHeight,
                          errorModel: state.error);
                    } else {
                      return const Center(child: Text("Please wait!!"));
                    }
                  }),
            ),
          ),
        ));
  }
}

class ChairWidget extends StatelessWidget {
  final Chair chair;
  final ChairBloc bloc;

  const ChairWidget({Key? key, required this.chair, required this.bloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customHeight = SizeConfig().h(126);
    final customWidth = SizeConfig().w(140);
    const placeHolder = "";
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, EditChairInfoPage.route, arguments: chair);
      },
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Text(
                      'Are you sure you want to delete this chair: ${chair.title}?'),
                  actions: <Widget>[
                    InkWell(
                        child: Container(
                            height: SizeConfig().h(30),
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig().h(30)),
                            decoration: BoxDecoration(
                                color: primaryColor1,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              'Yes',
                              style: TextStyle(color: Colors.white),
                            )),
                        onTap: () {
                          Navigator.pop(context);
                          bloc.add(DeleteChairEvent(chair));
                        }),
                    InkWell(
                        child: const Text('No'),
                        onTap: () => Navigator.pop(context)),
                  ],
                ));
      },
      child: Container(
          height: SizeConfig().h(139),
          padding: EdgeInsets.only(bottom: SizeConfig().h(13)),
          color: Colors.white,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: radiusAll20,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.file(
                      File(chair.picture ?? ''),
                      height: customHeight,
                      width: customWidth,
                      fit: BoxFit.fill,
                      errorBuilder: (_, __, ___) => Container(
                        height: customHeight,
                        width: customWidth,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill, image: AssetImage(placeHolder)),
                        ),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig().w(16)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(chair.title,
                            style: largeMediumPrimaryColor2(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1),
                        Text(chair.description!,
                            style: largeMediumPrimaryColor2(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2),
                        Text(
                            "${chair.date.year}-${chair.date.month}-${chair.date.day}",
                            style: largePrimaryColor1(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1)
                      ]),
                )
              ])),
    );
  }
}
