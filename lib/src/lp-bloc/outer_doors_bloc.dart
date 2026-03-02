import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/lp-bloc/outer_doors_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/log.dart';

class OuterDoorsBloc extends Bloc<OuterDoorsEvent, OuterDoors> {
  OuterDoorsBloc()
      : super(
          OuterDoors(
            woodenDoors: DoorsInfo(),
            aluminiumDoors: DoorsInfo(),
            steelDoors: DoorsInfo(),
          ),
        ) {
    on<OuterShutWoodenDoorsChanged>((event, emit) {
      emit(
        state.copyWith.woodenDoors!(shutDoors: event.value),
      );
      logger.d("OuterDoors.woodenDoors.shutDoors changed to: ${event.value}");
    });

    on<OuterGlassWoodenDoorsChanged>((event, emit) {
      emit(
        state.copyWith.woodenDoors!(glassDoors: event.value),
      );
      logger
          .d("OAluminiumors.woodenDoors.glassDoors changed to: ${event.value}");
    });
    on<OuterShutAluminiumDoorsChanged>((event, emit) {
      emit(
        state.copyWith.aluminiumDoors!(shutDoors: event.value),
      );
      logger
          .d("OuterDoors.aluminiumDoors.shutDoors changed to: ${event.value}");
    });
    on<OuterGlassAluminiumDoorsChanged>((event, emit) {
      emit(
        state.copyWith.aluminiumDoors!(glassDoors: event.value),
      );
      logger
          .d("OuterDoors.aluminiumDoors.glassDoors changed to: ${event.value}");
    });
    on<OuterShutSteelDoorsChanged>((event, emit) {
      emit(
        state.copyWith.steelDoors!(shutDoors: event.value),
      );
      logger.d("OuterDoors.steelDoors.shutDoors changed to: ${event.value}");
    });
    on<OuterGlassSteelDoorsChanged>((event, emit) {
      emit(
        state.copyWith.steelDoors!(glassDoors: event.value),
      );
      logger.d("OuterDoors.steelDoors.glassDoors changed to: ${event.value}");
    });

    on<OuterAccessAndLoadingDoorsChanged>((event, emit) {
      emit(state.copyWith(accessAndLoadingDoors: event.value));
      logger.d("OuterDoors.accessAndLoadingDoors changed to ${event.value}");
    });

    on<OuterAreDoorsRecyclableChanged>((event, emit) {
      emit(state.copyWith(areDoorsRecyclable: event.value));
      logger.d("OuterDoors.areDoorsRecyclable changed to ${event.value}");
    });
  }
}
