import 'package:bloc/bloc.dart';
import 'package:face_graph_test/database/database.dart';
import 'package:face_graph_test/model/app_models/error_model.dart';

import 'event.dart';
import 'state.dart';

class ChairBloc extends Bloc<ChairEvent, ChairState> {
  ChairBloc() : super(const InitState());
  final AppDatabase database = AppDatabase();

  @override
  Stream<ChairState> mapEventToState(ChairEvent event) async* {
    if (event is InitEvent) {
      yield const InitState();
    } else if (event is GetAllChairsEvent) {
      yield* _getAllChairs();
    } else if (event is UpdateChairEvent) {
      yield* _updateChair(event.chair);
    } else if (event is AddNewChairEvent) {
      yield* _addNewChair(event.chair);
    } else if (event is DeleteChairEvent) {
      yield* _deleteChair(event.chair);
    }
  }

  Stream<ChairState> _getAllChairs() async* {
    yield const LoadingState();
    var chairs = await database.getAllChairs();
    if (chairs.isNotEmpty) {
      yield AllChairsLoadedState(chairs);
    } else {
      yield const ErrorState(
          ErrorModel(
              errorType: ErrorType.noItemsError,
              errorValue: "There is no chairs found!"),
          showToast: false);
    }
  }

  Stream<ChairState> _updateChair(Chair chair) async* {
    yield const LoadingState();
    bool updated = await database.updateChair(chair);
    if (updated) {
      yield ChairUpdatedState(updated);
    } else {
      yield const ErrorState(ErrorModel(
          errorType: ErrorType.itemNotFound, errorValue: "Chair Not Found!"));
    }
  }

  Stream<ChairState> _addNewChair(Chair chair) async* {
    yield const LoadingState();
    int id = await database.insertChair(chair);
    if (id > 0) {
      yield NewChairAddedState(id);
    } else {
      yield const ErrorState(ErrorModel(
          errorType: ErrorType.other, errorValue: "Something is error!"));
    }
  }

  Stream<ChairState> _deleteChair(Chair chair) async* {
    yield const LoadingState();
    int id = await database.deleteChair(chair);
    if (id > 0) {
      yield ChairDeletedState(id);
    } else {
      yield const ErrorState(ErrorModel(
          errorType: ErrorType.other, errorValue: "Something is error!"));
    }
  }
}
