import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/sp-bloc/reusable_and_recyclable_materials_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmallPropertiesReusableAndRecyclableMaterialsBloc extends Bloc<
    SmallPropertiesReusableAndRecyclableMaterialsEvent,
    SmallPropertiesReusableAndRecyclableMaterials> {
  SmallPropertiesReusableAndRecyclableMaterialsBloc()
      : super(SmallPropertiesReusableAndRecyclableMaterials()) {
    on<CleanSoilDemolitionCostChanged>((event, emit) {
      emit(state.copyWith(cleanSoilDemolitionCost: event.value));
      logger.d('cleanSoilDemolitionCost changed to ${event.value}');
    });

    on<AsphaltWasteDemolitionCostChanged>((event, emit) {
      emit(state.copyWith(asphaltWasteDemolitionCost: event.value));
      logger.d('asphaltWasteDemolitionCost changed to ${event.value}');
    });

    on<CleanConcreteDemolitionCostChanged>((event, emit) {
      emit(state.copyWith(cleanConcreteDemolitionCost: event.value));
      logger.d('cleanConcreteDemolitionCost changed to ${event.value}');
    });

    on<ReinforcedConcreteSheetMetalRoofAndMoreDemolitionCostChanged>(
        (event, emit) {
      emit(state.copyWith(
          reinforcedConcreteSheetMetalRoofAndMoreDemolitionCost: event.value));
      logger.d(
          'reinforcedConcreteSheetMetalRoofAndMoreDemolitionCost changed to ${event.value}');
    });

    on<WallAndCeilingTilesDemolitionCostChanged>((event, emit) {
      emit(state.copyWith(wallAndCeilingTilesDemolitionCost: event.value));
      logger.d('wallAndCeilingTilesDemolitionCost changed to ${event.value}');
    });

    on<CleanReusableWoodDemolitionCostChanged>((event, emit) {
      emit(state.copyWith(cleanReusableWoodDemolitionCost: event.value));
      logger.d('cleanReusableWoodDemolitionCost changed to ${event.value}');
    });

    on<BurnableWoodWasteDemolitionCostChanged>((event, emit) {
      emit(state.copyWith(burnableWoodWasteDemolitionCost: event.value));
      logger.d('burnableWoodWasteDemolitionCost changed to ${event.value}');
    });

    on<WindProtectionSheetBitumenOrSimilarDemolitionCostChanged>((event, emit) {
      emit(state.copyWith(
          windProtectionSheetBitumenOrSimilarDemolitionCost: event.value));
      logger.d(
          'windProtectionSheetBitumenOrSimilarDemolitionCost changed to ${event.value}');
    });

    on<GlassAndMineralInsulationWoolDemolitionCostChanged>((event, emit) {
      emit(state.copyWith(
          glassAndMineralInsulationWoolDemolitionCost: event.value));
      logger.d(
          'glassAndMineralInsulationWoolDemolitionCost changed to ${event.value}');
    });

    on<CybrocSheetsDemolitionCostChanged>((event, emit) {
      emit(state.copyWith(cybrocSheetsDemolitionCost: event.value));
      logger.d('cybrocSheetsDemolitionCost changed to ${event.value}');
    });

    on<ChipboardDemolitionCostChanged>((event, emit) {
      emit(state.copyWith(chipboardDemolitionCost: event.value));
      logger.d('chipboardDemolitionCost changed to ${event.value}');
    });

    on<EnergyWastePaintedWoodRoofingFeltAndUnderLaymentDemolitionCostChanged>(
        (event, emit) {
      emit(state.copyWith(
          energyWastePaintedWoodRoofingFeltAndUnderLaymentDemolitionCost:
              event.value));
      logger.d(
          'energyWastePaintedWoodRoofingFeltAndUnderLaymentDemolitionCost changed to ${event.value}');
    });

    on<GlassDemolitionCostChanged>((event, emit) {
      emit(state.copyWith(glassDemolitionCost: event.value));
      logger.d('glassDemolitionCost changed to ${event.value}');
    });

    on<AluminiumDemolitionCostChanged>((event, emit) {
      emit(state.copyWith(aluminiumDemolitionCost: event.value));
      logger.d('aluminiumDemolitionCost changed to ${event.value}');
    });

    on<OtherMetalScrapDemolitionCostChanged>((event, emit) {
      emit(state.copyWith(otherMetalScrapDemolitionCost: event.value));
      logger.d('otherMetalScrapDemolitionCost changed to ${event.value}');
    });

    on<StainlessSteelDemolitionCostChanged>((event, emit) {
      emit(state.copyWith(stainlessSteelDemolitionCost: event.value));
      logger.d('stainlessSteelDemolitionCost changed to ${event.value}');
    });

    on<CopperDemolitionCostChanged>((event, emit) {
      emit(state.copyWith(copperDemolitionCost: event.value));
      logger.d('copperDemolitionCost changed to ${event.value}');
    });

    on<ConcreteYardTilesAndStonesDemolitionCostChanged>((event, emit) {
      emit(state.copyWith(
          concreteYardTilesAndStonesDemolitionCost: event.value));
      logger.d(
          'concreteYardTilesAndStonesDemolitionCost changed to ${event.value}');
    });

    on<OverallReusableMaterialsDemolitionCostChanged>((event, emit) {
      emit(state.copyWith(overallReusableMaterialsDemolitionCost: event.value));
      logger.d(
          'overallReusableMaterialsDemolitionCost changed to ${event.value}');
    });
  }
}
