import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class ThermalCenterEvent {}

class OnDistrictOrDirectHeatingChanged extends ThermalCenterEvent {
  final bool value;
  OnDistrictOrDirectHeatingChanged(this.value);
}

class ConcreteLengthChanged extends ThermalCenterEvent {
  final num? value;
  ConcreteLengthChanged(this.value);
}

class ConcreteWidthChanged extends ThermalCenterEvent {
  final num? value;
  ConcreteWidthChanged(this.value);
}

class PlinthHeightChanged extends ThermalCenterEvent {
  final num? value;
  PlinthHeightChanged(this.value);
}

class WallHeightChanged extends ThermalCenterEvent {
  final num? value;
  WallHeightChanged(this.value);
}

class GarageWallMaterialChanged extends ThermalCenterEvent {
  final GarageWallMaterial? value;
  GarageWallMaterialChanged(this.value);
}

class RoofTypeChanged extends ThermalCenterEvent {
  final SmallPropertyRoofType? value;
  RoofTypeChanged(this.value);
}

class WaterRoofTypeChanged extends ThermalCenterEvent {
  final WaterRoofType? value;
  WaterRoofTypeChanged(this.value);
}

class RoofLengthChanged extends ThermalCenterEvent {
  final num? value;
  RoofLengthChanged(this.value);
}

class RoofFlatChanged extends ThermalCenterEvent {
  final num? value;
  RoofFlatChanged(this.value);
}

class AreRecyclableChanged extends ThermalCenterEvent {
  final bool value;
  AreRecyclableChanged(this.value);
}

class HeatingTypeChanged extends ThermalCenterEvent {
  final HeatingType? value;
  HeatingTypeChanged(this.value);
}

class PowerChanged extends ThermalCenterEvent {
  final num? value;
  PowerChanged(this.value);
}

class HeatingMachinesChanged extends ThermalCenterEvent {
  final num? value;
  HeatingMachinesChanged(this.value);
}

class WaterHeatersChanged extends ThermalCenterEvent {
  final num? value;
  WaterHeatersChanged(this.value);
}

class CarportOrGarageChanged extends ThermalCenterEvent {
  final CarportOrGarage? value;
  CarportOrGarageChanged(this.value);
}
