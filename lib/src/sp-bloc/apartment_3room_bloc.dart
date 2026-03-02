import 'package:bl_demolition_materials/bl_demolition_materials.dart';
import 'package:flutter_app/src/sp-bloc/apartment_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Apartment3RoomBloc extends Bloc<ApartmentEvent, Apartment> {
  Apartment3RoomBloc() : super(Apartment()) {
    on<PcsPerHouseChanged>((event, emit) {
      emit(state.copyWith(pcsPerHouse: event.value));
    });
    on<FloorAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(floorAreaPerApartment: event.value));
    });
    on<InnerWallsPerApartmentLinearMetersChanged>((event, emit) {
      emit(state.copyWith(innerWallsPerApartmentLinearMeters: event.value));
    });
    on<WallHeightChanged>((event, emit) {
      emit(state.copyWith(wallHeight: event.value));
    });
    on<SurfaceMaterialChanged>((event, emit) {
      emit(state.copyWith(surfaceMaterial: event.value));
    });
    on<FloorMaterialChanged>((event, emit) {
      emit(state.copyWith(floorMaterial: event.value));
    });
    on<KitchenWallMaterialChanged>((event, emit) {
      emit(state.copyWith(kitchenWallMaterial: event.value));
    });
    on<BathroomWallMaterialChanged>((event, emit) {
      emit(state.copyWith(bathroomWallMaterial: event.value));
    });
    on<BathroomFloorMaterialChanged>((event, emit) {
      emit(state.copyWith(bathroomFloorMaterial: event.value));
    });
    on<KitchenWallMaterialAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(kitchenWallMaterialAreaPerApartment: event.value));
    });
    on<KitchenClosetsInLinearMeterChanged>((event, emit) {
      emit(state.copyWith(kitchenClosetsInLinearMeter: event.value));
    });
    on<AreKitchenClosetsRecyclableChanged>((event, emit) {
      emit(state.copyWith(areKitchenClosetsRecyclable: event.value));
    });
    on<DressingClosetsInLinearMeterChanged>((event, emit) {
      emit(state.copyWith(dressingClosetsInLinearMeter: event.value));
    });
    on<AreDressingClosetsRecyclableChanged>((event, emit) {
      emit(state.copyWith(areDressingClosetsRecyclable: event.value));
    });

    on<BathroomFloorAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(bathroomFloorAreaPerApartment: event.value));
    });
    on<BathroomWallAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(bathroomWallAreaPerApartment: event.value));
    });
    on<SaunaPanelingAreaPerApartmentChanged>((event, emit) {
      emit(state.copyWith(saunaPanelingAreaPerApartment: event.value));
    });
    on<ApartmentSpecificKitchenToiletOrSaunaFurnitureChanged>((event, emit) {
      emit(state.copyWith(
          apartmentSpecificKitchenToiletOrSaunaFurniture: event.value));
    });
    on<IsFurnitureRecyclableChanged>((event, emit) {
      emit(state.copyWith(isFurnitureRecyclable: event.value));
    });
    on<ToiletSeatChanged>((event, emit) {
      emit(state.copyWith(toiletSeat: event.value));
    });
    on<CeramicSinkChanged>((event, emit) {
      emit(state.copyWith(ceramicSink: event.value));
    });
    on<RefrigeratorChanged>((event, emit) {
      emit(state.copyWith(refrigerator: event.value));
    });
    on<ElectricStoveChanged>((event, emit) {
      emit(state.copyWith(electricStove: event.value));
    });
    on<SteelTableChanged>((event, emit) {
      emit(state.copyWith(steelTable: event.value));
    });
    on<WaterHeaterChanged>((event, emit) {
      emit(state.copyWith(waterHeater: event.value));
    });
    on<SaunaStoveChanged>((event, emit) {
      emit(state.copyWith(saunaStove: event.value));
    });
  }
}
