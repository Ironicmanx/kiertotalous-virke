import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/log.dart';
import 'package:flutter_app/src/lp-bloc/fixed_furniture_event.dart';

class FixedFurnitureBloc extends Bloc<FixedFurnitureEvent, FixedFurniture> {
  FixedFurnitureBloc() : super(const FixedFurniture()) {
    on<FixedFurnitureRecyclableChanged>((event, emit) {
      logger.d("FixedFurnitureRecyclableChanged fired");
      emit(state.copyWith(isFurnitureRecyclable: event.isRecyclable));
    });

    on<PorcelainToiletsChanged>((event, emit) {
      logger.d("PorcelainToiletsChanged fired");
      emit(state.copyWith(porcelainToilets: event.value));
    });

    on<PorcelainSinksChanged>((event, emit) {
      logger.d("PorcelainSinksChanged fired");
      emit(state.copyWith(porcelainSinks: event.value));
    });

    on<SteelTablesChanged>((event, emit) {
      logger.d("SteelTablesChanged fired");
      emit(state.copyWith(steelTables: event.value));
    });

    on<KitchenClosetsChanged>((event, emit) {
      logger.d("KitchenClosetsChanged fired");
      emit(state.copyWith(kitchenClosetsWoodOrChipboard: event.value));
    });

    on<SteelLockerCabinetsChanged>((event, emit) {
      logger.d("SteelLockerCabinetsChanged fired");
      emit(state.copyWith(steelLockerCabinets: event.value));
    });

    on<ClothingClosetsChanged>((event, emit) {
      logger.d("ClothingClosetsChanged fired");
      emit(state.copyWith(clothingOrOtherClosetsWood: event.value));
    });

    on<ElectricStovesChanged>((event, emit) {
      logger.d("ElectricStovesChanged fired");
      emit(state.copyWith(electricStoves: event.value));
    });

    on<IndustrialElectricStovesChanged>((event, emit) {
      logger.d("IndustrialElectricStovesChanged fired");
      emit(state.copyWith(industrialElectricStoves: event.value));
    });

    on<ColdRoomCabinetsChanged>((event, emit) {
      logger.d("ColdRoomCabinetsChanged fired");
      emit(state.copyWith(coldRoomCabinets: event.value));
    });

    on<RefrigeratorsChanged>((event, emit) {
      logger.d("RefrigeratorsChanged fired");
      emit(state.copyWith(refrigerators: event.value));
    });

    on<SaunaStovesChanged>((event, emit) {
      logger.d("SaunaStovesChanged fired");
      emit(state.copyWith(saunaStoves: event.value));
    });
  }
}
