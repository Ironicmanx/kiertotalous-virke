import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'outer_doors_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/log.dart';

class SPOuterDoorsBloc
    extends Bloc<SPOuterDoorsEvent, SmallPropertyOuterDoors> {
  SPOuterDoorsBloc()
      : super(SmallPropertyOuterDoors(
          woodenDoor: DoorsInfo(),
          aluminiumDoor: DoorsInfo(),
          steelDoor: DoorsInfo(),
          areDoorsRecyclable: false,
        )) {
    on<SPOuterShutWoodenDoorsChanged>((event, emit) {
      emit(state.copyWith(
          woodenDoor: state.woodenDoor!.copyWith(shutDoors: event.value)));
      logger.d(
          "SPOuterDoorsBloc.woodenDoor.shutDoors changed to: ${event.value}");
    });
    on<SPOuterGlassWoodenDoorsChanged>((event, emit) {
      emit(state.copyWith(
          woodenDoor: state.woodenDoor!.copyWith(glassDoors: event.value)));
      logger.d(
          "SPOuterDoorsBloc.woodenDoor.glassDoors changed to: ${event.value}");
    });
    on<SPOuterShutAluminiumDoorsChanged>((event, emit) {
      emit(state.copyWith(
          aluminiumDoor:
              state.aluminiumDoor!.copyWith(shutDoors: event.value)));
      logger.d(
          "SPOuterDoorsBloc.aluminiumDoor.shutDoors changed to: ${event.value}");
    });
    on<SPOuterGlassAluminiumDoorsChanged>((event, emit) {
      emit(state.copyWith(
          aluminiumDoor:
              state.aluminiumDoor!.copyWith(glassDoors: event.value)));
      logger.d(
          "SPOuterDoorsBloc.aluminiumDoor.glassDoors changed to: ${event.value}");
    });
    on<SPOuterShutSteelDoorsChanged>((event, emit) {
      emit(state.copyWith(
          steelDoor: state.steelDoor!.copyWith(shutDoors: event.value)));
      logger
          .d("SPOuterDoorsBloc.steelDoor.shutDoors changed to: ${event.value}");
    });
    on<SPOuterGlassSteelDoorsChanged>((event, emit) {
      emit(state.copyWith(
          steelDoor: state.steelDoor!.copyWith(glassDoors: event.value)));
      logger.d(
          "SPOuterDoorsBloc.steelDoor.glassDoors changed to: ${event.value}");
    });
    on<SPAreDoorsRecyclableChanged>((event, emit) {
      emit(state.copyWith(areDoorsRecyclable: event.value));
      logger
          .d("SPOuterDoorsBloc.areDoorsRecyclable changed to: ${event.value}");
    });
  }
}
