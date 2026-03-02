import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/lp-bloc/reusable_and_recyclable_materials_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/log.dart';

class ReusableAndRecyclableMaterialsBloc extends Bloc<
    ReusableAndRecyclableMaterialsEvent, ReusableAndRecyclableMaterials> {
  ReusableAndRecyclableMaterialsBloc()
      : super(ReusableAndRecyclableMaterials()) {
    on<CleanSoilDemolitionCostChanged>((event, emit) {
      emit(
        state.copyWith(
          cleanSoilDemolitionCost: event.value,
        ),
      );
      logger.d('cleanSoilDemolitionCost changed to ${event.value}');
    });
    on<AsphaltWasteDemolitionCostChanged>((event, emit) {
      emit(
        state.copyWith(
          asphaltWasteDemolitionCost: event.value,
        ),
      );
      logger.d('asphaltWasteDemolitionCost changed to ${event.value}');
    });
    on<CleanConcreteDemolitionCostChanged>((event, emit) {
      emit(
        state.copyWith(
          cleanConcreteDemolitionCost: event.value,
        ),
      );
      logger.d('cleanConcreteDemolitionCost changed to ${event.value}');
    });
    on<ConcreteBlocksDemolitionCostChanged>((event, emit) {
      emit(
        state.copyWith(
          concreteBlocksDemolitionCost: event.value,
        ),
      );
      logger.d('concreteBlocksDemolitionCost changed to ${event.value}');
    });
    on<WallAndRoofTilesDemolitionCostChanged>((event, emit) {
      emit(
        state.copyWith(
          wallAndRoofTilesDemolitionCost: event.value,
        ),
      );
      logger.d('wallAndRoofTilesDemolitionCost changed to ${event.value}');
    });
    on<CeramicTilesDemolitionCostChanged>((event, emit) {
      emit(
        state.copyWith(
          ceramicTilesDemolitionCost: event.value,
        ),
      );
      logger.d('ceramicTilesDemolitionCost changed to ${event.value}');
    });
    on<RebarAndSteelScrapDemolitionCostChanged>((event, emit) {
      emit(
        state.copyWith(
          rebarAndSteelScrapDemolitionCost: event.value,
        ),
      );
      logger.d('rebarAndSteelScrapDemolitionCost changed to ${event.value}');
    });
    on<StainlessSteelDemolitionCostChanged>((event, emit) {
      emit(
        state.copyWith(
          stainlessSteelDemolitionCost: event.value,
        ),
      );
      logger.d('stainlessSteelDemolitionCost changed to ${event.value}');
    });
    on<CopperDemolitionCostChanged>((event, emit) {
      emit(
        state.copyWith(
          copperDemolitionCost: event.value,
        ),
      );
      logger.d('copperDemolitionCost changed to ${event.value}');
    });
    on<AluminiumDemolitionCostChanged>((event, emit) {
      emit(
        state.copyWith(
          aluminiumDemolitionCost: event.value,
        ),
      );
      logger.d('aluminiumDemolitionCost changed to ${event.value}');
    });
    on<CleanUsableWoodDemolitionCostChanged>((event, emit) {
      emit(
        state.copyWith(
          cleanUsableWoodDemolitionCost: event.value,
        ),
      );
      logger.d('cleanUsableWoodDemolitionCost changed to ${event.value}');
    });
    on<CombustibleWoodWasteDemolitionCostChanged>((event, emit) {
      emit(
        state.copyWith(
          combustibleWoodWasteDemolitionCost: event.value,
        ),
      );
      logger.d('combustibleWoodWasteDemolitionCost changed to ${event.value}');
    });
    on<GlassDemolitionCostChanged>((event, emit) {
      emit(
        state.copyWith(
          glassDemolitionCost: event.value,
        ),
      );
      logger.d('glassDemolitionCost changed to ${event.value}');
    });
    on<GlassAndMineralWoolDemolitionCostChanged>((event, emit) {
      emit(
        state.copyWith(
          glassAndMineralWoolDemolitionCost: event.value,
        ),
      );
      logger.d('glassAndMineralWoolDemolitionCost changed to ${event.value}');
    });
    on<FiberCementBoardsDemolitionCostChanged>((event, emit) {
      emit(
        state.copyWith(
          fiberCementBoardsDemolitionCost: event.value,
        ),
      );
      logger.d('fiberCementBoardsDemolitionCost changed to ${event.value}');
    });
    on<GypsumBoardsDemolitionCostChanged>((event, emit) {
      emit(
        state.copyWith(
          gypsumBoardsDemolitionCost: event.value,
        ),
      );
      logger.d('gypsumBoardsDemolitionCost changed to ${event.value}');
    });
    on<ChipboardDemolitionCostChanged>((event, emit) {
      emit(
        state.copyWith(
          chipboardDemolitionCost: event.value,
        ),
      );
      logger.d('chipboardDemolitionCost changed to ${event.value}');
    });
    on<WindProtectionBoardDemolitionCostChanged>((event, emit) {
      emit(
        state.copyWith(
          windProtectionBoardDemolitionCost: event.value,
        ),
      );
      logger.d('windProtectionBoardDemolitionCost changed to ${event.value}');
    });
    on<EWasteDemolitionCostChanged>((event, emit) {
      emit(
        state.copyWith(
          eWasteDemolitionCost: event.value,
        ),
      );
      logger.d('eWasteDemolitionCost changed to ${event.value}');
    });
    on<PlasticWasteDemolitionCostChanged>((event, emit) {
      emit(
        state.copyWith(
          plasticWasteDemolitionCost: event.value,
        ),
      );
      logger.d('plasticWasteDemolitionCost changed to ${event.value}');
    });
    on<EnergyWasteDemolitionCostChanged>((event, emit) {
      emit(
        state.copyWith(
          energyWasteDemolitionCost: event.value,
        ),
      );
      logger.d('energyWasteDemolitionCost changed to ${event.value}');
    });
  }
}
