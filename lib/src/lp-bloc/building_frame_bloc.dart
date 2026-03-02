import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/lp-bloc/building_frame_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildingFrameBloc extends Bloc<BuildingFrameEvent, BuildingFrame> {
  BuildingFrameBloc() : super(BuildingFrame()) {
    on<UseFoundationCircumferenceChanged>((event, emit) {
      emit(state.copyWith(useFoundationCircumference: event.value));
      logger.d("BuildingFrame.useFoundationCircumference: ${event.value}");
    });
    on<ExternalWallsPerimeterChanged>((event, emit) {
      emit(state.copyWith(externalWallsPerimeter: event.value));
      logger.d("BuildingFrame.externalWallsPerimeter: ${event.value}");
    });
    on<ExternalWallsAverageHeightChanged>((event, emit) {
      emit(state.copyWith(externalWallsAverageHeight: event.value));
      logger.d("BuildingFrame.externalWallsAverageHeight: ${event.value}");
    });
    on<AreMaterialsRecyclableChanged>((event, emit) {
      emit(state.copyWith(areMaterialsRecyclable: event.value));
      logger.d("BuildingFrame.areMaterialsRecyclable: ${event.value}");
    });
    on<WoodPortionPercentageChanged>((event, emit) {
      emit(state.copyWith(woodPortionPercentage: event.value));
      logger.d("BuildingFrame.woodPortionPercentage: ${event.value}");
    });
    on<GlulamVerticalColumnsPortionPercentageChanged>((event, emit) {
      emit(state.copyWith(glulamVerticalColumnsPortionPercentage: event.value));
      logger.d(
          "BuildingFrame.glulamVerticalColumnsPortionPercentage: ${event.value}");
    });
    on<ConcreteVerticalColumnsPortionPercentageChanged>((event, emit) {
      emit(state.copyWith(
          concreteVerticalColumnsPortionPercentage: event.value));
      logger.d(
          "BuildingFrame.concreteVerticalColumnsPortionPercentage: ${event.value}");
    });
    on<SteelVerticalColumnsPortionPercentageChanged>((event, emit) {
      emit(state.copyWith(steelVerticalColumnsPortionPercentage: event.value));
      logger.d(
          "BuildingFrame.steelVerticalColumnsPortionPercentage: ${event.value}");
    });
    on<DoubleLoadBearingBrickWallPortionPercentageChanged>((event, emit) {
      emit(state.copyWith(
          doubleLoadBearingBrickWallPortionPercentage: event.value));
      logger.d(
          "BuildingFrame.doubleLoadBearingBrickWallPortionPercentage: ${event.value}");
    });
    on<ConcreteElementWallsWithoutFrameworkPortionPercentageChanged>(
        (event, emit) {
      emit(state.copyWith(
          concreteElementWallsWithoutFrameworkPortionPercentage: event.value));
      logger.d(
          "BuildingFrame.concreteElementWallsWithoutFrameworkPortionPercentage: ${event.value}");
    });
    on<BrickCladWallPortionPercentageChanged>((event, emit) {
      emit(state.copyWith(brickCladWallPortionPercentage: event.value));
      logger.d("BuildingFrame.brickCladWallPortionPercentage: ${event.value}");
    });
    on<BoardWallPortionPercentageChanged>((event, emit) {
      emit(state.copyWith(boardWallPortionPercentage: event.value));
      logger.d("BuildingFrame.boardWallPortionPercentage: ${event.value}");
    });
    on<ProfiledSheetMetalPortionPercentageChanged>((event, emit) {
      emit(state.copyWith(profiledSheetMetalPortionPercentage: event.value));
      logger.d(
          "BuildingFrame.profiledSheetMetalPortionPercentage: ${event.value}");
    });
    on<SteelProfileSandwichStructurePortionPercentageChanged>((event, emit) {
      emit(state.copyWith(
          steelProfileSandwichStructurePortionPercentage: event.value));
      logger.d(
          "BuildingFrame.steelProfileSandwichStructurePortionPercentage: ${event.value}");
    });
    on<MineriteOrOtherStoneBoardPortionPercentageChanged>((event, emit) {
      emit(state.copyWith(
          mineriteOrOtherStoneBoardPortionPercentage: event.value));
      logger.d(
          "BuildingFrame.mineriteOrOtherStoneBoardPortionPercentage: ${event.value}");
    });
  }
}
