import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/sp-bloc/hall_doors_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/log.dart';

class HallDoorsBloc extends Bloc<HallDoorsEvent, HallDoors> {
  HallDoorsBloc() : super(HallDoors()) {
    on<WoodenDoorsChanged>((event, emit) {
      emit(
        state.copyWith(
          woodenDoors: event.value,
        ),
      );
      logger.d("HallDoorsBloc.woodenDoors: ${event.value}");
    });
    on<AluminiumDoorsChanged>((event, emit) {
      emit(
        state.copyWith(
          aluminiumDoors: event.value,
        ),
      );
      logger.d("HallDoorsBloc.aluminiumDoors: ${event.value}");
    });
    on<SteelDoorsChanged>((event, emit) {
      emit(
        state.copyWith(
          steelDoors: event.value,
        ),
      );
      logger.d("HallDoorsBloc.steelDoors: ${event.value}");
    });
    on<AreHallDoorsRecyclableChanged>((event, emit) {
      emit(
        state.copyWith(
          areHallDoorsRecyclable: event.value,
        ),
      );
      logger.d("HallDoorsBloc.areHallDoorsRecyclable: ${event.value}");
    });
  }
}
