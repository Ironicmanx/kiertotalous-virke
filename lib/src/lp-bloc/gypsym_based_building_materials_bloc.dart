import 'package:bloc/bloc.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/lp-bloc/gypsym_based_building_materials_event.dart';

class GypsumBasedBuildingMaterialsBloc extends Bloc<
    GypsumBasedBuildingMaterialsEvent, GypsumBasedBuildingMaterials> {
  GypsumBasedBuildingMaterialsBloc() : super(GypsumBasedBuildingMaterials()) {
    on<ContaminatedGypsumBasedMaterialsChanged>((event, emit) {
      emit(state.copyWith(contaminatedGypsumBasedMaterials: event.value));
    });

    on<OtherGypsumBasedMaterialsChanged>((event, emit) {
      emit(state.copyWith(otherGypsumBasedMaterials: event.value));
    });

    on<ContaminatedGypsumBasedMaterialsVolumeChanged>((event, emit) {
      final current = state.contaminatedGypsumBasedMaterials ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        contaminatedGypsumBasedMaterials: current.copyWith(volume: event.value),
      ));
    });

    on<ContaminatedGypsumBasedMaterialsTonsChanged>((event, emit) {
      final current = state.contaminatedGypsumBasedMaterials ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        contaminatedGypsumBasedMaterials: current.copyWith(tons: event.value),
      ));
    });

    on<ContaminatedGypsumBasedMaterialsNotesChanged>((event, emit) {
      final current = state.contaminatedGypsumBasedMaterials ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        contaminatedGypsumBasedMaterials: current.copyWith(notes: event.value),
      ));
    });

    on<OtherGypsumBasedMaterialsVolumeChanged>((event, emit) {
      final current = state.otherGypsumBasedMaterials ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        otherGypsumBasedMaterials: current.copyWith(volume: event.value),
      ));
    });

    on<OtherGypsumBasedMaterialsTonsChanged>((event, emit) {
      final current = state.otherGypsumBasedMaterials ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        otherGypsumBasedMaterials: current.copyWith(tons: event.value),
      ));
    });

    on<OtherGypsumBasedMaterialsNotesChanged>((event, emit) {
      final current = state.otherGypsumBasedMaterials ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        otherGypsumBasedMaterials: current.copyWith(notes: event.value),
      ));
    });
  }
}
