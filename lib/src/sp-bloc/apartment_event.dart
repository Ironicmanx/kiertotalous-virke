import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class ApartmentEvent {}

class PcsPerHouseChanged extends ApartmentEvent {
  final int value;
  PcsPerHouseChanged(this.value);
}

class FloorAreaPerApartmentChanged extends ApartmentEvent {
  final num value;
  FloorAreaPerApartmentChanged(this.value);
}

class InnerWallsPerApartmentLinearMetersChanged extends ApartmentEvent {
  final num value;
  InnerWallsPerApartmentLinearMetersChanged(this.value);
}

class WallHeightChanged extends ApartmentEvent {
  final num value;
  WallHeightChanged(this.value);
}

class SurfaceMaterialChanged extends ApartmentEvent {
  final SurfaceMaterial? value;
  SurfaceMaterialChanged(this.value);
}

class FloorMaterialChanged extends ApartmentEvent {
  final FloorMaterial? value;
  FloorMaterialChanged(this.value);
}

class KitchenWallMaterialChanged extends ApartmentEvent {
  final KitchenWallMaterial? value;
  KitchenWallMaterialChanged(this.value);
}

class BathroomWallMaterialChanged extends ApartmentEvent {
  final BathroomWallMaterial? value;
  BathroomWallMaterialChanged(this.value);
}

class BathroomFloorMaterialChanged extends ApartmentEvent {
  final BathroomFloorMaterial? value;
  BathroomFloorMaterialChanged(this.value);
}

class KitchenWallMaterialAreaPerApartmentChanged extends ApartmentEvent {
  final num value;
  KitchenWallMaterialAreaPerApartmentChanged(this.value);
}

class KitchenClosetsInLinearMeterChanged extends ApartmentEvent {
  final num value;
  KitchenClosetsInLinearMeterChanged(this.value);
}

class AreKitchenClosetsRecyclableChanged extends ApartmentEvent {
  final bool value;
  AreKitchenClosetsRecyclableChanged(this.value);
}

class DressingClosetsInLinearMeterChanged extends ApartmentEvent {
  final num value;
  DressingClosetsInLinearMeterChanged(this.value);
}

class AreDressingClosetsRecyclableChanged extends ApartmentEvent {
  final bool value;
  AreDressingClosetsRecyclableChanged(this.value);
}

class BathroomWallAreaPerApartmentChanged extends ApartmentEvent {
  final num value;
  BathroomWallAreaPerApartmentChanged(this.value);
}

class BathroomFloorAreaPerApartmentChanged extends ApartmentEvent {
  final num value;
  BathroomFloorAreaPerApartmentChanged(this.value);
}

class SaunaPanelingAreaPerApartmentChanged extends ApartmentEvent {
  final num value;
  SaunaPanelingAreaPerApartmentChanged(this.value);
}

class ApartmentSpecificKitchenToiletOrSaunaFurnitureChanged
    extends ApartmentEvent {
  final num value;
  ApartmentSpecificKitchenToiletOrSaunaFurnitureChanged(this.value);
}

class IsFurnitureRecyclableChanged extends ApartmentEvent {
  final bool value;
  IsFurnitureRecyclableChanged(this.value);
}

class ToiletSeatChanged extends ApartmentEvent {
  final bool value;
  ToiletSeatChanged(this.value);
}

class CeramicSinkChanged extends ApartmentEvent {
  final bool value;
  CeramicSinkChanged(this.value);
}

class RefrigeratorChanged extends ApartmentEvent {
  final bool value;
  RefrigeratorChanged(this.value);
}

class ElectricStoveChanged extends ApartmentEvent {
  final bool value;
  ElectricStoveChanged(this.value);
}

class SteelTableChanged extends ApartmentEvent {
  final bool value;
  SteelTableChanged(this.value);
}

class WaterHeaterChanged extends ApartmentEvent {
  final bool value;
  WaterHeaterChanged(this.value);
}

class SaunaStoveChanged extends ApartmentEvent {
  final bool value;
  SaunaStoveChanged(this.value);
}
