import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_app/src/sp-bloc/recyclable_components_unit_price_event.dart';

class RecyclableComponentsUnitPriceBloc extends Bloc<
    RecyclableComponentsUnitPriceEvent, RecyclableComponentsUnitPrice> {
  RecyclableComponentsUnitPriceBloc() : super(RecyclableComponentsUnitPrice()) {
    on<WoodAndFiberboardDoorsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(woodAndFiberboardDoorsUnitPrice: event.price));
    });

    on<AluminumDoorsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(aluminumDoorsUnitPrice: event.price));
    });

    on<SteelDoorsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(steelDoorsUnitPrice: event.price));
    });

    on<WoodenWindowsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(woodenWindowsUnitPrice: event.price));
    });

    on<SteelFrameWindowsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(steelFrameWindowsUnitPrice: event.price));
    });

    on<AluminumFrameWindowsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(aluminumFrameWindowsUnitPrice: event.price));
    });

    on<PorcelainToiletsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(porcelainToiletsUnitPrice: event.price));
    });

    on<CabinetsAndFurnitureUnitPriceChanged>((event, emit) {
      emit(state.copyWith(cabinetsAndFurnitureUnitPrice: event.price));
    });

    on<PorcelainSinksUnitPriceChanged>((event, emit) {
      emit(state.copyWith(porcelainSinksUnitPrice: event.price));
    });

    on<StainlessSteelSinksAndTablesUnitPriceChanged>((event, emit) {
      emit(state.copyWith(stainlessSteelSinksAndTablesUnitPrice: event.price));
    });

    on<SaunaStovesUnitPriceChanged>((event, emit) {
      emit(state.copyWith(saunaStovesUnitPrice: event.price));
    });

    on<ElectricStovesUnitPriceChanged>((event, emit) {
      emit(state.copyWith(electricStovesUnitPrice: event.price));
    });

    on<RefrigeratorsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(refrigeratorsUnitPrice: event.price));
    });

    on<WaterAccumulatorsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(waterAccumulatorsUnitPrice: event.price));
    });

    on<ElectricMotorsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(electricMotorsUnitPrice: event.price));
    });

    on<VentilationMachinesUnitPriceChanged>((event, emit) {
      emit(state.copyWith(ventilationMachinesUnitPrice: event.price));
    });

    on<RecyclableComponentsUnitPriceUpdated>((event, emit) {
      emit(event.unitPrice);
    });
  }
}
