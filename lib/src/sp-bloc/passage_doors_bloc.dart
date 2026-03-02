import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/sp-bloc/passage_doors_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PassageDoorsBloc extends Bloc<PassageDoorsEvent, PassageDoors> {
  PassageDoorsBloc()
      : super(PassageDoors(
          woodenDoor: DoorsInfo(),
          aluminiumDoor: DoorsInfo(),
          steelDoor: DoorsInfo(),
        )) {
    on<PassageShutWoodenDoorsChanged>((event, emit) {
      emit(
        state.copyWith.woodenDoor!(
          shutDoors: event.value,
        ),
      );
      logger.d("PassageDoorsBloc.woodenDoor.shutDoors: ${event.value}");
    });
    on<PassageGlassWoodenDoorsChanged>((event, emit) {
      emit(
        state.copyWith.woodenDoor!(
          glassDoors: event.value,
        ),
      );
      logger.d("PassageDoorsBloc.woodenDoor.glassDoors: ${event.value}");
    });
    on<PassageShutAluminiumDoorsChanged>((event, emit) {
      emit(
        state.copyWith.aluminiumDoor!(
          shutDoors: event.value,
        ),
      );
      logger.d("PassageDoorsBloc.aluminiumDoor.shutDoors: ${event.value}");
    });
    on<PassageGlassAluminiumDoorsChanged>((event, emit) {
      emit(
        state.copyWith.aluminiumDoor!(
          glassDoors: event.value,
        ),
      );
      logger.d("PassageDoorsBloc.aluminiumDoor.glassDoors: ${event.value}");
    });
    on<PassageShutSteelDoorsChanged>((event, emit) {
      emit(
        state.copyWith.steelDoor!(
          shutDoors: event.value,
        ),
      );
      logger.d("PassageDoorsBloc.steelDoor.shutDoors: ${event.value}");
    });
    on<PassageGlassSteelDoorsChanged>((event, emit) {
      emit(
        state.copyWith.steelDoor!(
          glassDoors: event.value,
        ),
      );
      logger.d("PassageDoorsBloc.steelDoor.glassDoors: ${event.value}");
    });
    on<PassageAreDoorsRecyclableChanged>((event, emit) {
      emit(
        state.copyWith(
          doorsRecyclable: event.value,
        ),
      );
      logger.d("PassageDoorsBloc.doorsRecyclable: ${event.value}");
    });
  }
}
