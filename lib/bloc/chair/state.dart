import 'package:equatable/equatable.dart';
import 'package:face_graph_test/database/database.dart';
import 'package:face_graph_test/model/app_models/error_model.dart';

abstract class ChairState extends Equatable {
  const ChairState();

  @override
  List<Object?> get props => [];
}

class InitState extends ChairState {
  const InitState();
}

class ErrorState extends ChairState {
  final ErrorModel error;
  final bool showToast;

  const ErrorState(this.error, {this.showToast = true});

  @override
  List<Object?> get props => [error,showToast];
}

class LoadingState extends ChairState{
  const LoadingState();
}

class AllChairsLoadedState extends ChairState {
  final List<Chair> chairs;

  const AllChairsLoadedState(this.chairs);

  @override
  List<Object?> get props => [chairs];
}

class ChairUpdatedState extends ChairState {
  final bool updated;

  const ChairUpdatedState(this.updated);

  @override
  List<Object?> get props => [updated];
}

class NewChairAddedState extends ChairState {
  final int id;

  const NewChairAddedState(this.id);

  @override
  List<Object?> get props => [id];
}

class ChairDeletedState extends ChairState {
  final int id;

  const ChairDeletedState(this.id);

  @override
  List<Object?> get props => [id];
}


