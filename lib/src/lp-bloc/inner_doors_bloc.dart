import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/lp-bloc/inner_doors_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/log.dart';

class InnerDoorsBloc extends Bloc<InnerDoorsEvent, InnerDoors> {
  InnerDoorsBloc()
      : super(InnerDoors(
          panelDoors: DoorsInfo(),
          woodenDoors: DoorsInfo(),
          fireDoors: DoorsInfo(),
        )) {
    // Handle the change of recyclability of inner doors
    on<InnerDoorRecyclableChanged>((event, emit) {
      logger.d("InnerDoorRecyclableChanged: ${event.value}");
      emit(
        state.copyWith(areDoorsRecyclable: event.value),
      );
    });

    on<InnerShutPanelDoorsChanged>((event, emit) {
      emit(state.copyWith.panelDoors!(shutDoors: event.value));
      logger.d("InnerDoors.panelDoors.shutDoors changed to ${event.value}");
    });

    on<InnerGlassPanelDoorsChanged>((event, emit) {
      emit(state.copyWith.panelDoors!(glassDoors: event.value));
      logger.d("InnerDoors.panelDoors.glassDoors changed to ${event.value}");
    });

    on<InnerShutWoodenDoorsChanged>((event, emit) {
      emit(state.copyWith.woodenDoors!(shutDoors: event.value));
      logger.d("InnerDoors.woodenDoors.shutDoors changed to ${event.value}");
    });

    on<InnerGlassWoodenDoorsChanged>((event, emit) {
      emit(state.copyWith.woodenDoors!(glassDoors: event.value));
      logger.d("InnerDoors.woodenDoors.glassDoors changed to ${event.value}");
    });

    on<InnerShutFireDoorsChanged>((event, emit) {
      emit(state.copyWith.fireDoors!(shutDoors: event.value));
      logger.d("InnerDoors.fireDoors.shutDoors changed to ${event.value}");
    });

    on<InnerGlassFireDoorsChanged>((event, emit) {
      emit(state.copyWith.fireDoors!(glassDoors: event.value));
      logger.d("InnerDoors.fireDoors.glassDoors changed to ${event.value}");
    });
  }
}
