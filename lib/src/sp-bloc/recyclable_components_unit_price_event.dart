import 'package:bl_demolition_materials/bl_demolition_materials.dart';

abstract class RecyclableComponentsUnitPriceEvent {}

class WoodAndFiberboardDoorsUnitPriceChanged
    extends RecyclableComponentsUnitPriceEvent {
  final num? price;
  WoodAndFiberboardDoorsUnitPriceChanged(this.price);
}

class AluminumDoorsUnitPriceChanged extends RecyclableComponentsUnitPriceEvent {
  final num? price;
  AluminumDoorsUnitPriceChanged(this.price);
}

class SteelDoorsUnitPriceChanged extends RecyclableComponentsUnitPriceEvent {
  final num? price;
  SteelDoorsUnitPriceChanged(this.price);
}

class WoodenWindowsUnitPriceChanged extends RecyclableComponentsUnitPriceEvent {
  final num? price;
  WoodenWindowsUnitPriceChanged(this.price);
}

class SteelFrameWindowsUnitPriceChanged
    extends RecyclableComponentsUnitPriceEvent {
  final num? price;
  SteelFrameWindowsUnitPriceChanged(this.price);
}

class AluminumFrameWindowsUnitPriceChanged
    extends RecyclableComponentsUnitPriceEvent {
  final num? price;
  AluminumFrameWindowsUnitPriceChanged(this.price);
}

class PorcelainToiletsUnitPriceChanged
    extends RecyclableComponentsUnitPriceEvent {
  final num? price;
  PorcelainToiletsUnitPriceChanged(this.price);
}

class CabinetsAndFurnitureUnitPriceChanged
    extends RecyclableComponentsUnitPriceEvent {
  final num? price;
  CabinetsAndFurnitureUnitPriceChanged(this.price);
}

class PorcelainSinksUnitPriceChanged
    extends RecyclableComponentsUnitPriceEvent {
  final num? price;
  PorcelainSinksUnitPriceChanged(this.price);
}

class StainlessSteelSinksAndTablesUnitPriceChanged
    extends RecyclableComponentsUnitPriceEvent {
  final num? price;
  StainlessSteelSinksAndTablesUnitPriceChanged(this.price);
}

class SaunaStovesUnitPriceChanged extends RecyclableComponentsUnitPriceEvent {
  final num? price;
  SaunaStovesUnitPriceChanged(this.price);
}

class ElectricStovesUnitPriceChanged
    extends RecyclableComponentsUnitPriceEvent {
  final num? price;
  ElectricStovesUnitPriceChanged(this.price);
}

class RefrigeratorsUnitPriceChanged extends RecyclableComponentsUnitPriceEvent {
  final num? price;
  RefrigeratorsUnitPriceChanged(this.price);
}

class WaterAccumulatorsUnitPriceChanged
    extends RecyclableComponentsUnitPriceEvent {
  final num? price;
  WaterAccumulatorsUnitPriceChanged(this.price);
}

class ElectricMotorsUnitPriceChanged
    extends RecyclableComponentsUnitPriceEvent {
  final num? price;
  ElectricMotorsUnitPriceChanged(this.price);
}

class VentilationMachinesUnitPriceChanged
    extends RecyclableComponentsUnitPriceEvent {
  final num? price;
  VentilationMachinesUnitPriceChanged(this.price);
}

class RecyclableComponentsUnitPriceUpdated
    extends RecyclableComponentsUnitPriceEvent {
  final RecyclableComponentsUnitPrice unitPrice;
  RecyclableComponentsUnitPriceUpdated(this.unitPrice);
}
