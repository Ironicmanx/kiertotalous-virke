import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_app/src/sp-bloc/recyclable_materials_handling_and_dismantling_costs_event.dart';

class RecyclableMaterialsHandlingAndDismantlingCostsBloc extends Bloc<
    RecyclableMaterialsHandlingAndDismantlingCostsEvent,
    RecyclableMaterialsHandlingAndDismantlingCosts> {
  RecyclableMaterialsHandlingAndDismantlingCostsBloc()
      : super(RecyclableMaterialsHandlingAndDismantlingCosts()) {
    on<CleanSoilHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(cleanSoilHandlingAndDismantlingCosts: event.costs));
    });

    on<AsphaltWasteHandlingCostsChanged>((event, emit) {
      emit(
          state.copyWith(asphaltWasteHandlingAndDismantlingCosts: event.costs));
    });

    on<CleanConcreteHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(
          cleanConcreteHandlingAndDismantlingCosts: event.costs));
    });

    on<SteelHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(steelHandlingAndDismantlingCosts: event.costs));
    });

    on<WallAndRoofTilesHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(
          wallAndRoofTilesHandlingAndDismantlingCosts: event.costs));
    });

    on<CleanUsableWoodHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(
          cleanUsableWoodHandlingAndDismantlingCosts: event.costs));
    });

    on<CombustibleWoodWasteHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(
          combustibleWoodWasteHandlingAndDismantlingCosts: event.costs));
    });

    on<WindProtectionBoardHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(
          windProtectionBoardHandlingAndDismantlingCosts: event.costs));
    });

    on<GlassAndMineralWoolHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(
          glassAndMineralWoolHandlingAndDismantlingCosts: event.costs));
    });

    on<GypsumBoardsHandlingCostsChanged>((event, emit) {
      emit(
          state.copyWith(gypsumBoardsHandlingAndDismantlingCosts: event.costs));
    });

    on<ChipboardHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(chipboardHandlingAndDismantlingCosts: event.costs));
    });

    on<EnergyWasteHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(energyWasteHandlingAndDismantlingCosts: event.costs));
    });

    on<GlassHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(glassHandlingAndDismantlingCosts: event.costs));
    });

    on<AluminiumHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(aluminiumHandlingAndDismantlingCosts: event.costs));
    });

    on<RebarAndSteelScrapHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(
          rebarAndSteelScrapHandlingAndDismantlingCosts: event.costs));
    });

    on<StainlessSteelHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(
          stainlessSteelHandlingAndDismantlingCosts: event.costs));
    });

    on<CopperHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(copperHandlingAndDismantlingCosts: event.costs));
    });

    on<ConcreteBlocksHandlingCostsChanged>((event, emit) {
      emit(state.copyWith(
          concreteBlocksHandlingAndDismantlingCosts: event.costs));
    });

    on<RecyclableMaterialsHandlingCostsUpdated>((event, emit) {
      emit(event.costs);
    });
  }
}
