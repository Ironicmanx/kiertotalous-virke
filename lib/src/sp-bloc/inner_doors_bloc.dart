import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'inner_doors_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/log.dart';

class SPInnerDoorsBloc
    extends Bloc<SPInnerDoorsEvent, SmallPropertyInnerDoors> {
  SPInnerDoorsBloc()
      : super(SmallPropertyInnerDoors(
          woodenDoor: DoorsInfo(),
          panelDoor: DoorsInfo(),
          areDoorsRecyclable: false,
        )) {
    on<SPInnerShutWoodenDoorsChanged>((event, emit) {
      emit(state.copyWith(
        woodenDoor: state.woodenDoor!.copyWith(shutDoors: event.value),
      ));
      logger.d(
          "SPInnerDoorsBloc.woodenDoor.shutDoors changed to: ${event.value}");
    });
    on<SPInnerGlassWoodenDoorsChanged>((event, emit) {
      emit(state.copyWith(
        woodenDoor: state.woodenDoor!.copyWith(glassDoors: event.value),
      ));
      logger.d(
          "SPInnerDoorsBloc.woodenDoor.glassDoors changed to: ${event.value}");
    });
    on<SPInnerShutPanelDoorsChanged>((event, emit) {
      emit(state.copyWith(
        panelDoor: state.panelDoor!.copyWith(shutDoors: event.value),
      ));
      logger
          .d("SPInnerDoorsBloc.panelDoor.shutDoors changed to: ${event.value}");
    });
    on<SPInnerGlassPanelDoorsChanged>((event, emit) {
      emit(state.copyWith(
        panelDoor: state.panelDoor!.copyWith(glassDoors: event.value),
      ));
      logger.d(
          "SPInnerDoorsBloc.panelDoor.glassDoors changed to: ${event.value}");
    });
    on<SPInnerDoorsAreDoorsRecyclableChanged>((event, emit) {
      emit(state.copyWith(areDoorsRecyclable: event.value));
      logger
          .d("SPInnerDoorsBloc.areDoorsRecyclable changed to: ${event.value}");
    });
  }
}
