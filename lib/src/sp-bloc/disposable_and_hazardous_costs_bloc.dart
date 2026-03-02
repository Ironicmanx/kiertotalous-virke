// disposable_and_hazardous_costs_bloc.dart
import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/src/sp-bloc/disposable_and_hazardous_costs_event.dart';

class DisposableAndHazardousCostsBloc extends Bloc<
    DisposableAndHazardousCostsEvent,
    DisposableAndHazardousDemolitionOrProcessingCosts> {
  DisposableAndHazardousCostsBloc()
      : super(DisposableAndHazardousDemolitionOrProcessingCosts()) {
    on<CeramicTileCostsChanged>((event, emit) {
      emit(state.copyWith(
        ceramicTilePorcelainAndGlassAndInsulationWoolDemolitionOrProcessingCosts:
            event
                .ceramicTilePorcelainAndGlassAndInsulationWoolDemolitionOrProcessingCosts,
      ));
    });

    on<BrickWasteCostsChanged>((event, emit) {
      emit(state.copyWith(
        nonRecyclableBrickWasteDemolitionOrProcessingCosts:
            event.nonRecyclableBrickWasteDemolitionOrProcessingCosts,
      ));
    });

    on<PlasterBoardCostsChanged>((event, emit) {
      emit(state.copyWith(
        nonRecyclablePlasterBoardDemolitionOrProcessingCosts:
            event.nonRecyclablePlasterBoardDemolitionOrProcessingCosts,
      ));
    });

    on<ContaminatedSoilCostsChanged>((event, emit) {
      emit(state.copyWith(
        contaminatedSoilDemolitionOrProcessingCosts:
            event.contaminatedSoilDemolitionOrProcessingCosts,
      ));
    });

    on<AsbestosConcreteCostsChanged>((event, emit) {
      emit(state.copyWith(
        concreteContainingAsbestosDemolitionOrProcessingCosts:
            event.concreteContainingAsbestosDemolitionOrProcessingCosts,
      ));
    });

    on<MineriteFeltCostsChanged>((event, emit) {
      emit(state.copyWith(
        mineriteOrFeltContainingAsbestosDemolitionOrProcessingCosts:
            event.mineriteOrFeltContainingAsbestosDemolitionOrProcessingCosts,
      ));
    });

    on<PcbPaintCostsChanged>((event, emit) {
      emit(state.copyWith(
        concreteContainingPcbPaintingDemolitionOrProcessingCosts:
            event.concreteContainingPcbPaintingDemolitionOrProcessingCosts,
      ));
    });
  }
}
