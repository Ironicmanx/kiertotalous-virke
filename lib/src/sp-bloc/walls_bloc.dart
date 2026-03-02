import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/sp-bloc/walls_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WallsBloc extends Bloc<WallsEvent, Walls> {
  WallsBloc() : super(Walls()) {
    // Recyclable events
    on<TrunkWoodRecyclableChanged>((event, emit) {
      logger.d("TrunkWoodRecyclableChanged fired");
      emit(state.copyWith(isTrunkWoodRecyclable: event.value));
    });

    on<InsulationWoolRecyclableChanged>((event, emit) {
      logger.d("InsulationWoolRecyclableChanged fired");
      emit(state.copyWith(isInsulationWoolRecyclable: event.value));
    });

    on<AggregateRecyclableChanged>((event, emit) {
      logger.d("AggregateRecyclableChanged fired");
      emit(state.copyWith(isAggregateRecyclable: event.value));
    });

    // Measurement events
    on<LengthInMetersChanged>((event, emit) {
      logger.d("LengthInMetersChanged fired");
      emit(state.copyWith(lengthInMeters: event.value));
    });

    on<WidthInMetersChanged>((event, emit) {
      logger.d("WidthInMetersChanged fired");
      emit(state.copyWith(widthInMeters: event.value));
    });

    on<HeightInMetersChanged>((event, emit) {
      logger.d("HeightInMetersChanged fired");
      emit(state.copyWith(heightInMeters: event.value));
    });

    on<StoneOrBrickWallsChanged>((event, emit) {
      logger.d("StoneOrBrickWallsChanged fired");
      emit(state.copyWith(stoneOrBrickWallsInLinearMeters: event.value));
    });

    // Material selection events
    on<WoodMaterialTypeChanged>((event, emit) {
      logger.d("WoodMaterialTypeChanged fired");
      emit(state.copyWith(woodMaterialType: event.value));
    });

    on<WallMaterialChanged>((event, emit) {
      logger.d("WallMaterialChanged fired");
      emit(state.copyWith(wallMaterial: event.value));
    });

    on<InsulationMaterialThicknessChanged>((event, emit) {
      logger.d("InsulationMaterialThicknessChanged fired");
      emit(state.copyWith(insulationMaterialThickness: event.value));
    });

    on<OuterWallSurfaceMaterialChanged>((event, emit) {
      logger.d("OuterWallSurfaceMaterialChanged fired");
      emit(state.copyWith(outerWallSurfaceMaterial: event.value));
    });
  }
}
