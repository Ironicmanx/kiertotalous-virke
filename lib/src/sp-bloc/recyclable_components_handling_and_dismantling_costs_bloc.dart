import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_app/src/sp-bloc/recyclable_components_handling_and_dismantling_costs_event.dart';

class RecyclableComponentsHandlingAndDismantlingCostsBloc extends Bloc<
    RecyclableComponentsHandlingAndDismantlingCostsEvent,
    RecyclableComponentsHandlingAndDismantlingCosts> {
  RecyclableComponentsHandlingAndDismantlingCostsBloc()
      : super(RecyclableComponentsHandlingAndDismantlingCosts()) {
    on<WoodAndFiberboardDoorsCostsChanged>((event, emit) {
      emit(state.copyWith(
          woodAndFiberboardDoorsHandlingAndDismantlingCosts: event.costs));
    });

    on<AluminumDoorsCostsChanged>((event, emit) {
      emit(state.copyWith(
          aluminumDoorsHandlingAndDismantlingCosts: event.costs));
    });

    on<SteelDoorsCostsChanged>((event, emit) {
      emit(state.copyWith(steelDoorsHandlingAndDismantlingCosts: event.costs));
    });

    on<WoodenWindowsCostsChanged>((event, emit) {
      emit(state.copyWith(
          woodenWindowsHandlingAndDismantlingCosts: event.costs));
    });

    on<SteelFrameWindowsCostsChanged>((event, emit) {
      emit(state.copyWith(
          steelFrameWindowsHandlingAndDismantlingCosts: event.costs));
    });

    on<AluminumFrameWindowsCostsChanged>((event, emit) {
      emit(state.copyWith(
          aluminumFrameWindowsHandlingAndDismantlingCosts: event.costs));
    });

    on<PorcelainToiletsCostsChanged>((event, emit) {
      emit(state.copyWith(
          porcelainToiletsHandlingAndDismantlingCosts: event.costs));
    });

    on<CabinetsAndFurnitureCostsChanged>((event, emit) {
      emit(state.copyWith(
          cabinetsAndFurnitureHandlingAndDismantlingCosts: event.costs));
    });

    on<PorcelainSinksCostsChanged>((event, emit) {
      emit(state.copyWith(
          porcelainSinksHandlingAndDismantlingCosts: event.costs));
    });

    on<StainlessSteelSinksAndTablesCostsChanged>((event, emit) {
      emit(state.copyWith(
          stainlessSteelSinksAndTablesHandlingAndDismantlingCosts:
              event.costs));
    });

    on<SaunaStovesCostsChanged>((event, emit) {
      emit(state.copyWith(saunaStovesHandlingAndDismantlingCosts: event.costs));
    });

    on<ElectricStovesCostsChanged>((event, emit) {
      emit(state.copyWith(
          electricStovesHandlingAndDismantlingCosts: event.costs));
    });

    on<RefrigeratorsCostsChanged>((event, emit) {
      emit(state.copyWith(
          refrigeratorsHandlingAndDismantlingCosts: event.costs));
    });

    on<WaterAccumulatorsCostsChanged>((event, emit) {
      emit(state.copyWith(
          waterAccumulatorsHandlingAndDismantlingCosts: event.costs));
    });

    on<ElectricMotorsCostsChanged>((event, emit) {
      emit(state.copyWith(
          electricMotorsHandlingAndDismantlingCosts: event.costs));
    });

    on<VentilationMachinesCostsChanged>((event, emit) {
      emit(state.copyWith(
          ventilationMachinesHandlingAndDismantlingCosts: event.costs));
    });

    on<RecyclableComponentsHandlingCostsUpdated>((event, emit) {
      emit(event.costs);
    });
  }
}
