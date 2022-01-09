import 'package:equatable/equatable.dart';
import 'package:face_graph_test/database/database.dart';

abstract class ChairEvent extends Equatable {
  const ChairEvent();

  @override
  List<Object?> get props => [];
}

class InitEvent extends ChairEvent {
  const InitEvent();
}

class GetAllChairsEvent extends ChairEvent {
  const GetAllChairsEvent();
}

class UpdateChairEvent extends ChairEvent {
  final Chair chair;

  const UpdateChairEvent(this.chair);

  @override
  List<Object?> get props => [chair];
}

class AddNewChairEvent extends ChairEvent {
  final Chair chair;

  const AddNewChairEvent(this.chair);

  @override
  List<Object?> get props => [chair];
}

class DeleteChairEvent extends ChairEvent {
  final Chair chair;

  const DeleteChairEvent(this.chair);

  @override
  List<Object?> get props => [chair];
}
