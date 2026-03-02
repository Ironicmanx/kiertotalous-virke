import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/log.dart';

import 'recyclable_materials_handling_costs_event.dart';

class RecyclableMaterialsHandlingCostsBloc extends Bloc<
    RecyclableMaterialsHandlingCostsEvent,
    RecyclableMaterialsHandlingAndDismantlingCosts> {
  RecyclableMaterialsHandlingCostsBloc()
      : super(RecyclableMaterialsHandlingAndDismantlingCosts()) {
    on<CleanSoilHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(cleanSoilHandlingAndDismantlingCosts: event.value));
      logger.d('cleanSoilHandlingCosts changed to: ${event.value}');
    });

    on<AsphaltWasteHandlingCostsChanged>((event, emit) {
      emit(
          state.copyWith(asphaltWasteHandlingAndDismantlingCosts: event.value));
      logger.d('asphaltWasteHandlingCosts changed to: ${event.value}');
    });

    on<CleanConcreteHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(
          cleanConcreteHandlingAndDismantlingCosts: event.value));
      logger.d('cleanConcreteHandlingCosts changed to: ${event.value}');
    });

    on<SteelHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(steelHandlingAndDismantlingCosts: event.value));
      logger.d('steelHandlingCosts changed to: ${event.value}');
    });

    on<WallAndRoofTilesHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(
          wallAndRoofTilesHandlingAndDismantlingCosts: event.value));
      logger.d('wallAndRoofTilesHandlingCosts changed to: ${event.value}');
    });

    on<CleanUsableWoodHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(
          cleanUsableWoodHandlingAndDismantlingCosts: event.value));
      logger.d('cleanUsableWoodHandlingCosts changed to: ${event.value}');
    });

    on<CombustibleWoodWasteHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(
          combustibleWoodWasteHandlingAndDismantlingCosts: event.value));
      logger.d('combustibleWoodWasteHandlingCosts changed to: ${event.value}');
    });

    on<WindProtectionBoardHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(
          windProtectionBoardHandlingAndDismantlingCosts: event.value));
      logger.d('windProtectionBoardHandlingCosts changed to: ${event.value}');
    });

    on<GlassAndMineralWoolHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(
          glassAndMineralWoolHandlingAndDismantlingCosts: event.value));
      logger.d('glassAndMineralWoolHandlingCosts changed to: ${event.value}');
    });

    on<GypsumBoardsHandlingCostsChanged>((event, emit) {
      emit(
          state.copyWith(gypsumBoardsHandlingAndDismantlingCosts: event.value));
      logger.d('gypsumBoardsHandlingCosts changed to: ${event.value}');
    });

    on<ChipboardHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(chipboardHandlingAndDismantlingCosts: event.value));
      logger.d('chipboardHandlingCosts changed to: ${event.value}');
    });

    on<EnergyWasteHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(energyWasteHandlingAndDismantlingCosts: event.value));
      logger.d('energyWasteHandlingCosts changed to: ${event.value}');
    });

    on<GlassHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(glassHandlingAndDismantlingCosts: event.value));
      logger.d('glassHandlingCosts changed to: ${event.value}');
    });

    on<AluminiumHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(aluminiumHandlingAndDismantlingCosts: event.value));
      logger.d('aluminiumHandlingCosts changed to: ${event.value}');
    });

    on<RebarAndSteelScrapHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(
          rebarAndSteelScrapHandlingAndDismantlingCosts: event.value));
      logger.d('rebarAndSteelScrapHandlingCosts changed to: ${event.value}');
    });

    on<StainlessSteelHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(
          stainlessSteelHandlingAndDismantlingCosts: event.value));
      logger.d('stainlessSteelHandlingCosts changed to: ${event.value}');
    });

    on<CopperHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(copperHandlingAndDismantlingCosts: event.value));
      logger.d('copperHandlingCosts changed to: ${event.value}');
    });

    on<ConcreteBlocksHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(
          concreteBlocksHandlingAndDismantlingCosts: event.value));
      logger.d('concreteBlocksHandlingCosts changed to: ${event.value}');
    });
  }
}
