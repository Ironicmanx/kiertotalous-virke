import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/sp-bloc/recyclable_materials_note_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/log.dart';

class RecyclableMaterialsNotesBloc
    extends Bloc<RecyclableMaterialsNotesEvent, RecyclableMaterialsNotes> {
  RecyclableMaterialsNotesBloc() : super(RecyclableMaterialsNotes()) {
    on<CleanSoilNotesChanged>((event, emit) {
      emit(state.copyWith(cleanSoilNotes: event.notes));
      logger.d('cleanSoilNotes changed to: ${event.notes}');
    });

    on<AsphaltWasteNotesChanged>((event, emit) {
      emit(state.copyWith(asphaltWasteNotes: event.notes));
      logger.d('asphaltWasteNotes changed to: ${event.notes}');
    });

    on<CleanConcreteNotesChanged>((event, emit) {
      emit(state.copyWith(cleanConcreteNotes: event.notes));
      logger.d('cleanConcreteNotes changed to: ${event.notes}');
    });

    on<SteelNotesChanged>((event, emit) {
      emit(state.copyWith(steelNotes: event.notes));
      logger.d('steelNotes changed to: ${event.notes}');
    });

    on<WallAndRoofTilesNotesChanged>((event, emit) {
      emit(state.copyWith(wallAndRoofTilesNotes: event.notes));
      logger.d('wallAndRoofTilesNotes changed to: ${event.notes}');
    });

    on<CleanUsableWoodNotesChanged>((event, emit) {
      emit(state.copyWith(cleanUsableWoodNotes: event.notes));
      logger.d('cleanUsableWoodNotes changed to: ${event.notes}');
    });

    on<CombustibleWoodWasteNotesChanged>((event, emit) {
      emit(state.copyWith(combustibleWoodWasteNotes: event.notes));
      logger.d('combustibleWoodWasteNotes changed to: ${event.notes}');
    });

    on<WindProtectionBoardNotesChanged>((event, emit) {
      emit(state.copyWith(windProtectionBoardNotes: event.notes));
      logger.d('windProtectionBoardNotes changed to: ${event.notes}');
    });

    on<GlassAndMineralWoolNotesChanged>((event, emit) {
      emit(state.copyWith(glassAndMineralWoolNotes: event.notes));
      logger.d('glassAndMineralWoolNotes changed to: ${event.notes}');
    });

    on<GypsumBoardsNotesChanged>((event, emit) {
      emit(state.copyWith(gypsumBoardsNotes: event.notes));
      logger.d('gypsumBoardsNotes changed to: ${event.notes}');
    });

    on<ChipboardNotesChanged>((event, emit) {
      emit(state.copyWith(chipboardNotes: event.notes));
      logger.d('chipboardNotes changed to: ${event.notes}');
    });

    on<EnergyWasteNotesChanged>((event, emit) {
      emit(state.copyWith(energyWasteNotes: event.notes));
      logger.d('energyWasteNotes changed to: ${event.notes}');
    });

    on<GlassNotesChanged>((event, emit) {
      emit(state.copyWith(glassNotes: event.notes));
      logger.d('glassNotes changed to: ${event.notes}');
    });

    on<AluminiumNotesChanged>((event, emit) {
      emit(state.copyWith(aluminiumNotes: event.notes));
      logger.d('aluminiumNotes changed to: ${event.notes}');
    });

    on<RebarAndSteelScrapNotesChanged>((event, emit) {
      emit(state.copyWith(rebarAndSteelScrapNotes: event.notes));
      logger.d('rebarAndSteelScrapNotes changed to: ${event.notes}');
    });

    on<StainlessSteelNotesChanged>((event, emit) {
      emit(state.copyWith(stainlessSteelNotes: event.notes));
      logger.d('stainlessSteelNotes changed to: ${event.notes}');
    });

    on<CopperNotesChanged>((event, emit) {
      emit(state.copyWith(copperNotes: event.notes));
      logger.d('copperNotes changed to: ${event.notes}');
    });

    on<ConcreteBlocksNotesChanged>((event, emit) {
      emit(state.copyWith(concreteBlocksNotes: event.notes));
      logger.d('concreteBlocksNotes changed to: ${event.notes}');
    });
  }
}
