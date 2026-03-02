import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class YardRoofEvent {}

class RoofTypeChanged extends YardRoofEvent {
  final SmallPropertyRoofType? value;
  RoofTypeChanged(this.value);
}

class WaterRoofTypeChanged extends YardRoofEvent {
  final WaterRoofType? value;
  WaterRoofTypeChanged(this.value);
}

class LapelLengthChanged extends YardRoofEvent {
  final num? value;
  LapelLengthChanged(this.value);
}

class LapelWidthChanged extends YardRoofEvent {
  final num? value;
  LapelWidthChanged(this.value);
}

class CarportOrGarageChanged extends YardRoofEvent {
  final CarportOrGarage value;
  CarportOrGarageChanged(this.value);
}
