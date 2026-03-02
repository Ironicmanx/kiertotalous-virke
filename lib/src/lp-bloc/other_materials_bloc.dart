import 'package:bloc/bloc.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'other_materials_event.dart';

class OtherMaterialsBloc extends Bloc<OtherMaterialsEvent, OtherMaterials> {
  OtherMaterialsBloc() : super(OtherMaterials()) {
    on<MercuryContainingMaterialsChanged>((event, emit) {
      emit(state.copyWith(mercuryContainingMaterials: event.value));
    });

    on<PCBContainingDemolitionWasteNotesChanged>((event, emit) {
      emit(state.copyWith(pcbContainingDemolitionWasteNotes: event.value));
    });

    on<OtherHazardousDemolitionWasteChanged>((event, emit) {
      emit(state.copyWith(otherHazardousDemolitionWaste: event.value));
    });

    on<OtherDemolitionWasteChanged>((event, emit) {
      emit(state.copyWith(otherDemolitionWaste: event.value));
    });

    on<MercuryContainingMaterialsVolumeChanged>((event, emit) {
      final current = state.mercuryContainingMaterials ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        mercuryContainingMaterials: current.copyWith(volume: event.value),
      ));
    });

    on<MercuryContainingMaterialsTonsChanged>((event, emit) {
      final current = state.mercuryContainingMaterials ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        mercuryContainingMaterials: current.copyWith(tons: event.value),
      ));
    });

    on<MercuryContainingMaterialsNotesChanged>((event, emit) {
      final current = state.mercuryContainingMaterials ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        mercuryContainingMaterials: current.copyWith(notes: event.value),
      ));
    });

    on<OtherHazardousDemolitionWasteVolumeChanged>((event, emit) {
      final current = state.otherHazardousDemolitionWaste ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        otherHazardousDemolitionWaste: current.copyWith(volume: event.value),
      ));
    });

    on<OtherHazardousDemolitionWasteTonsChanged>((event, emit) {
      final current = state.otherHazardousDemolitionWaste ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        otherHazardousDemolitionWaste: current.copyWith(tons: event.value),
      ));
    });

    on<OtherHazardousDemolitionWasteNotesChanged>((event, emit) {
      final current = state.otherHazardousDemolitionWaste ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        otherHazardousDemolitionWaste: current.copyWith(notes: event.value),
      ));
    });

    on<OtherDemolitionWasteVolumeChanged>((event, emit) {
      final current = state.otherDemolitionWaste ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        otherDemolitionWaste: current.copyWith(volume: event.value),
      ));
    });

    on<OtherDemolitionWasteTonsChanged>((event, emit) {
      final current = state.otherDemolitionWaste ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        otherDemolitionWaste: current.copyWith(tons: event.value),
      ));
    });

    on<OtherDemolitionWasteNotesChanged>((event, emit) {
      final current = state.otherDemolitionWaste ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        otherDemolitionWaste: current.copyWith(notes: event.value),
      ));
    });
  }
}
