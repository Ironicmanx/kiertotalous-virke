import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_app/src/sp-bloc/recyclable_components_notes_event.dart';

class RecyclableComponentsNotesBloc
    extends Bloc<RecyclableComponentsNotesEvent, RecyclableComponentsNotes> {
  RecyclableComponentsNotesBloc() : super(RecyclableComponentsNotes()) {
    on<WoodAndFiberboardDoorsNotesChanged>((event, emit) {
      emit(state.copyWith(woodAndFiberboardDoorsNotes: event.notes));
    });

    on<AluminumDoorsNotesChanged>((event, emit) {
      emit(state.copyWith(aluminumDoorsNotes: event.notes));
    });

    on<SteelDoorsNotesChanged>((event, emit) {
      emit(state.copyWith(steelDoorsNotes: event.notes));
    });

    on<WoodenWindowsNotesChanged>((event, emit) {
      emit(state.copyWith(woodenWindowsNotes: event.notes));
    });

    on<SteelFrameWindowsNotesChanged>((event, emit) {
      emit(state.copyWith(steelFrameWindowsNotes: event.notes));
    });

    on<AluminumFrameWindowsNotesChanged>((event, emit) {
      emit(state.copyWith(aluminumFrameWindowsNotes: event.notes));
    });

    on<PorcelainToiletsNotesChanged>((event, emit) {
      emit(state.copyWith(porcelainToiletsNotes: event.notes));
    });

    on<CabinetsAndFurnitureNotesChanged>((event, emit) {
      emit(state.copyWith(cabinetsAndFurnitureNotes: event.notes));
    });

    on<PorcelainSinksNotesChanged>((event, emit) {
      emit(state.copyWith(porcelainSinksNotes: event.notes));
    });

    on<StainlessSteelSinksAndTablesNotesChanged>((event, emit) {
      emit(state.copyWith(stainlessSteelSinksAndTablesNotes: event.notes));
    });

    on<SaunaStovesNotesChanged>((event, emit) {
      emit(state.copyWith(saunaStovesNotes: event.notes));
    });

    on<ElectricStovesNotesChanged>((event, emit) {
      emit(state.copyWith(electricStovesNotes: event.notes));
    });

    on<RefrigeratorsNotesChanged>((event, emit) {
      emit(state.copyWith(refrigeratorsNotes: event.notes));
    });

    on<WaterAccumulatorsNotesChanged>((event, emit) {
      emit(state.copyWith(waterAccumulatorsNotes: event.notes));
    });

    on<ElectricMotorsNotesChanged>((event, emit) {
      emit(state.copyWith(electricMotorsNotes: event.notes));
    });

    on<VentilationMachinesNotesChanged>((event, emit) {
      emit(state.copyWith(ventilationMachinesNotes: event.notes));
    });

    on<ThermalBoilerNotesChanged>((event, emit) {
      emit(state.copyWith(thermalBoilerNotes: event.notes));
    });

    on<DistrictHeatingExchangerNotesChanged>((event, emit) {
      emit(state.copyWith(districtHeatingExchangerNotes: event.notes));
    });

    on<RecyclableComponentsNotesUpdated>((event, emit) {
      emit(event.notes);
    });
  }
}
