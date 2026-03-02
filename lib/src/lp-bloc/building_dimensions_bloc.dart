import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/lp-bloc/building_dimensions_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildingDimensionsBloc
    extends Bloc<BuildingDimensionsEvent, BuildingDimensions> {
  BuildingDimensionsBloc() : super(BuildingDimensions()) {
    on<GrossFloorAreaChanged>((event, emit) {
      emit(state.copyWith(grossFloorArea: event.value));
      logger.d("BuildingDimensions.grossFloorArea: ${event.value}");
    });
    on<VolumeChanged>((event, emit) {
      emit(state.copyWith(volume: event.value));
      logger.d("BuildingDimensions.volume: ${event.value}");
    });
    on<FloorCountExcludingCellarsChanged>((event, emit) {
      emit(state.copyWith(floorCountExcludingCellars: event.value));
      logger.d("BuildingDimensions.floorCountExcludingCellars: ${event.value}");
    });
    on<AverageAreaChanged>((event, emit) {
      emit(state.copyWith(averageArea: event.value));
      logger.d("BuildingDimensions.averageArea: ${event.value}");
    });
  }
}
