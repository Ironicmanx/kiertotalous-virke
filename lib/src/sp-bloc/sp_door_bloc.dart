import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/sp-bloc/hall_doors_bloc.dart';
import 'package:flutter_app/src/sp-bloc/passage_doors_bloc.dart';
import 'package:flutter_app/src/sp-bloc/sp_door_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/log.dart';

class SpDoorBloc extends Bloc<SpDoorEvent, SpDoorsState> {
  final PassageDoorsBloc passageDoorsBloc;
  final HallDoorsBloc hallDoorsBloc;
  SpDoorBloc({
    required this.passageDoorsBloc,
    required this.hallDoorsBloc,
  }) : super(
          SpDoorsState(
            passageDoors: passageDoorsBloc.state,
            hallDoors: hallDoorsBloc.state,
          ),
        ) {
    on<PassageDoorsChanged>((event, emit) {
      emit(state.copyWith(passageDoors: event.passageDoors));
      logger.d("SpDoorsState.passageDoors changed to: ${event.passageDoors}");
    });

    on<HallDoorsChanged>((event, emit) {
      emit(state.copyWith(hallDoors: event.hallDoors));
      logger.d("SpDoorsState.hallDoors changed to: ${event.hallDoors}");
    });

    // listen to other sp door blocs
    passageDoorsBloc.stream.listen((passageDoorsState) {
      add(PassageDoorsChanged(passageDoorsState));
    });
    hallDoorsBloc.stream.listen((hallDoorsState) {
      add(HallDoorsChanged(hallDoorsState));
    });
  }
}

class SpDoorsState {
  final PassageDoors passageDoors;
  final HallDoors hallDoors;

  SpDoorsState({
    required this.passageDoors,
    required this.hallDoors,
  });

  SpDoorsState copyWith({
    PassageDoors? passageDoors,
    HallDoors? hallDoors,
  }) {
    return SpDoorsState(
      passageDoors: passageDoors ?? this.passageDoors,
      hallDoors: hallDoors ?? this.hallDoors,
    );
  }
}
