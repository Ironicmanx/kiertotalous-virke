import 'package:bloc/bloc.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'insulation_and_asbestos_containing_materials_event.dart';

class InsulationAndAsbestosContainingMaterialsBloc extends Bloc<
    InsulationAndAsbestosContainingMaterialsEvent,
    InsulationAndAsbestosContainingMaterials> {
  InsulationAndAsbestosContainingMaterialsBloc()
      : super(InsulationAndAsbestosContainingMaterials()) {
    on<AsbestosContainingInsulationMaterialsChanged>((event, emit) {
      emit(state.copyWith(asbestosContainingInsulationMaterials: event.value));
    });

    on<OtherHazardousInsulationMaterialsChanged>((event, emit) {
      emit(state.copyWith(otherHazardousInsulationMaterials: event.value));
    });

    on<OtherInsulationMaterialsChanged>((event, emit) {
      emit(state.copyWith(otherInsulationMaterials: event.value));
    });

    on<AsbestosContainingBuildingMaterialsChanged>((event, emit) {
      emit(state.copyWith(asbestosContainingBuildingMaterials: event.value));
    });

    on<AsbestosContainingInsulationMaterialsVolumeChanged>((event, emit) {
      final current = state.asbestosContainingInsulationMaterials ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        asbestosContainingInsulationMaterials:
            current.copyWith(volume: event.value),
      ));
    });

    on<OtherHazardousInsulationMaterialsVolumeChanged>((event, emit) {
      final current = state.otherHazardousInsulationMaterials ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        otherHazardousInsulationMaterials:
            current.copyWith(volume: event.value),
      ));
    });

    on<OtherInsulationMaterialsVolumeChanged>((event, emit) {
      final current = state.otherInsulationMaterials ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        otherInsulationMaterials: current.copyWith(volume: event.value),
      ));
    });

    on<AsbestosContainingBuildingMaterialsVolumeChanged>((event, emit) {
      final current = state.asbestosContainingBuildingMaterials ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        asbestosContainingBuildingMaterials:
            current.copyWith(volume: event.value),
      ));
    });

    on<AsbestosContainingInsulationMaterialsTonsChanged>((event, emit) {
      final current = state.asbestosContainingInsulationMaterials ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        asbestosContainingInsulationMaterials:
            current.copyWith(tons: event.value),
      ));
    });

    on<OtherHazardousInsulationMaterialsTonsChanged>((event, emit) {
      final current = state.otherHazardousInsulationMaterials ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        otherHazardousInsulationMaterials: current.copyWith(tons: event.value),
      ));
    });

    on<OtherInsulationMaterialsTonsChanged>((event, emit) {
      final current = state.otherInsulationMaterials ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        otherInsulationMaterials: current.copyWith(tons: event.value),
      ));
    });

    on<AsbestosContainingBuildingMaterialsTonsChanged>((event, emit) {
      final current = state.asbestosContainingBuildingMaterials ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        asbestosContainingBuildingMaterials:
            current.copyWith(tons: event.value),
      ));
    });

    // Notes change handlers
    on<AsbestosContainingInsulationMaterialsNotesChanged>((event, emit) {
      final current = state.asbestosContainingInsulationMaterials ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        asbestosContainingInsulationMaterials:
            current.copyWith(notes: event.value),
      ));
    });

    on<OtherHazardousInsulationMaterialsNotesChanged>((event, emit) {
      final current = state.otherHazardousInsulationMaterials ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        otherHazardousInsulationMaterials: current.copyWith(notes: event.value),
      ));
    });

    on<OtherInsulationMaterialsNotesChanged>((event, emit) {
      final current = state.otherInsulationMaterials ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        otherInsulationMaterials: current.copyWith(notes: event.value),
      ));
    });

    on<AsbestosContainingBuildingMaterialsNotesChanged>((event, emit) {
      final current = state.asbestosContainingBuildingMaterials ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        asbestosContainingBuildingMaterials:
            current.copyWith(notes: event.value),
      ));
    });
  }
}
