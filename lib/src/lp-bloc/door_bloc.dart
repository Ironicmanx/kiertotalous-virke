import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/lp-bloc/inner_doors_bloc.dart';
import 'package:flutter_app/src/lp-bloc/outer_doors_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/log.dart';
import 'door_event.dart';

class DoorBloc extends Bloc<DoorsEvent, DoorsState> {
  final InnerDoorsBloc innerDoorsBloc;
  final OuterDoorsBloc outerDoorsBloc;
  DoorBloc(
    this.innerDoorsBloc,
    this.outerDoorsBloc,
  ) : super(
          DoorsState(
            innerDoors: innerDoorsBloc.state,
            outerDoors: outerDoorsBloc.state,
          ),
        ) {
    on<InnerDoorsChanged>((event, emit) {
      emit(state.copyWith(innerDoors: event.innerDoors));
      logger.d("DoorsState.innerDoors changed to: ${event.innerDoors}");
    });

    on<OuterDoorsChanged>((event, emit) {
      emit(state.copyWith(outerDoors: event.outerDoors));
      logger.d("DoorsState.outerDoors changed to: ${event.outerDoors}");
    });

    // listen to door blocs
    innerDoorsBloc.stream.listen((innerDoorsState) {
      add(InnerDoorsChanged(innerDoorsState));
    });
    outerDoorsBloc.stream.listen((outerdoorsState) {
      add(OuterDoorsChanged(outerdoorsState));
    });
  }
}

class DoorsState {
  final InnerDoors innerDoors;
  final OuterDoors outerDoors;

  DoorsState({required this.innerDoors, required this.outerDoors});

  DoorsState copyWith({InnerDoors? innerDoors, OuterDoors? outerDoors}) {
    return DoorsState(
      innerDoors: innerDoors ?? this.innerDoors,
      outerDoors: outerDoors ?? this.outerDoors,
    );
  }
}
