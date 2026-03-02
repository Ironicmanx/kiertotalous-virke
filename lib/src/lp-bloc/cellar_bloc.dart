import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/lp-bloc/cellar_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CellarBloc extends Bloc<CellarEvent, Cellar> {
  CellarBloc() : super(Cellar()) {
    on<CellarMaterialChanged>((event, emit) {
      logger.d("CellarMaterialChanged fired");
      emit(state.copyWith(exteriorWallsMaterial: event.material));
    });

    on<CellarFloorAreaChanged>((event, emit) {
      logger.d("CellarFloorAreaChanged fired");
      emit(state.copyWith(floorArea: event.value));
    });

    on<CellarPerimeterChanged>((event, emit) {
      logger.d("CellarPerimeterChanged fired");
      emit(state.copyWith(exteriorWallsPerimeter: event.value));
    });

    on<CellarWallHeightChanged>((event, emit) {
      logger.d("CellarWallHeightChanged fired");
      emit(state.copyWith(wallHeight: event.value));
    });
  }
}
