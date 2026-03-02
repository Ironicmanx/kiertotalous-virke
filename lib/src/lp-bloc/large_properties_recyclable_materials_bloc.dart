import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/lp-bloc/large_properties_recyclable_materials_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/log.dart';

class RecyclableMaterialsBloc
    extends Bloc<RecyclableMaterialsEvent, RecyclableComponentsAndFurniture> {
  RecyclableMaterialsBloc() : super(RecyclableComponentsAndFurniture()) {
    on<ConcreteFrameBeamsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(concreteFrameBeamsUnitPrice: event.value));
      logger.d('concreteFrameBeamsUnitPrice changed to ${event.value}');
    });
    on<ConcreteHollowSlabsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(concreteHollowSlabsUnitPrice: event.value));
      logger.d('concreteHollowSlabsUnitPrice changed to ${event.value}');
    });
    on<ConcreteRoofBeamsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(concreteRoofBeamsUnitPrice: event.value));
      logger.d('concreteRoofBeamsUnitPrice changed to ${event.value}');
    });
    on<ConcreteWallElementsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(concreteWallElementsUnitPrice: event.value));
      logger.d('concreteWallElementsUnitPrice changed to ${event.value}');
    });
    on<GlulamBeamsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(glulamBeamsUnitPrice: event.value));
      logger.d('glulamBeamsUnitPrice changed to ${event.value}');
    });
    on<FloorSupportWoodenBeamsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(floorSupportWoodenBeamsUnitPrice: event.value));
      logger.d('floorSupportWoodenBeamsUnitPrice changed to ${event.value}');
    });
    on<SteelFrameBeamsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(steelFrameBeamsUnitPrice: event.value));
      logger.d('steelFrameBeamsUnitPrice changed to ${event.value}');
    });
    on<RainGuttersAndDownspoutsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(rainGuttersAndDownspoutsUnitPrice: event.value));
      logger.d('rainGuttersAndDownspoutsUnitPrice changed to ${event.value}');
    });
    on<FireLaddersAndWalkwaysUnitPriceChanged>((event, emit) {
      emit(state.copyWith(fireLaddersAndWalkwaysUnitPrice: event.value));
      logger.d('fireLaddersAndWalkwaysUnitPrice changed to ${event.value}');
    });
    on<WoodenRoofTrussesUnitPriceChanged>((event, emit) {
      emit(state.copyWith(woodenRoofTrussesUnitPrice: event.value));
      logger.d('woodenRoofTrussesUnitPrice changed to ${event.value}');
    });
    on<SteelRoofTrussesUnitPriceChanged>((event, emit) {
      emit(state.copyWith(steelRoofTrussesUnitPrice: event.value));
      logger.d('steelRoofTrussesUnitPrice changed to ${event.value}');
    });
    on<SteelChainLinkFenceUnitPriceChanged>((event, emit) {
      emit(state.copyWith(steelChainLinkFenceUnitPrice: event.value));
      logger.d('steelChainLinkFenceUnitPrice changed to ${event.value}');
    });
    on<AluminumChainLinkFenceUnitPriceChanged>((event, emit) {
      emit(state.copyWith(aluminumChainLinkFenceUnitPrice: event.value));
      logger.d('aluminumChainLinkFenceUnitPrice changed to ${event.value}');
    });
    on<WoodAndFiberboardDoorsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(woodAndFiberboardDoorsUnitPrice: event.value));
      logger.d('woodAndFiberboardDoorsUnitPrice changed to ${event.value}');
    });
    on<AluminumDoorsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(aluminumDoorsUnitPrice: event.value));
      logger.d('aluminumDoorsUnitPrice changed to ${event.value}');
    });
    on<ExteriorAndFireExitSteelDoorsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(exteriorAndFireExitSteelDoorsUnitPrice: event.value));
      logger.d(
          'exteriorAndFireExitSteelDoorsUnitPrice changed to ${event.value}');
    });
    on<WoodenOrBoardCabinetsAndFurnitureUnitPriceChanged>((event, emit) {
      emit(state.copyWith(
          woodenOrBoardCabinetsAndFurnitureUnitPrice: event.value));
      logger.d(
          'woodenOrBoardCabinetsAndFurnitureUnitPrice changed to ${event.value}');
    });
    on<SteelLockerCabinetsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(steelLockerCabinetsUnitPrice: event.value));
      logger.d('steelLockerCabinetsUnitPrice changed to ${event.value}');
    });
    on<WoodenWindowsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(woodenWindowsUnitPrice: event.value));
      logger.d('woodenWindowsUnitPrice changed to ${event.value}');
    });
    on<PorcelainToiletsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(porcelainToiletsUnitPrice: event.value));
      logger.d('porcelainToiletsUnitPrice changed to ${event.value}');
    });
    on<PorcelainSinksUnitPriceChanged>((event, emit) {
      emit(state.copyWith(porcelainSinksUnitPrice: event.value));
      logger.d('porcelainSinksUnitPrice changed to ${event.value}');
    });
    on<StainlessSteelSinksAndTablesUnitPriceChanged>((event, emit) {
      emit(state.copyWith(stainlessSteelSinksAndTablesUnitPrice: event.value));
      logger
          .d('stainlessSteelSinksAndTablesUnitPrice changed to ${event.value}');
    });
    on<SaunaStovesUnitPriceChanged>((event, emit) {
      emit(state.copyWith(saunaStovesUnitPrice: event.value));
      logger.d('saunaStovesUnitPrice changed to ${event.value}');
    });
    on<ElectricStovesUnitPriceChanged>((event, emit) {
      emit(state.copyWith(electricStovesUnitPrice: event.value));
      logger.d('electricStovesUnitPrice changed to ${event.value}');
    });
    on<IndustrialElectricStovesUnitPriceChanged>((event, emit) {
      emit(state.copyWith(industrialElectricStovesUnitPrice: event.value));
      logger.d('industrialElectricStovesUnitPrice changed to ${event.value}');
    });
    on<RefrigeratorsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(refrigeratorsUnitPrice: event.value));
      logger.d('refrigeratorsUnitPrice changed to ${event.value}');
    });
    on<ColdRoomCabinetsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(coldRoomCabinetsUnitPrice: event.value));
      logger.d('coldRoomCabinetsUnitPrice changed to ${event.value}');
    });
    on<ElectricRadiatorsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(electricRadiatorsUnitPrice: event.value));
      logger.d('electricRadiatorsUnitPrice changed to ${event.value}');
    });
    on<SmallElectricalAccumulatorsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(smallElectricalAccumulatorsUnitPrice: event.value));
      logger
          .d('smallElectricalAccumulatorsUnitPrice changed to ${event.value}');
    });
    on<LargeElectricalAccumulatorsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(largeElectricalAccumulatorsUnitPrice: event.value));
      logger
          .d('largeElectricalAccumulatorsUnitPrice changed to ${event.value}');
    });
    on<ElectricMotorsAndCirculationPumpsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(
          electricMotorsAndCirculationPumpsUnitPrice: event.value));
      logger.d(
          'electricMotorsAndCirculationPumpsUnitPrice changed to ${event.value}');
    });
    on<VentilationUnitsUnitPriceChanged>((event, emit) {
      emit(state.copyWith(ventilationUnitsUnitPrice: event.value));
      logger.d('ventilationUnitsUnitPrice changed to ${event.value}');
    });
    on<ElectricalDistributionCabinetsAndMetersUnitPriceChanged>((event, emit) {
      emit(state.copyWith(
          electricalDistributionCabinetsAndMetersUnitPrice: event.value));
      logger.d(
          'electricalDistributionCabinetsAndMetersUnitPrice changed to ${event.value}');
    });
    on<RoofExhaustFansUnitPriceChanged>((event, emit) {
      emit(state.copyWith(roofExhaustFansUnitPrice: event.value));
      logger.d('roofExhaustFansUnitPrice changed to ${event.value}');
    });
  }
}
