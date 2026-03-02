import 'package:bloc/bloc.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'metals_and_alloys_event.dart';

class MetalsAndAlloysBloc extends Bloc<MetalsAndAlloysEvent, MetalsAndAlloys> {
  MetalsAndAlloysBloc() : super(MetalsAndAlloys()) {
    on<CopperBronzeAndBrassNotesChanged>((event, emit) {
      emit(state.copyWith(copperBronzeAndBrassNotes: event.value));
    });

    on<AluminiumNotesChanged>((event, emit) {
      emit(state.copyWith(aluminiumNotes: event.value));
    });

    on<IronAndSteelNotesChanged>((event, emit) {
      emit(state.copyWith(ironAndSteelNotes: event.value));
    });

    on<MixedMetalsNotesChanged>((event, emit) {
      emit(state.copyWith(mixedMetalsNotes: event.value));
    });

    on<LeadChanged>((event, emit) {
      emit(state.copyWith(lead: event.value));
    });

    on<ZincChanged>((event, emit) {
      emit(state.copyWith(zinc: event.value));
    });

    on<TinChanged>((event, emit) {
      emit(state.copyWith(tin: event.value));
    });

    on<ContaminatedMetalWasteChanged>((event, emit) {
      emit(state.copyWith(contaminatedMetalWaste: event.value));
    });

    on<HazardousOilAndTarCablesChanged>((event, emit) {
      emit(state.copyWith(hazardousOilAndTarCables: event.value));
    });

    on<OtherCablesChanged>((event, emit) {
      emit(state.copyWith(otherCables: event.value));
    });

    on<LeadVolumeChanged>((event, emit) {
      final current = state.lead ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        lead: current.copyWith(volume: event.value),
      ));
    });

    on<LeadTonsChanged>((event, emit) {
      final current = state.lead ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        lead: current.copyWith(tons: event.value),
      ));
    });

    on<LeadNotesChanged>((event, emit) {
      final current = state.lead ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        lead: current.copyWith(notes: event.value),
      ));
    });

    on<ZincVolumeChanged>((event, emit) {
      final current = state.zinc ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        zinc: current.copyWith(volume: event.value),
      ));
    });

    on<ZincTonsChanged>((event, emit) {
      final current = state.zinc ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        zinc: current.copyWith(tons: event.value),
      ));
    });

    on<ZincNotesChanged>((event, emit) {
      final current = state.zinc ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        zinc: current.copyWith(notes: event.value),
      ));
    });

    on<TinVolumeChanged>((event, emit) {
      final current = state.tin ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        tin: current.copyWith(volume: event.value),
      ));
    });

    on<TinTonsChanged>((event, emit) {
      final current = state.tin ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        tin: current.copyWith(tons: event.value),
      ));
    });

    on<TinNotesChanged>((event, emit) {
      final current = state.tin ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        tin: current.copyWith(notes: event.value),
      ));
    });

    on<ContaminatedMetalWasteVolumeChanged>((event, emit) {
      final current = state.contaminatedMetalWaste ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        contaminatedMetalWaste: current.copyWith(volume: event.value),
      ));
    });

    on<ContaminatedMetalWasteTonsChanged>((event, emit) {
      final current = state.contaminatedMetalWaste ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        contaminatedMetalWaste: current.copyWith(tons: event.value),
      ));
    });

    on<ContaminatedMetalWasteNotesChanged>((event, emit) {
      final current = state.contaminatedMetalWaste ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        contaminatedMetalWaste: current.copyWith(notes: event.value),
      ));
    });

    on<HazardousOilAndTarCablesVolumeChanged>((event, emit) {
      final current = state.hazardousOilAndTarCables ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        hazardousOilAndTarCables: current.copyWith(volume: event.value),
      ));
    });

    on<HazardousOilAndTarCablesTonsChanged>((event, emit) {
      final current = state.hazardousOilAndTarCables ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        hazardousOilAndTarCables: current.copyWith(tons: event.value),
      ));
    });

    on<HazardousOilAndTarCablesNotesChanged>((event, emit) {
      final current = state.hazardousOilAndTarCables ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        hazardousOilAndTarCables: current.copyWith(notes: event.value),
      ));
    });

    on<OtherCablesVolumeChanged>((event, emit) {
      final current =
          state.otherCables ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        otherCables: current.copyWith(volume: event.value),
      ));
    });

    on<OtherCablesTonsChanged>((event, emit) {
      final current =
          state.otherCables ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        otherCables: current.copyWith(tons: event.value),
      ));
    });

    on<OtherCablesNotesChanged>((event, emit) {
      final current =
          state.otherCables ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
        otherCables: current.copyWith(notes: event.value),
      ));
    });
  }
}
