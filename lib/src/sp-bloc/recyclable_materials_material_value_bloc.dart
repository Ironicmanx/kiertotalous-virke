import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/log.dart';

import 'recyclable_materials_material_value_event.dart';

class RecyclableMaterialsMaterialValueBloc extends Bloc<
    RecyclableMaterialsMaterialValueEvent, RecyclableMaterialsMaterialValue> {
  RecyclableMaterialsMaterialValueBloc()
      : super(RecyclableMaterialsMaterialValue()) {
    on<CleanSoilMaterialValueChanged>((event, emit) {
      emit(state.copyWith(cleanSoilMaterialValue: event.value));
      logger.d('cleanSoilMaterialValue changed to: ${event.value}');
    });

    on<AsphaltWasteMaterialValueChanged>((event, emit) {
      emit(state.copyWith(asphaltWasteMaterialValue: event.value));
      logger.d('asphaltWasteMaterialValue changed to: ${event.value}');
    });

    on<CleanConcreteMaterialValueChanged>((event, emit) {
      emit(state.copyWith(cleanConcreteMaterialValue: event.value));
      logger.d('cleanConcreteMaterialValue changed to: ${event.value}');
    });

    on<SteelMaterialValueChanged>((event, emit) {
      emit(state.copyWith(steelMaterialValue: event.value));
      logger.d('steelMaterialValue changed to: ${event.value}');
    });

    on<WallAndRoofTilesMaterialValueChanged>((event, emit) {
      emit(state.copyWith(wallAndRoofTilesMaterialValue: event.value));
      logger.d('wallAndRoofTilesMaterialValue changed to: ${event.value}');
    });

    on<CleanUsableWoodMaterialValueChanged>((event, emit) {
      emit(state.copyWith(cleanUsableWoodMaterialValue: event.value));
      logger.d('cleanUsableWoodMaterialValue changed to: ${event.value}');
    });

    on<CombustibleWoodWasteMaterialValueChanged>((event, emit) {
      emit(state.copyWith(combustibleWoodWasteMaterialValue: event.value));
      logger.d('combustibleWoodWasteMaterialValue changed to: ${event.value}');
    });

    on<WindProtectionBoardMaterialValueChanged>((event, emit) {
      emit(state.copyWith(windProtectionBoardMaterialValue: event.value));
      logger.d('windProtectionBoardMaterialValue changed to: ${event.value}');
    });

    on<GlassAndMineralWoolMaterialValueChanged>((event, emit) {
      emit(state.copyWith(glassAndMineralWoolMaterialValue: event.value));
      logger.d('glassAndMineralWoolMaterialValue changed to: ${event.value}');
    });

    on<GypsumBoardsMaterialValueChanged>((event, emit) {
      emit(state.copyWith(gypsumBoardsMaterialValue: event.value));
      logger.d('gypsumBoardsMaterialValue changed to: ${event.value}');
    });

    on<ChipboardMaterialValueChanged>((event, emit) {
      emit(state.copyWith(chipboardMaterialValue: event.value));
      logger.d('chipboardMaterialValue changed to: ${event.value}');
    });

    on<EnergyWasteMaterialValueChanged>((event, emit) {
      emit(state.copyWith(energyWasteMaterialValue: event.value));
      logger.d('energyWasteMaterialValue changed to: ${event.value}');
    });

    on<GlassMaterialValueChanged>((event, emit) {
      emit(state.copyWith(glassMaterialValue: event.value));
      logger.d('glassMaterialValue changed to: ${event.value}');
    });

    on<AluminiumMaterialValueChanged>((event, emit) {
      emit(state.copyWith(aluminiumMaterialValue: event.value));
      logger.d('aluminiumMaterialValue changed to: ${event.value}');
    });

    on<RebarAndSteelScrapMaterialValueChanged>((event, emit) {
      emit(state.copyWith(rebarAndSteelScrapMaterialValue: event.value));
      logger.d('rebarAndSteelScrapMaterialValue changed to: ${event.value}');
    });

    on<StainlessSteelMaterialValueChanged>((event, emit) {
      emit(state.copyWith(stainlessSteelMaterialValue: event.value));
      logger.d('stainlessSteelMaterialValue changed to: ${event.value}');
    });

    on<CopperMaterialValueChanged>((event, emit) {
      emit(state.copyWith(copperMaterialValue: event.value));
      logger.d('copperMaterialValue changed to: ${event.value}');
    });

    on<ConcreteBlocksMaterialValueChanged>((event, emit) {
      emit(state.copyWith(concreteBlocksMaterialValue: event.value));
      logger.d('concreteBlocksMaterialValue changed to: ${event.value}');
    });
  }
}
