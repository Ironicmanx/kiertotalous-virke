// disposable_and_hazardous_notes_bloc.dart
import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/sp-bloc/disposable_and_hazardous_notes_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisposableAndHazardousNotesBloc extends Bloc<
    DisposableAndHazardousNotesEvent, DisposableAndHazardousNotes> {
  DisposableAndHazardousNotesBloc() : super(DisposableAndHazardousNotes()) {
    on<CeramicTileNotesChanged>((event, emit) {
      emit(state.copyWith(
        ceramicTilePorcelainAndGlassAndInsulationWoolNotes:
            event.ceramicTilePorcelainAndGlassAndInsulationWoolNotes,
      ));
    });

    on<BrickWasteNotesChanged>((event, emit) {
      emit(state.copyWith(
        nonRecyclableBrickWasteNotes: event.nonRecyclableBrickWasteNotes,
      ));
    });

    on<PlasterBoardNotesChanged>((event, emit) {
      emit(state.copyWith(
        nonRecyclablePlasterBoardNotes: event.nonRecyclablePlasterBoardNotes,
      ));
    });

    on<ContaminatedSoilNotesChanged>((event, emit) {
      emit(state.copyWith(
        contaminatedSoilNotes: event.contaminatedSoilNotes,
      ));
    });

    on<AsbestosConcreteNotesChanged>((event, emit) {
      emit(state.copyWith(
        concreteContainingAsbestosNotes: event.concreteContainingAsbestosNotes,
      ));
    });

    on<MineriteFeltNotesChanged>((event, emit) {
      emit(state.copyWith(
        mineriteOrFeltContainingAsbestosNotes:
            event.mineriteOrFeltContainingAsbestosNotes,
      ));
    });

    on<PcbPaintNotesChanged>((event, emit) {
      emit(state.copyWith(
        concreteContainingPcbPaintingNotes:
            event.concreteContainingPcbPaintingNotes,
      ));
    });
  }
}
