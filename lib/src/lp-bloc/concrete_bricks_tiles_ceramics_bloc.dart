import 'package:bloc/bloc.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/lp-bloc/concrete_bricks_tiles_ceramics_event.dart';

class ConcreteBricksTilesCeramicsBloc extends Bloc<
    ConcreteBricksTilesCeramicsEvent, ConcreteBricksTilesCeramics> {
  ConcreteBricksTilesCeramicsBloc() : super(ConcreteBricksTilesCeramics()) {
    on<ConcreteNotesChanged>((event, emit) {
      emit(state.copyWith(concreteNotes: event.value));
    });

    on<BrickNotesChanged>((event, emit) {
      emit(state.copyWith(brickNotes: event.value));
    });

    on<CeramicTilesNotesChanged>((event, emit) {
      emit(state.copyWith(ceramicTilesNotes: event.value));
    });

    on<HazardousMixturesNotesChanged>((event, emit) {
      emit(state.copyWith(
          hazardousConcreteBrickTileCeramicMixturesNotes: event.value));
    });

    on<OtherMaterialsChanged>((event, emit) {
      emit(state.copyWith(otherMaterials: event.value));
    });

    on<OtherMaterialsVolumeChanged>((event, emit) {
      final current =
          state.otherMaterials ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        otherMaterials: current.copyWith(volume: event.value),
      ));
    });

    on<OtherMaterialsTonsChanged>((event, emit) {
      final current =
          state.otherMaterials ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        otherMaterials: current.copyWith(tons: event.value),
      ));
    });

    on<OtherMaterialsNotesChanged>((event, emit) {
      final current =
          state.otherMaterials ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        otherMaterials: current.copyWith(notes: event.value),
      ));
    });
  }
}
