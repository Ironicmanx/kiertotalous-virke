import 'package:bloc/bloc.dart';
import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'soil_aggregates_dredging_materials_event.dart';

class SoilAggregatesDredgingMaterialsBloc extends Bloc<
    SoilAggregatesDredgingMaterialsEvent, SoilAggregatesDredgingMaterials> {
  SoilAggregatesDredgingMaterialsBloc()
      : super(SoilAggregatesDredgingMaterials()) {
    on<HazardousSoilAndRockNotesChanged>((event, emit) {
      emit(state.copyWith(hazardousSoilAndRockNotes: event.value));
    });

    on<SoilAndRockChanged>((event, emit) {
      emit(state.copyWith(soilAndRock: event.value));
    });

    on<HazardousDredgingSpoilChanged>((event, emit) {
      emit(state.copyWith(hazardousDredgingSpoil: event.value));
    });

    on<DredgingSpoilChanged>((event, emit) {
      emit(state.copyWith(dredgingSpoil: event.value));
    });

    on<HazardousRailwayBallastChanged>((event, emit) {
      emit(state.copyWith(hazardousRailwayBallast: event.value));
    });

    on<RailwayBallastChanged>((event, emit) {
      emit(state.copyWith(railwayBallast: event.value));
    });

    // Soil and Rock handlers
    on<SoilAndRockVolumeChanged>((event, emit) {
      final current =
          state.soilAndRock ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(soilAndRock: current.copyWith(volume: event.value)));
    });

    on<SoilAndRockTonsChanged>((event, emit) {
      final current =
          state.soilAndRock ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(soilAndRock: current.copyWith(tons: event.value)));
    });

    on<SoilAndRockNotesChanged>((event, emit) {
      final current =
          state.soilAndRock ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(soilAndRock: current.copyWith(notes: event.value)));
    });

    // Hazardous Dredging Spoil handlers
    on<HazardousDredgingSpoilVolumeChanged>((event, emit) {
      final current = state.hazardousDredgingSpoil ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
          hazardousDredgingSpoil: current.copyWith(volume: event.value)));
    });

    on<HazardousDredgingSpoilTonsChanged>((event, emit) {
      final current = state.hazardousDredgingSpoil ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
          hazardousDredgingSpoil: current.copyWith(tons: event.value)));
    });

    on<HazardousDredgingSpoilNotesChanged>((event, emit) {
      final current = state.hazardousDredgingSpoil ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
          hazardousDredgingSpoil: current.copyWith(notes: event.value)));
    });

    // Dredging Spoil handlers (NEW)
    on<DredgingSpoilVolumeChanged>((event, emit) {
      final current =
          state.dredgingSpoil ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(
          state.copyWith(dredgingSpoil: current.copyWith(volume: event.value)));
    });

    on<DredgingSpoilTonsChanged>((event, emit) {
      final current =
          state.dredgingSpoil ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(dredgingSpoil: current.copyWith(tons: event.value)));
    });

    on<DredgingSpoilNotesChanged>((event, emit) {
      final current =
          state.dredgingSpoil ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(dredgingSpoil: current.copyWith(notes: event.value)));
    });

    // Hazardous Railway Ballast handlers (NEW)
    on<HazardousRailwayBallastVolumeChanged>((event, emit) {
      final current = state.hazardousRailwayBallast ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
          hazardousRailwayBallast: current.copyWith(volume: event.value)));
    });

    on<HazardousRailwayBallastTonsChanged>((event, emit) {
      final current = state.hazardousRailwayBallast ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
          hazardousRailwayBallast: current.copyWith(tons: event.value)));
    });

    on<HazardousRailwayBallastNotesChanged>((event, emit) {
      final current = state.hazardousRailwayBallast ??
          WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
          hazardousRailwayBallast: current.copyWith(notes: event.value)));
    });

    // Railway Ballast handlers (NEW)
    on<RailwayBallastVolumeChanged>((event, emit) {
      final current =
          state.railwayBallast ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(
          railwayBallast: current.copyWith(volume: event.value)));
    });

    on<RailwayBallastTonsChanged>((event, emit) {
      final current =
          state.railwayBallast ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(state.copyWith(railwayBallast: current.copyWith(tons: event.value)));
    });

    on<RailwayBallastNotesChanged>((event, emit) {
      final current =
          state.railwayBallast ?? WasteLawDemolitionMaterialEstimateEntry();
      emit(
          state.copyWith(railwayBallast: current.copyWith(notes: event.value)));
    });
  }
}
