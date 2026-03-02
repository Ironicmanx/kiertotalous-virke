import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/sp-bloc/carport_or_garage_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarportOrGarageBloc extends Bloc<CarportOrGarageEvent, CarportOrGarage> {
  CarportOrGarageBloc() : super(CarportOrGarage()) {
    on<BuildingLengthInMetersChanged>((event, emit) {
      emit(state.copyWith(buildingLengthInMeters: event.value));
      logger.d('CarportOrGarageBloc.buildingLengthInMeters: ${event.value}');
    });

    on<BuildingWidthInMetersChanged>((event, emit) {
      emit(state.copyWith(buildingWidthInMeters: event.value));
      logger.d('CarportOrGarageBloc.buildingWidthInMeters: ${event.value}');
    });

    on<FoundationTypeChanged>((event, emit) {
      emit(state.copyWith(foundationType: event.value));
      logger.d('CarportOrGarageBloc.foundationType: ${event.value}');
    });

    on<BuildingFoundationAndWallsContainAsbestosOrPcbPaintsChanged>(
        (event, emit) {
      emit(state.copyWith(
          buildingFoundationAndWallsContainAsbestosOrPcbPaints: event.value));
      logger.d(
        'CarportOrGarageBloc.buildingFoundationAndWallsContainAsbestosOrPcbPaints: ${event.value}',
      );
    });

    on<CoveringMaterialContainsAsbestosChanged>((event, emit) {
      emit(state.copyWith(coveringMaterialContainsAsbestos: event.value));
      logger.d(
          'CarportOrGarageBloc.coveringMaterialContainsAsbestos: ${event.value}');
    });

    on<GarageWallMaterialChanged>((event, emit) {
      emit(state.copyWith(garageWallMaterial: event.value));
      logger.d('CarportOrGarageBloc.garageWallMaterial: ${event.value}');
    });

    on<InsulationMaterialThicknessChanged>((event, emit) {
      emit(state.copyWith(insulationMaterialThickness: event.value));
      logger
          .d('CarportOrGarageBloc.insulationMaterialThickness: ${event.value}');
    });

    on<WallAverageHeightChanged>((event, emit) {
      emit(state.copyWith(wallAverageHeight: event.value));
      logger.d('CarportOrGarageBloc.wallAverageHeight: ${event.value}');
    });

    on<BuildingWallLengthTotalChanged>((event, emit) {
      emit(state.copyWith(buildingWallLengthTotal: event.value));
      logger.d('CarportOrGarageBloc.buildingWallLengthTotal: ${event.value}');
    });
  }
}
